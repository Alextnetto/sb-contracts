// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../contracts/ChainlinkPoRMock.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.broadcast(deployerPrivateKey);

        BRLProofOfReserveMock brlProofOfReserveMock = new BRLProofOfReserveMock();

        vm.stopBroadcast();
    }
}
