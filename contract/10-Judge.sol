// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Judge {
    function foo(uint256 x) public pure returns (uint256) {
        if (x < 10) {
            return 1;
        } else if (x > 10 && x < 20) {
            return 2;
        } else {
            return 3;
        }
    }

    function bar(uint256 x) public pure returns (uint256) {
        // 三目运算符
        return x < 10 ? 1 : 2;
    }
}
