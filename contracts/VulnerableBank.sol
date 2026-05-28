// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// WARNING: INTENTIONALLY VULNERABLE — EDUCATIONAL USE ONLY
contract VulnerableBank {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // BUG IS HERE — external call happens BEFORE state update
    function withdraw() public {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No balance");
        (bool success, ) = msg.sender.call{value: amount}("");  // SENDS MONEY FIRST
        require(success, "Transfer failed");
        balances[msg.sender] = 0;  // UPDATES BALANCE AFTER — TOO LATE!
    }
}