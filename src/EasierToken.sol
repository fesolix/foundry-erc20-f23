// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract EasierToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Easier Token", "ET") {
        _mint(msg.sender, initialSupply);
    }
}
