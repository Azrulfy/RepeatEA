//+------------------------------------------------------------------+
//|                                                      structs.mqh |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, Keisuke Iwabuchi"
#property link      "https://order-button.com/"
#property strict


/** Information on order price. */
struct TradePrice
{
   ORDER_PRICE type;
   double      value;
};


/** Structure of OrderSend function. */
struct OrderSendRequest
{
   TRADE_SIGNAL type;
   double       lots;
   TradePrice   price;
   int          slippage;
   TradePrice   stoploss;
   TradePrice   takeprofit;
   string       comment;
   int          magic;
   datetime     expiration;
   color        arrow;
};


/** Structure of OrderClose function. */
struct OrderCloseRequest
{
   int    ticket;
   double lots;
   double price;
   int    slippage;
   color  arrow;
};


/** Structure of OrderModify function. */
struct OrderModifyRequest
{
   int    ticket;
   double price;
   double stoploss;
   double takeprofit;
   int    expiration;
   color  arrow;
};


/** Structure of OrderDelete function. */
struct OrderDeleteRequest
{
   int    ticket;
   color  arrow;
};
