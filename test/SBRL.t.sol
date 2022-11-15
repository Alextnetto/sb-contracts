// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../contracts/SBRL.sol";

contract SBRLTest is Test {
    SBRL public SBRLToken;

    uint256 ethPriceExpected = 2000;
    address owner = address(0x1);
    address user = address(0x2);
    address hacker = address(0x2);

    function setUp() public {
        vm.label(owner, "owner");
        vm.label(user, "user");
        vm.label(hacker, "hacker");
        vm.deal(owner, 10 ether);
        vm.deal(user, 10 ether);
        vm.startPrank(owner);

        SBRLToken = new SBRL();

        vm.stopPrank();
    }

    function testMintSBRL() public {
        vm.startPrank(owner);
        SBRLToken.mint(user, 1);

        assertEq(1, SBRLToken.balanceOf(user));
    }

    function testMintFailSBRL() public {
        vm.startPrank(hacker);
        vm.expectRevert(abi.encodePacked("Address not allowed to mint"));
        SBRLToken.mint(hacker, 1);
    }
}
