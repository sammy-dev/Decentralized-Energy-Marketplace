// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract DecentralizedEnergyMarketplace {
    // Chainlink oracle interface for fetching energy prices
    AggregatorV3Interface public priceFeed;

    // Struct to represent a user
    struct User {
        address walletAddress;
        string username;
    }

    mapping(address => User) public users;

    // Struct to represent an energy token
    struct EnergyToken {
        uint256 tokenId;
        address owner;
        uint256 amount;
        uint256 price;
    }

    mapping(uint256 => EnergyToken) public energyTokens;
    uint256 public nextTokenId = 1;

    // Event emitted when an energy token is listed for sale
    event TokenListedForSale(uint256 indexed tokenId, address indexed seller, uint256 price);

    // Event emitted when an energy token is purchased
    event TokenPurchased(uint256 indexed tokenId, address indexed seller, address indexed buyer, uint256 price);

    // Constructor to initialize the Chainlink oracle address
    constructor(address _priceFeedAddress) {
        priceFeed = AggregatorV3Interface(_priceFeedAddress);
    }

    // Function to register a user
    function registerUser(string memory _username) external {
        // Ensure the user is not already registered
        require(users[msg.sender].walletAddress == address(0), "User already registered");

        // Add the user to the mapping
        users[msg.sender] = User(msg.sender, _username);
    }

    // Function to update user profile
    function updateProfile(string memory _newUsername) external {
        require(users[msg.sender].walletAddress != address(0), "User not registered");

        // Update user profile
        users[msg.sender].username = _newUsername;
    }

    // Function to create an energy token
    function createEnergyToken(uint256 _amount) external {
        energyTokens[nextTokenId] = EnergyToken(nextTokenId, msg.sender, _amount, 0);
        nextTokenId++;
    }

    // Function to list an energy token for sale
    function listTokenForSale(uint256 _tokenId, uint256 _price) external {
        require(energyTokens[_tokenId].owner == msg.sender, "Not token owner");

        // Set the token for sale and specify the price
        energyTokens[_tokenId].price = _price;

        // Emit an event to log the listing
        emit TokenListedForSale(_tokenId, msg.sender, _price);
    }

    // Function to buy an energy token
    function buyEnergyToken(uint256 _tokenId) external payable {
        // Ensure the token exists and is listed for sale
        require(energyTokens[_tokenId].owner != address(0), "Token does not exist");
        require(energyTokens[_tokenId].price > 0, "Token not listed for sale");
        require(msg.value == energyTokens[_tokenId].price, "Incorrect payment amount");

        address payable seller = payable(energyTokens[_tokenId].owner);

        // Transfer funds to seller
        seller.transfer(msg.value);

        // Transfer ownership of the token to the buyer
        energyTokens[_tokenId].owner = msg.sender;
        energyTokens[_tokenId].price = 0; // Remove the token from sale

        // Emit an event to log the purchase
        emit TokenPurchased(_tokenId, seller, msg.sender, msg.value);
    }

    // Fallback function to receive Ether
    receive() external payable {}
}
