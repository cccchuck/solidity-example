// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Immutable {
    // immutable 和 constant 差不多，差别在于:
    // immutable 的数据可以在构造函数中更改
    // 除此之外，不可以更改
    address public immutable owner;
    uint256 public immutable price;

    constructor(uint256 _price) {
        owner = msg.sender;
        price = _price;
    }
}
