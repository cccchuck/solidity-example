// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Constant {
    // constant 只能用于全局变量，同时这样做会省 Gas
    uint256 public constant price = 1000;

    function getPrice() public pure returns (uint256) {
        return price;
    }
}
