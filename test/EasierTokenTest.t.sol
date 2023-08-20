// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {EasierToken} from "../src/EasierToken.sol";
import {DeployEasierToken} from "../script/DeployEasierToken.s.sol";

contract EasierTokenTest is Test {
    EasierToken public easierToken;
    DeployEasierToken public deployer;

    address public bob = makeAddr("bob");
    address public alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployEasierToken();
        easierToken = deployer.run();

        vm.prank(msg.sender);
        easierToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(easierToken.balanceOf(bob), STARTING_BALANCE);
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;

        vm.prank(bob);
        easierToken.approve(alice, initialAllowance);
        assertEq(easierToken.allowance(bob, alice), initialAllowance);
    }
}
