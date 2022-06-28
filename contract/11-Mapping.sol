// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Mapping {
    // mapping 的声明方式为：mapping(keyType => valueType)
    // 其中 keyType 可以为任意的 build-in 类型
    // 其中 valueType 可以为任意的 build-in 类型或其他的 mapping 及 array
    mapping(address => uint256) public balance;

    function getBalance() public view returns (uint256) {
        return balance[msg.sender];
    }

    function setBalance(address _address, uint256 _balance) public {
        balance[_address] = _balance;
    }

    function delAccount(address _address) public {
        delete balance[_address];
    }
}

contract Nested {
    mapping(address => mapping(int256 => bool)) public accounts;

    function getSomething(int256 index) public view returns (bool) {
        return accounts[msg.sender][index];
    }

    function setSomething(int256 index, bool status) public {
        accounts[msg.sender][index] = status;
    }
}
