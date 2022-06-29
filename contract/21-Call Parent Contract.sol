// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract A {
    event Log(string message);

    function foo() public virtual {
        emit Log("A.foo is called");
    }

    function bar() public virtual {
        emit Log("A.bar is called");
    }
}

contract B is A {
    function foo() public virtual override {
        emit Log("B.foo is called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar is called");
        super.bar();
    }
}

contract C is A {
    function foo() public virtual override {
        emit Log("C.foo is called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar is called");
        super.bar();
    }
}

contract E is A {
    function foo() public virtual override {
        emit Log("E.foo is called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("E.bar is called");
        super.bar();
    }
}

contract D is E, B, C {
    function foo() public override(E, B, C) {
        super.foo();
    }

    // 多个继承对象时，当调用的方法中还包含 super 时，会从右向左调用方法；比如 C -> B -> E;
    function bar() public override(E, B, C) {
        super.bar();
    }
}
