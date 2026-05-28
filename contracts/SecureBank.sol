// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// SECURE VERSION — Checks-Effects-Interactions pattern
contract SecureBank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No balance");
        balances[msg.sender] = 0;                              // 1. UPDATE STATE FIRST
        (bool success, ) = msg.sender.call{value: amount}(""); // 2. THEN SEND MONEY
        require(success, "Transfer failed");
    }
}