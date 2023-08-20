// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {EasierToken} from "../src/EasierToken.sol";

contract DeployEasierToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (EasierToken) {
        vm.startBroadcast();
        EasierToken easierToken = new EasierToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return easierToken;
    }
}
