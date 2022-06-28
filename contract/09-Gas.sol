// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Gas {
    // Gas 是一个计价单位
    // Gas = 消耗的 gas * gas 的价格
    // 消耗的 gas 可以由我们自己设置
    // gas 的价格由网络来决定
    // 当我们愿意消耗的 gas 消耗完时，如果 transaction 还没有完成，那么我们的 transaction 就会失败
    // transaction 失败的时候，Gas 并不会退回

    uint256 public i = 0;

    // 这个函数将会消耗完 gas，因为这个函数永远也不会执行完毕，除非 uint 溢出报错。
    function spendGas() public {
        while (true) {
            i += 1;
        }
    }
}
