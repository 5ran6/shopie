import 'package:shopie/flutterwave/models/responses/charge_response.dart';

abstract class CardPaymentListener {
  void onRequirePin(ChargeResponse response) {}

  void onRequireOTP(ChargeResponse response, String message) {}

  void onRequireAddress(ChargeResponse response) {}

  void onRedirect(ChargeResponse response, String url) {}

  void onError(String error) {}

  void onComplete (ChargeResponse chargeResponse) {}
}
