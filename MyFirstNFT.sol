// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// MyFirstNFT — a beginner-friendly ERC-721 NFT contract.
//
// What this contract does:
//   - Creates a collection of NFTs with a name and symbol.
//   - Lets the owner mint new NFTs (up to a max supply).
//   - Each NFT has a token URI pointing to its metadata (image, name,
//     description) hosted off-chain, for example on IPFS.
//
// How to use it (see README.md for the full guide):
//   1. Open Remix (https://remix.ethereum.org) and paste this file.
//   2. Compile it, then deploy it to a testnet (for example BSC Testnet
//      or Sepolia) with your own wallet. Deployment costs test tokens
//      only — never deploy with real funds until you understand it.
//   3. Call mint() to create your first NFT.
//
// This contract uses OpenZeppelin, the standard audited library for
// smart contracts. In Remix, the imports below are fetched
// automatically. For a local project, install it with:
//   npm install @openzeppelin/contracts
//
// SECURITY: This is a learning contract, not production code. It has
// no allowlist, no royalties, and no marketplace logic. Do not use it
// with real funds or real users without a proper audit.

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyFirstNFT is ERC721, Ownable {
    // --- State ---
    // The next token id to mint. Starts at 1 so the first NFT is #1.
    uint256 public nextTokenId = 1;

    // The maximum number of NFTs that can ever exist in this collection.
    uint256 public maxSupply = 100;

    // The base URI for token metadata. Each token's metadata lives at
    // baseURI + tokenId, for example:
    //   https://example.com/metadata/1
    string private _baseTokenURI;

    // --- Constructor ---
    // Runs once when the contract is deployed. Sets the collection
    // name ("MyFirstNFT") and symbol ("MFN"), and records the deployer
    // as the owner. The base URI is passed in at deploy time.
    constructor(string memory baseURI_) ERC721("MyFirstNFT", "MFN") Ownable(msg.sender) {
        _baseTokenURI = baseURI_;
    }

    // --- Minting ---
    // Creates one new NFT and sends it to `to`.
    // Only the owner can call this (the `onlyOwner` modifier).
    // It reverts if the max supply is reached.
    function mint(address to) external onlyOwner {
        require(nextTokenId <= maxSupply, "Max supply reached");
        uint256 tokenId = nextTokenId;
        nextTokenId += 1;
        _safeMint(to, tokenId);
    }

    // --- Metadata ---
    // Returns the base URI. OpenZeppelin's ERC721 builds each token's
    // full URI as baseURI + tokenId.
    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }

    // --- Owner controls ---
    // Let the owner update the base URI (for example, if you move your
    // metadata to a new host). Only the owner can call this.
    function setBaseURI(string memory newBaseURI) external onlyOwner {
        _baseTokenURI = newBaseURI;
    }
}
