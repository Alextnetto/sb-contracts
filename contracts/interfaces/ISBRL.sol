// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/token/ERC20/ERC20.sol";

interface ISBRL {
    function mint(address, uint256) external returns (bool);
}
