// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../contracts/SBRL.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.broadcast(deployerPrivateKey);

        SBRL SBRLToken = new SBRL(
            address(0x62e6ba0FFEb7404ef666c58B66B739A4CEd5B013)
        );

        vm.stopBroadcast();
    }
}
