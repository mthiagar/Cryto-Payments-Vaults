// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

contract VaultContract {

    struct Vault {
        address creator;
        string name;
        address[] users;
        uint256 amount;  
    }

    uint256 totalVaults;
    mapping(uint256 => Vault) public vaults;
    mapping(address => uint256) public balance;

    event VaultDistribution(uint256 vaultId, uint256 amount);

    function createVault(
        string memory name, 
        address[] memory users, 
        uint256 initialAmount
        ) public returns (uint vaultId) {
            Vault storage vaults = vaults[totalVaults];

            vaults.creator = msg.sender;
            vaults.name = name;
            vaults.users = users;
            vaults.amount = initialAmount;

            totalVaults += 1;
            return totalVaults -1;
        }

        function addAmount(uint256 vaultId, uint256 amount) public {
            Vault storage vault = vaults[vaultId];
            require(msg.sender == vault.creator, "Not vault owner");
            vault.amount = amount;
        }

//add more distribute functions for jackpot winnings
//keep track of accounts that deposit into the vault, and amount deposited
//create function to select random winners
//need to keep track of total pool amount and/or time to trigger distribute

        function distribute(uint256 vaultId) public {
            Vault storage vault = vaults[vaultId];
            uint256 amountPerUser = vault.amount / vault.users.length;
            if (vault.amount !=0) {
                for (uint8 i; i < vault.users.length; i++) {
                    vault.amount -= amountPerUser;
                    balance[vault.users[i]] = amountPerUser;
                }
                } else {
                    revert("No funds available.");
                }
            emit VaultDistribution(vaultId, amountPerUser*vault.users.length);
                        }
        } 