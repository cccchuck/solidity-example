// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SelfError {
    // Error 抛出时，该 transaction 的所有更改都会撤销

    // require 常用在校验外部条件，如果条件不满足，则会抛出错误
    function testRequire(uint256 x) public pure {
        require(x >= 10, "arguments must greater than 10");
    }

    // revert 函数和 require 则相似，只不过是 revert 用于更加复杂的条件判断上
    function testRevert(uint256 x) public pure {
        if (x >= 0 && x < 10) {
            revert("arguments must greater than 10");
        }
    }

    uint256 i;

    // assert 函数用于校验内部数据，如果出错，则证明有 bug
    function testAssert() public view {
        assert(i == 0);
    }
}

// 也可以自定义 Error，会节省 Gas 费
contract account {
    mapping(address => uint256) public accountBalance;

    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function deposit(uint256 _balance) public {
        uint256 oldBalance = accountBalance[msg.sender];
        uint256 newBalance = oldBalance + _balance;
        require(newBalance > oldBalance, "Illegal");

        accountBalance[msg.sender] = newBalance;

        assert(accountBalance[msg.sender] == newBalance);
    }

    function getBalance() public view returns (uint256) {
        return accountBalance[msg.sender];
    }

    function withdraw(uint256 _amount) public {
        uint256 oldBalance = accountBalance[msg.sender];
        if (_amount > oldBalance) {
            revert InsufficientBalance({
                balance: oldBalance,
                withdrawAmount: _amount
            });
        }

        uint256 newBalance = oldBalance - _amount;
        accountBalance[msg.sender] = newBalance;

        assert(accountBalance[msg.sender] == newBalance);
    }
}
