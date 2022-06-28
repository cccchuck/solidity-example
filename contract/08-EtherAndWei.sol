// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EtherAndWei {
    // 交易全部使用 ether 进行支付
    // 就像 1 元 = 100 分一样，1 ether = 1e18 wei
    uint256 public oneWei = 1 wei;
    bool public isOneWei = oneWei == 1;

    uint256 public oneEther = 1 ether;
    bool public isOneEther = oneEther == 1e18 wei;
}
