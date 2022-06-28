// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Event {
    // Event 可以以一种较低的成本把某些信息存储在链上
    // 同时可以订阅事件，类似于 hook
    // 事件最多支持三个参数，使用 indexed 标记的参数，有利于过滤数据
    event Log(address indexed addr, string message);

    function emitEvent() public {
        emit Log(msg.sender, "Hello World");
    }
}
