 // Goal of this lesson 
 // Get funds from users 
 // Withdaraw funds 
 // Set minimm funds in USD

 // SPFX-License-Identifier: MIT 
 pragma solidity ^0.8.8
 // this interface is used to give us the ABI, imported from github page
 import "@chainlink/contracts/src/v0.8/interface/Aggregatorv3Interface.sol"

 contract FundMe{
       
       uint256 public minimumUsd = 50
       
        function funds () public payable {
            require(msg.value > 1e18) 
            // msg.value = 18 decimal places

        } 

       
       
       
        // this is used to get the value of ETH in USD
        
        function getPrice  () public view returns (uint256){
        
        // ADDRESS 
         // ABI 
           AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e)
            // l
           (int price,,,,,) priceFeed.latestRoundData()
           //value returned will have eigjt decimal places behind it e.g $3000 ==== 300000000000 convert it to 18 decimal 

            return  uint256(price * 1e10)
            // CURRENTLY $3000
        }
        
       
       
        // this is used to convert the ETHERUM TO USD
        function getConversionRate  (uint80 ethAmount ) public view return(uint256){
                uint256 ethPrice = getPrice()
                uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18 ;
                return ethAmountInUsd
        }


        // function withdraw() {

        // }

 }
