# POC-mcr

## Setup Guide:-

Step 1 : Install MetaMask Extension onto your Browser. 
Note: Mozilla FireFox recommended.

Step 2 : Setup an Account on MetaMask. Remember during the Account creation process, you will be given 10 words which will be unique to you, save those somewhere permanently as you'll need them to access MetaMask.

Step 3 : Set your Wallet onto the Rinkeby Test Network for the Smart Contract to work without needing any GAS.

Step 4 : Repeat Step 2 & 3 again, So that you now have two Accounts.

Step 5 : Open Remix IDE onto your Browser, Its an Online Solidity Ediotr which can directly connect to your wallet.

Step 6 : Open the MRC.sol file onto it, Complie on Remix (Select 0.4.12 for Compiler Version), choose Injected Web3 and Deploy the Contract.

Step 7 : Copy the Smart Contract Address & Paste in onto the ``line 222`` of the wallet.html

Step 8 : Install Http-Server to host the wallet.

```
npm install -g http-server
```

Step 9 : Open the site to whatever port your wallet was hosted.
