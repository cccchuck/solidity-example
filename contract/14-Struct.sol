// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./14-1-StructDeclaration.sol";

contract Struct {
    Todo[] public todos;

    function create(string calldata _text) public {
        // 这里有三种办法去初始化 Todo 结构体
        // 第一种办法，调用 Todo 构造函数，按照顺序传入参数
        todos.push(Todo(_text, false));

        // 第二种办法，调用 Todo 构造函数，传入一个对象
        todos.push(Todo({text: _text, completed: false}));

        // 第三种办法，创建一个 todo 对象，因为 completed 会初始化为 false，所以不用管
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
