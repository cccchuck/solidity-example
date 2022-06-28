// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A {
    // 如果该方法需要被子合约重写，那么必须用 virtual 修饰
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// Solidity 继承的关键字是 is
contract B is A {
    // 重写父合约的方法必须使用 override 关键字
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// 也可以继承多个父合约
contract D is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}
