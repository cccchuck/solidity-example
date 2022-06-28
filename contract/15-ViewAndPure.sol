// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ViewAndPure {
    uint256 status = 0;

    // view 修饰符表示只读不写
    function getStatus() public view returns (uint256) {
        return status;
    }

    // pure 修饰符表示不读不写
    function getSum(uint256 x, uint256 y) public pure returns (uint256) {
        return x + y;
    }
}
