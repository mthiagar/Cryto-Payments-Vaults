// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract GoodsPayment   {

    // state variable. public, anyone can see who the owner is
    address payable public owner;
    uint totalCost;
    constructor() payable {
        owner = payable(msg.sender);
        totalCost = 2 ether;
    }
    
    modifier costs (uint costOfGoods) {
        require(msg.value >= costOfGoods, "Not enough Ether provided.");
     _; } 

    function getTotalCost() view public returns(uint) {
        return totalCost;
    }

    function payment() public payable costs(totalCost){
        //uint256 fee = ((2 * msg.value) / 100);
        (bool success,) = owner.call{value: msg.value}("");
        require(success, 'Failed to send Money');
    }
}
