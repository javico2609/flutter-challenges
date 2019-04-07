import 'package:flutter/foundation.dart';

class RateModel {
  double buy;
  double sell;

  RateModel({
    @required this.buy,
    @required this.sell,
  });
}

class RatesModel {
  RateModel usd;
  RateModel euro;

  RatesModel({
    @required this.usd,
    @required this.euro,
  });

  RatesModel.fromSnapshot(Map<String, dynamic> snapshot)
      : usd = new RateModel(buy: snapshot['USD']['buy'], sell: snapshot['USD']['sell']),
        euro = new RateModel(buy: snapshot['EUR']['buy'], sell: snapshot['EUR']['sell']);
}