# first-nft-contract

Your first NFT smart contract. A simple, heavily commented ERC-721
contract for beginners learning Solidity — plus a guide to deploy it
on a testnet for free.

## What is in here?

| File | What it is |
| ---- | ---------- |
| `MyFirstNFT.sol` | A minimal ERC-721 NFT contract (name, symbol, mint, max supply, metadata URI). Every line is commented so you can learn how it works. |

## The contract, in plain English

- **ERC-721** is the standard for NFTs on Ethereum-compatible chains.
  Each token has a unique id and an owner.
- **Minting** creates a new NFT and gives it to an address. Here, only
  the contract owner can mint, and only up to `maxSupply` (100).
- **Metadata** (name, image, description) is not stored on-chain.
  Instead, each token points to a metadata file at
  `baseURI + tokenId`, for example `https://example.com/metadata/1`.
  You host those files yourself (for example on IPFS).
- **Ownable** means one address (the deployer) has special powers:
  minting and changing the base URI.

## Deploy it (Remix, testnet, free)

1. Open [Remix](https://remix.ethereum.org) in your browser.
2. Create a new file, paste in `MyFirstNFT.sol`.
3. Compile it (Solidity 0.8.20+). Remix fetches OpenZeppelin
   automatically from the imports.
4. Go to "Deploy & run transactions". Choose "Injected Provider" and
   connect a wallet that holds **testnet** tokens (for example BSC
   Testnet or Sepolia). Use a **separate testnet wallet**.
5. Deploy with a base URI argument, for example
   `https://example.com/metadata/` (it must end with `/`).
6. Call `mint(yourWalletAddress)` to create your first NFT.

You can view it on the testnet explorer by searching for your
contract address.

## After deploying

- **Do not use this with real funds or real users.** It is a learning
  contract: no allowlist, no royalties, no marketplace, no audit.
- If you want to learn more, read the OpenZeppelin docs for
  [ERC721](https://docs.openzeppelin.com/contracts/5.x/erc721) and
  [Ownable](https://docs.openzeppelin.com/contracts/5.x/access#ownership).

## Safety

- This repo contains **no private keys, seed phrases, or API keys**.
- Never deploy with a wallet that holds real funds. Use a testnet and
  a separate test wallet.
- Never share your seed phrase or private key with anyone — including
  a website that claims it needs them to deploy a contract.
