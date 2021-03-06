//+------------------------------------------------------------------+
//|                                                        enums.mqh |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Keisuke Iwabuchi"
#property link      "https://order-button.com/"
#property strict


/** Operation type. */
enum TRADE_SIGNAL
{
   BUY        =  0, // Market Buy order
   SELL       =  1, // Market Sell order
   BUY_LIMIT  =  2, // Buy Limit pending order
   SELL_LIMIT =  3, // Sell Limit pending order
   BUY_STOP   =  4, // Buy Stop pending order
   SELL_STOP  =  5  // Sell Stop pending order
};


/** Price calculation type. */
enum ORDER_PRICE
{
   DYNAMIC_PRICE = 0,
   DYNAMIC_PIPS  = 1,
   STATIC_PRICE  = 2
};
