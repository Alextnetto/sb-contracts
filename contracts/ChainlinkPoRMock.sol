// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./interfaces/AggregatorV3Interface.sol";

contract BRLProofOfReserveMock is AggregatorV3Interface {
    function decimals() external pure override returns (uint8) {
        return 18;
    }

    function description() external pure override returns (string memory) {
        return "Get the reserve of BRL in a bank";
    }

    function version() external pure override returns (uint256) {
        return 1;
    }

    function getRoundData(uint80 _roundId)
        public
        pure
        override
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        roundId = 1;
        answer = 1;
        startedAt = 1;
        updatedAt = 1;
        answeredInRound = 1;
    }

    function latestRoundData()
        public
        pure
        override
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        roundId = 1;
        answer = 1000;
        startedAt = 1;
        updatedAt = 1;
        answeredInRound = 1;
    }
}
