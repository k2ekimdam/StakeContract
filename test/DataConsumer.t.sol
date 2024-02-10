//SPDX-Licence-Identifier:MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/DataConsumerV3.sol";
import "../src/mocks/MockV3Aggregator.sol";

contract PriceConsumerTest is DSTest {
    DataConsumerV3 public dataConsumer;
    MockV3Aggregator public mockV3Aggregator;
    uint8 public constant DECIMALS = 18;
    int256 public constant INIT_ANSWER = 1 * 10 ** 18;

    function setUp() public {
        mockV3Aggregator = new MockV3Aggregator(DECIMALS, INIT_ANSWER);
        dataConsumer = new DataConsumerV3(address(mockV3Aggregator));
    }

    function testConsumerReturnsStartingValue() public {
        int256 price = dataConsumer.getChainlinkDataFeedLatestAnswer();
        assertTrue(price == INIT_ANSWER);
    }
}
