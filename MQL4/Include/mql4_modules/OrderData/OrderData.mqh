//+------------------------------------------------------------------+
//|                                                    OrderData.mqh |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                        https://order-button.com/ |
//+------------------------------------------------------------------+
#property strict


#ifndef _LOAD_MODULE_ORDER_DATA
#define _LOAD_MODULE_ORDER_DATA


/** オーダー情報 */
struct OrderData
{
   int      ticket;
   string   symbol;
   int      type;
   double   lots;
   datetime open_time;
   double   open_price;
   double   stoploss;
   double   takeprofit;
   datetime close_time;
   double   close_price;
   datetime expiration;
   double   commission;
   double   swap;
   double   profit;
   string   comment;
   int      magic;
};


#endif
