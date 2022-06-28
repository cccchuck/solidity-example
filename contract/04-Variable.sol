// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Variable {
    // 这里的变量将会存储在链上
    string public text = "Hello";

    function getBlockTime() public view returns (uint256) {
        // 局部变量不会存储在链上
        uint256 unit = 1000;

        uint256 timestamp = block.timestamp * unit;

        return timestamp;
    }

    function getCallerAddr() public view returns (address) {
        return msg.sender;
    }
}
