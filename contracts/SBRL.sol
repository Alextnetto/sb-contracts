// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "openzeppelin-contracts/token/ERC20/ERC20.sol";
import "./interfaces/ISBRL.sol";
import "./interfaces/AggregatorV3Interface.sol";

contract SBRL is ISBRL, ERC20 {
    mapping(address => bool) private minters;
    address private immutable owner;

    AggregatorV3Interface proofOfReserveOracle;

    constructor(address _oracle) ERC20("Stable Brazilian Real", "SBRL") {
        owner = msg.sender;
        proofOfReserveOracle = AggregatorV3Interface(_oracle);
        setMinter(owner, true);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this");
        _;
    }

    modifier onlyMinter() {
        require(minters[msg.sender], "Address not allowed to mint");
        _;
    }

    function setMinter(address minter, bool enableMinting) public onlyOwner {
        minters[minter] = enableMinting;
    }

    function mint(address to, uint256 amount) public onlyMinter returns (bool) {
        (, int256 reserve, , , ) = proofOfReserveOracle.latestRoundData();
        require(totalSupply() + amount <= uint256(reserve));
        _mint(to, amount);
        return true;
    }
}
