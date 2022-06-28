// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Modifier {
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    // 函数修饰符可以用来对函数进行限制
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner have access");
        // _ 是一个特殊的字符，它用于告诉 solidity 可以继续往下执行了
        _;
    }

    modifier validAddress(address _address) {
        require(_address != address(0), "Illegal address");
        _;
    }

    modifier noReentrancy() {
        require(!locked, "No Reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function changeOwner(address newOwnerAddress)
        public
        onlyOwner
        validAddress(newOwnerAddress)
    {
        owner = newOwnerAddress;
    }

    function dec(uint256 i) public noReentrancy {
        x -= i;

        if (i > 1) {
            dec(i - 1);
        }
    }
}
