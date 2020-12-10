import 'package:flutter/material.dart';
import 'package:shopie/flutterwave/models/responses/charge_response.dart';
import 'package:shopie/flutterwave/utils/flutterwave_currency.dart';
import 'package:shopie/flutterwave/widgets/home/flutterwave_payment.dart';
import 'package:shopie/flutterwave/widgets/card_payment/card_payment.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;
import 'package:shopie/order_successful_widget/order_successful_widget.dart';
import 'package:shopie/order_successful_widget/order_not_successful_widget.dart';

import 'package:shopie/constants.dart';

import 'flutterwave_payment_manager.dart';

class Flutterwave {
  BuildContext context;
  String publicKey;
  String encryptionKey;
  bool isDebugMode;
  String amount;
  String currency;
  String email;
  String fullName;
  String txRef;
  String redirectUrl;
  bool acceptAccountPayment;
  bool acceptCardPayment;
  bool acceptUSSDPayment;
  bool acceptRwandaMoneyPayment;
  bool acceptMpesaPayment;
  bool acceptZambiaPayment;
  bool acceptGhanaPayment;
  bool acceptUgandaPayment;
  bool acceptFrancophoneMobileMoney;
  String phoneNumber;
  int frequency;
  int duration;
  bool isPermanent;
  String narration;

  // card details
  String cardNumber;
  String cvv;
  String expiryYear;
  String expiryMonth;
  String cardName;

  String volume;
  String address;
  String receiveTime;
  String couponCode;
  String paymentMethod;
  String real_amount;

  //todo include these when they become available and stable on v3
  // bool acceptVoucherPayment;
  // bool acceptUKAccountPayment;
  // bool acceptBarterPayment;
  // bool acceptSouthAfricaBankPayment;
  // bool acceptBankTransferPayment;

  /// Flutterwave Constructor
  Flutterwave.forUIPayment(
      {@required this.context,
      @required this.publicKey,
      @required this.encryptionKey,
      @required this.currency,
      @required this.amount,
      @required this.email,
      @required this.fullName,
      @required this.txRef,
      @required this.isDebugMode,
      @required this.phoneNumber,
      this.frequency,
      this.duration = 0,
      this.isPermanent = false,
      this.narration = "",
      this.acceptAccountPayment = false,
      this.acceptCardPayment = false,
      this.acceptUSSDPayment = false,
      this.acceptRwandaMoneyPayment = false,
      this.acceptMpesaPayment = false,
      this.acceptZambiaPayment = false,
      this.acceptGhanaPayment = false,
      this.acceptUgandaPayment = false,
      this.acceptFrancophoneMobileMoney = false,
      //card details
      this.cardName,
      this.cardNumber,
      this.cvv,
      this.expiryMonth,
      this.expiryYear,
      this.volume,
      this.address,
      this.receiveTime,
      this.couponCode,
      this.paymentMethod,
      this.real_amount
      //TODO to be added later when ready on v3
      // this.acceptBankTransferPayment = false,
      // this.acceptUKAccountPayment = false,
      // this.acceptVoucherPayment = false,
      // this.acceptSouthAfricaBankPayment = false,
      // this.acceptBarterPayment = false,
      }) {
    this.currency = this.currency.toUpperCase();

    if (this.currency == FlutterwaveCurrency.NGN) {
      // this.acceptAccountPayment = this.acceptAccountPayment;
      // this.acceptUSSDPayment = this.acceptUSSDPayment;
      // this.acceptBankTransferPayment = this.acceptBankTransferPayment;
      // this.acceptCardPayment = this.acceptCardPayment;
      // this.acceptBarterPayment = this.acceptBarterPayment;
      // this.acceptUKAccountPayment = false;

      this.acceptRwandaMoneyPayment = false;
      this.acceptMpesaPayment = false;
      this.acceptZambiaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
    }
    if (this.currency == FlutterwaveCurrency.KES) {
      this.acceptMpesaPayment = true;

      this.acceptRwandaMoneyPayment = false;
      this.acceptZambiaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptAccountPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.RWF) {
      this.acceptRwandaMoneyPayment = true;

      this.acceptMpesaPayment = false;
      this.acceptZambiaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptAccountPayment = false;
      this.acceptUSSDPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.UGX) {
      this.acceptUgandaPayment = true;
      this.acceptMpesaPayment = false;
      this.acceptZambiaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptAccountPayment = false;
      this.acceptUSSDPayment = false;
      this.acceptRwandaMoneyPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.ZMW) {
      this.acceptZambiaPayment = true;

      this.acceptAccountPayment = false;
      this.acceptRwandaMoneyPayment = false;
      this.acceptMpesaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptUSSDPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.GHS) {
      this.acceptGhanaPayment = true;
      this.acceptAccountPayment = false;
      this.acceptRwandaMoneyPayment = false;
      this.acceptMpesaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptUSSDPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.XAF ||
        this.currency == FlutterwaveCurrency.XOF) {
      this.acceptFrancophoneMobileMoney = true;
      this.acceptAccountPayment = false;
      this.acceptRwandaMoneyPayment = false;
      this.acceptMpesaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptUSSDPayment = false;
    }

    //TODO to be included once UK Account payments and ACH become available on v3
    // if (this.currency == FlutterwaveCurrency.GBP) {
    //   // this.acceptUKAccountPayment = true;
    //   this.acceptCardPayment = true;
    //   // this.acceptBarterPayment = true;
    // }
    // if (this.currency == FlutterwaveCurrency.ZAR) {
    //   this.acceptAccountPayment = false;
    //   this.acceptBankTransferPayment = false;
    //   this.acceptRwandaMoneyPayment = false;
    //   this.acceptMpesaPayment = false;
    //   this.acceptGhanaPayment = false;
    //   this.acceptUgandaPayment = false;
    //   this.acceptFrancophoneMobileMoney = false;
    //   // this.acceptBarterPayment = true;
    // }

    // if (this.acceptBankTransferPayment) {
    //   if (this.phoneNumber == null ||
    //       this.frequency == null ||
    //       this.narration == null ||
    //       this.duration == null) {
    //     throw (FlutterError(
    //         "To accept Bank transfer Payments, phone number, frequency, narration and duration must be supplied."));
    //   }
    // }
  }

  String country;

  String _setCountry() {
    switch (this.currency) {
      //TODO to be included once ACH payment is available on v3
      // case FlutterwaveCurrency.ZAR:
      //   return "ZA";
      case FlutterwaveCurrency.NGN:
        return "NG";
      case FlutterwaveCurrency.GHS:
        return "GH";
      case FlutterwaveCurrency.RWF:
        return "RW";
      case FlutterwaveCurrency.UGX:
        return "UG";
      case FlutterwaveCurrency.ZMW:
        return "ZM";
      default:
        return "NG";
    }
  }

  /// Launches payment screen
  /// Returns a future ChargeResponse instance
  /// Nullable
  Future<ChargeResponse> initializeForUiPayments() async {
    FlutterwavePaymentManager paymentManager = FlutterwavePaymentManager(
        publicKey: this.publicKey,
        encryptionKey: this.encryptionKey,
        currency: this.currency,
        email: this.email,
        fullName: this.fullName,
        amount: this.amount,
        txRef: this.txRef,
        isDebugMode: this.isDebugMode,
        narration: this.narration,
        isPermanent: this.isPermanent,
        phoneNumber: this.phoneNumber,
        frequency: this.frequency,
        duration: this.duration,
        acceptAccountPayment: this.acceptAccountPayment,
        acceptCardPayment: this.acceptCardPayment,
        acceptUSSDPayment: this.acceptUSSDPayment,
        acceptRwandaMoneyPayment: this.acceptRwandaMoneyPayment,
        acceptMpesaPayment: this.acceptMpesaPayment,
        acceptZambiaPayment: this.acceptZambiaPayment,
        acceptGhanaPayment: this.acceptGhanaPayment,
        acceptUgandaPayment: this.acceptUgandaPayment,
        acceptFancophoneMobileMoney: this.acceptFrancophoneMobileMoney,
        country: this._setCountry(),

        volume: this.volume,
        address: this.address,
        receiveTime: this.receiveTime,
        couponCode: this.couponCode,
        paymentMethod: this.paymentMethod,
        real_amount: this.real_amount);

    final chargeResponse = await this._launchPaymentScreen(paymentManager);
    return chargeResponse;
  }

  Future<ChargeResponse> _launchPaymentScreen(
      final FlutterwavePaymentManager paymentManager) async {
    await _launchCardPaymentWidget(paymentManager);

    // return await Navigator.push(
    //   this.context,
    //   MaterialPageRoute(builder: (context) => FlutterwaveUI(paymentManager)),
    // );
  }

//I added this
  _launchCardPaymentWidget(FlutterwavePaymentManager paymentManager) async {
    final ChargeResponse chargeResponse = await Navigator.push(
      this.context,
      MaterialPageRoute(
          builder: (context) => CardPayment(
              paymentManager.getCardPaymentManager(),
              cardName,
              cardNumber,
              cvv,
              expiryMonth,
              expiryYear)),
    );
    String message;
    if (chargeResponse != null) {
      message = chargeResponse.message;
      print('flutterwave: Response: ' + message);
      if (message == "Transaction fetched successfully") {
        //: success routine. Call make payment
     await successRoutine(
            this.email,
            this.fullName,
            this.phoneNumber,
            this.volume,
            this.address,
            this.receiveTime,
            this.real_amount,
            this.amount,
            this.couponCode,
            this.paymentMethod);
      } else {
        // failure routine. Call make payment
        failureRoutine();
      }
    } else {
      message = "Transaction cancelled";
      print('flutterwave: Response: ' + message);
      //: failure routine. Call make payment
      failureRoutine();
    }
//    this.showSnackBar(message);
    Navigator.pop(this.context, chargeResponse);
  }

  successRoutine(
      String email,
      String name,
      String phone,
      String volume,
      String address,
      String receiveTime,
      String amount,
      String paidAmount,
      String couponCode,
      String paymentMethod) async {
    //getCategories
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String email = await sharedPreferences.get("user");
    Map data = {
      'user': email,
      'name': name,
      'volume': volume,
      'address_id': address,
      'phone': phone,
      'receive_time': receiveTime,
      'amount': amount,
      'paid_amount': paidAmount,
      'coupon_code': couponCode,
      'payment_method': paymentMethod
    };

    // print(email +
    //     " " +
    //     name +
    //     " " +
    //     volume +
    //     " " +
    //     address +
    //     " " +
    //     receiveTime +
    //     " " +
    //     amount +
    //     " " +
    //     paidAmount +
    //     " " +
    //     couponCode +
    //     " " +
    //     paymentMethod);
    var jsonData;
    var response =
        await http.post(Constants.domain + "submit_gas_order.php", body: data);
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      // jsonData = json.decode(response.body);
      print('success added: ' + response.body);
      String orderId = "";

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => TrackingWidget()));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => OrderSuccessfulWidget(orderId)));
    } else {
      try {
        // jsonData = json.decode(response.body);
        print('failed: ' + response.body);
        if (response.statusCode >= 400) {
          showToast('Something went wrong',
              context: context,
              animation: StyledToastAnimation.slideFromTop,
              reverseAnimation: StyledToastAnimation.slideToTop,
              position: StyledToastPosition.top,
              startOffset: Offset(0.0, -3.0),
              reverseEndOffset: Offset(0.0, -3.0),
              duration: Duration(seconds: 4),
              //Animation duration   animDuration * 2 <= duration
              animDuration: Duration(seconds: 1),
              curve: Curves.elasticOut,
              reverseCurve: Curves.fastOutSlowIn);
          String orderId = "";
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderNotSuccessfulWidget(orderId)));
        }
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error' + response.body);
        Navigator.pop(context);
        showToast('Oops! Something went wrong!',
            context: context,
            animation: StyledToastAnimation.slideFromTop,
            reverseAnimation: StyledToastAnimation.slideToTop,
            position: StyledToastPosition.top,
            startOffset: Offset(0.0, -3.0),
            reverseEndOffset: Offset(0.0, -3.0),
            duration: Duration(seconds: 4),
            //Animation duration   animDuration * 2 <= duration
            animDuration: Duration(seconds: 1),
            curve: Curves.elasticOut,
            reverseCurve: Curves.fastOutSlowIn);
        String orderId = "";
        Navigator.pop(context);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => OrderNotSuccessfulWidget(orderId)));
      }
    }
  }

  bool _isLoading = false;

  void failureRoutine() {
    showToast('Something went wrong',
        context: context,
        animation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.slideToTop,
        position: StyledToastPosition.top,
        startOffset: Offset(0.0, -3.0),
        reverseEndOffset: Offset(0.0, -3.0),
        duration: Duration(seconds: 4),
        //Animation duration   animDuration * 2 <= duration
        animDuration: Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.fastOutSlowIn);
    String orderId = "";
    Navigator.pop(context);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => OrderNotSuccessfulWidget(orderId)));
  }

// void showSnackBar(String message) {
//   SnackBar snackBar = SnackBar(
//     content: Text(
//       message,
//       textAlign: TextAlign.center,
//     ),
//   );
//   this._scaffoldKey.currentState.showSnackBar(snackBar);
// }
//

}
