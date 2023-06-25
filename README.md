# Crowdfunding-Contract
This repository contains a simple crowdfunding contract written in Solidity. The contract allows contributors to deposit funds towards a target goal. If the goal is not reached within a deadline, contributors can get a refund of their contributions.

## Features
- Setting a target goal and deadline for the crowdfunding project.

- Accepting contributions that are greater than a minimum value.

- A refund function that allows contributors to retrieve their contributions if the target is not met by the
  deadline.

- Creation of requests for fund withdrawals from the contract balance by the manager.

- Voting system that allows contributors to vote on withdrawal requests.

- Function to make payments based on approved withdrawal requests.

## Technologies Used
- Solidity for the smart contract

- Remix IDE for deploying the smart contract

# Getting Started
## Prerequisites
- Basic knowledge of Solidity and Ethereum smart contracts

- Remix IDE for deploying the smart contract

## Running the Contract on the Ethereum Test Network

- Step 1

  Clone this repository to your local machine using git clone https://github.com/rkedida/Crowdfunding-Contract.git

- Step 2

  Navigate to the Remix IDE in your web browser.

- Step 3

  In the Remix IDE, click on the file icon on the top left to see the file explorer.

- Step 4

  Click on the "+" icon to create a new file. Name the file CrowdFunding.sol and paste the content of the smart
  contract from the repo you cloned.

- Step 5

  Click on the second icon from the top on the left side panel (Solidity icon) to navigate to the Solidity compiler.

- Step 6

  Click on "Compile CrowdFunding.sol" to compile the smart contract.

- Step 7

  After compiling, click on the third icon from the top on the left side panel (Deploy & run transactions) to
  navigate to the deployment section.

- Step 8

  Under the "Deploy & run transactions" section, select the appropriate environment (JavaScript VM, Injected Web3
  or Web3 Provider), select the contract CrowdFunding and enter the constructor parameters to deploy the contract
  to the Ethereum network.

# Interacting with the Contract
Once deployed, you can interact with the contract using the deployed contracts section in the Remix IDE. Use the appropriate functions to send Ether, create requests, vote for requests, and make payments.

# Contributing
Contributions, issues, and feature requests are welcome! 
