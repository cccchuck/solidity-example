// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Faucet {
    address public owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "No have access");
        _;
    }

    event Deposit(address sender, uint256 amount, uint256 balance);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    function changeOwner(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid Address");
        owner = _newOwner;
    }

    function withdraw() public onlyOwner {
        uint256 amount = address(this).balance;
        (bool sent, ) = owner.call{value: amount}("");
        require(sent, "Withdraw Failed");
    }
}
