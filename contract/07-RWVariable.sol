// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract RWVariable {
    uint256 public price = 0;

    function setPublic(uint256 _price) public {
        price = _price;
    }

    function getPublic() public view returns (uint256) {
        return price;
    }
}
