pragma solidity ^0.4.11;
 
contract MRC_ico {
 
    // Introducing the maximum number of MRC available for sale
    uint public max_MRC = 1000000;
 
    // Introducing the USD to MRC conversion rate
    uint public usd_to_MRC = 1000;
 
    // Introducing the total number of MRC that have been bought by the investors
    uint public total_MRC_bought = 0;
 
    // Mapping from the investor address to its equity in MRC and USD
    mapping(address => uint) equity_MRC;
    mapping(address => uint) equity_usd;
 
    // Checking if an investor can buy MRC
    modifier can_buy_MRC(uint usd_invested) {
        require (usd_invested * usd_to_MRC + total_MRC_bought <= max_MRC);
        _;
    }
 
    // Getting the equity in MRC of an investor
    function equity_in_MRC(address investor) external constant returns (uint){
        return equity_MRC[investor];
    }
 
    // Getting the equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint){
        return equity_usd[investor];
    }
 
    // Buying MRC
    function buy_MRC(address investor, uint usd_invested) external 
    can_buy_MRC(usd_invested) {
        uint MRC_bought = usd_invested * usd_to_MRC;
        equity_MRC[investor] += MRC_bought;
        equity_usd[investor] = equity_MRC[investor] / 1000;
        total_MRC_bought += MRC_bought;
    }
 
    // Selling MRC
    function sell_MRC(address investor, uint MRC_sold) external {
        equity_MRC[investor] -= MRC_sold;
        equity_usd[investor] = equity_MRC[investor] / 1000;
        total_MRC_bought -= MRC_sold;
    }
    
    //Transfer MRC
    function transfer_MRC(address investor, uint MRC_sold, address reciever) external {
        equity_MRC[investor] -= MRC_sold;
        equity_usd[investor] = equity_MRC[investor] / 1000;
        equity_MRC[reciever] += MRC_sold;
        equity_usd[reciever] = equity_MRC[reciever] / 1000;

    }
}