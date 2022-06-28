// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./13-1-EnumDeclaration.sol";

contract Enum {
    // 默认值就是 enum 的第一个值，在这个合约中也就是 Pending
    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    // delete 会将 status 重置，也就是 Pending
    function reset() public {
        delete status;
    }
}
