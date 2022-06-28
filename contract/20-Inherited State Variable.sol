// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A {
    string public name = "Jason";

    function getName() public view returns (string memory) {
        return name;
    }
}

contract C is A {
    // 继承合约静态变量的方式为：在构造函数中重新进行赋值
    constructor() {
        name = "Chuck";
    }
}
