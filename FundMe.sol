// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    mapping(address => uint256) public addressToAmountFunded;
    
    function fund()public payable{
        
        addressToAmountFunded[msg.sender] += msg.value;    
    }
    
    function getVersion() public view returns(uint256){
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
         return priceFeed.version();
    }
    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    //     ( uint80 roundId,
    //   int256 answer,
    //   uint256 startedAt,
    //   uint256 updatedAt,
    //   uint80 answeredInRound
    //     ) = priceFeed.latestRoundData() ;
    (,int256 answer,,,) = priceFeed.latestRoundData() ;
        return uint256(answer*10000000000);
    }
    
    
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd;
    }
}