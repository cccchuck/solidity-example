// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ReceiveEther {
    // 当向合约发送 ETH 的时候
    // 如果 msg.data 为空且存在 receive 方法，则调用 receive 方法，否则调用 fallback 方法
    receive() external payable {}

    fallback() external payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // 这个方法不推荐使用，消耗的成本较高
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // send 方法返回一个 boolean 来表示是否发送成功
        // 该方法消耗成本也较高，不推荐使用
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // call 方法也返回一个 boolean 来表示是否发送成功
        // 目前推荐使用该方法来发送 ETH
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
