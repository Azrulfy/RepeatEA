//+------------------------------------------------------------------+
//|                                                 TimerTradeEA.mq4 |
//|                                 Copyright 2017, Keisuke Iwabuchi |
//|                                         http://order-button.com/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Keisuke Iwabuchi"
#property link      "http://order-button.com/"
#property version   "1.01"
#property strict


#include <mql4_modules\Order\Order.mqh>
#include <mql4_modules\Trade\Trade.mqh>


enum TradeType {
   Buy = 0,
   Sell = 1
};


input  TradeType Type        = Buy;   // 取引種別 (Buy or Sell)
input  double    EntryPrice  = 110.0; // エントリー価格
input  double    TPPrice     = 110.1; // 利食い価格
sinput int       MagicNumber = 127;   // マジックナンバー
input  double    Lots        = 0.1;   // 取引数量
sinput int       Slippage    = 10;    // スリッページ (point)


int OnInit()
{
   Comment(
      "Entry Price : ", EntryPrice, "\n",
      "TP Price : ", TPPrice
   );

   return(INIT_SUCCEEDED);
}


void OnDeinit(const int reason)
{
   if (!IsVisualMode()) {
      Comment("");
   }
}


void OnTick()
{
   OpenPositions pos;
   Order::getOrderCount(pos, MagicNumber);
   
   if (pos.open_pos == 0) {
      OnEntry();
   }
}


void OnEntry()
{
   // 取引パラメーターの設定
   OrderSendRequest request;
   
   if (Type == Buy) {
      if (EntryPrice < Ask) {
         return;
      }
   
      request.type = BUY;
      request.arrow = clrBlue;
   } else {
      if (EntryPrice > Bid) {
         return;
      }
   
      request.type = SELL;
      request.arrow = clrRed;
   }
   request.price.type = DYNAMIC_PRICE;
   request.lots = Lots;
   request.slippage = Slippage;
   request.stoploss.type = STATIC_PRICE;
   request.stoploss.value = 0;
   request.takeprofit.type = STATIC_PRICE;
   request.takeprofit.value = TPPrice;
   request.magic = MagicNumber;
   request.comment = "TimerTradeEA";
   
   
   // 発注
   Trade::Entry(request);
}
