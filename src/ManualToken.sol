// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract ManualToken {
    mapping(address => uint256) s_balance;

    string public name = "Manual Token";
    string public symbol = "MT";

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balance[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(s_balance[msg.sender] >= _value);
        s_balance[msg.sender] -= _value;
        s_balance[_to] += _value;
        return true;
    }
}
