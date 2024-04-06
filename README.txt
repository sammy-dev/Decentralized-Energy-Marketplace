 Decentralized Energy Marketplace

## Overview
The Decentralized Energy Marketplace is a smart contract deployed on the Ethereum blockchain, facilitating the trading of energy tokens among users. Leveraging Chainlink oracles, it fetches real-time energy prices to ensure transparency and reliability in energy token transactions. Users can register, create, list, and purchase energy tokens securely and efficiently through this decentralized platform.

## Features
- **Registration**: Users can register on the platform by providing their wallet address and a username.
- **User Profile Management**: Users can update their profile by changing their username.
- **Energy Token Creation**: Users can create energy tokens representing their energy production.
- **Token Listing**: Owners of energy tokens can list them for sale, specifying the price.
- **Token Purchase**: Users can buy energy tokens listed for sale by transferring the specified amount of Ether.
- **Price Oracle Integration**: The contract integrates with Chainlink oracles to fetch real-time energy prices.
- **Event Logging**: Events are emitted for token listing and purchase, providing transparency and auditability.

## Smart Contract Structure
- **User Struct**: Represents a user, containing fields for wallet address and username.
- **EnergyToken Struct**: Represents an energy token, containing fields for token ID, owner address, amount, and price.
- **Mappings**: Maps user addresses to user structs and token IDs to energy token structs.
- **Events**: Emits events for token listing and purchase.
- **Constructor**: Initializes the Chainlink oracle address.
- **Registration and Profile Management**: Functions for user registration and profile management.
- **Token Creation, Listing, and Purchase**: Functions for creating, listing, and purchasing energy tokens.
- **Fallback Function**: Fallback function to receive Ether.

## Deployment
The contract can be deployed on the Ethereum blockchain using tools like Remix, Truffle, or Hardhat. Ensure that the Chainlink oracle address is provided during deployment to enable price feed integration.

## Usage
1. Users register on the platform using the `registerUser` function.
2. Energy producers create energy tokens using the `createEnergyToken` function.
3. Owners of energy tokens list them for sale using the `listTokenForSale` function.
4. Buyers purchase energy tokens listed for sale using the `buyEnergyToken` function.
5. Real-time energy prices are fetched via Chainlink oracles for transparent pricing.

## Future Enhancements
- Integration with additional oracle networks for broader price coverage.
- Implementation of governance mechanisms for community voting and decision-making.
- Addition of escrow functionality to enhance security in token transactions.
- Integration with decentralized finance (DeFi) protocols for lending and borrowing against energy tokens.

## Conclusion
The Decentralized Energy Marketplace offers a transparent, efficient, and decentralized platform for trading energy tokens. By leveraging blockchain technology and Chainlink oracles, it addresses issues of centralization and inefficiency in traditional energy markets, paving the way for a decentralized energy ecosystem.
