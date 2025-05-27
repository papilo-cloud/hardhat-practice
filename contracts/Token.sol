// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "hardhat/console.sol";

contract Token {
    string public name = "My SU Token";
    string public symbol = "SU";

    uint public totalSupply = 100000;
    address public owner;

    mapping(address => uint) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
        console.log('Owner: %s', msg.sender);
        owner = msg.sender;
    }

    function transfer(address to, uint amount) external {
        console.log(
            "Trying to send %s tokens from %s to %s",
            amount,
            msg.sender,
            to
        );
        console.log("Initial sender balance: %s tokens", balances[msg.sender]);
        
        require(balances[msg.sender] >= amount, "not enough tokens");
        balances[msg.sender] -= amount;
        balances[to] += amount;

        console.log("Final sender balance: %s tokens", balances[msg.sender]);
    }

    function balanceOf(address account) external view returns(uint) {
        return balances[account];
    }
}