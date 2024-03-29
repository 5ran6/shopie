import 'dart:io';

import 'package:credit_card_slider/card_company.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/validity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopie/flutterwave/core/flutterwave.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopie/model/input_formatters.dart';
import 'package:shopie/add_new_card_widget/payment_card.dart';
import 'package:shopie/pay_for_order_widget/flutterwave_payment.dart';
import 'package:shopie/pay_for_order_widget/pay_for_order_widget.dart';
import 'package:shopie/model/my_strings.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:shopie/values/params.dart';

class AddCardDetails extends StatefulWidget {
  String name;
  String phone;
  String volume;
  String address;
  String address_id;
  String selectedTime;
  String amount;
  String paid_amount;
  String coupon_code;
  String paymentMethod;
  String emailAddress;

  AddCardDetails(
    @required this.name,
    @required this.phone,
    @required this.volume,
    @required this.address_id,
    @required this.selectedTime,
    @required this.amount,
    @required this.paid_amount,
    @required this.coupon_code,
    @required this.paymentMethod,
    @required this.emailAddress,
  );

//  final String title = 'Add New Card';

  @override
  _AddCardDetailsState createState() => new _AddCardDetailsState();
}

class _AddCardDetailsState extends State<AddCardDetails> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidate = false;

  var _card = new PaymentCard();

  @override
  void initState() {
    super.initState();
    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
  }

  var checkedValue = false;
  static const String NGN = "NGN";
  bool isDebug = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text(
            'Add New Card',
            style: TextStyle(
              color: Colors.purple[900],
              fontFamily: 'SFNS',
            ),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.grey,
          leading: BackButton(
            color: Colors.yellow,
            onPressed: () => this.onIconAwesomeArrowLPressed(context),
          ),
        ),
        body: new Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: new ListView(
                children: <Widget>[
                  new SizedBox(
                    height: 20.0,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: const Icon(
                        Icons.person,
                        size: 40.0,
                      ),
                      hintText: 'What name is written on card?',
                      labelText: 'Card Name',
                    ),
                    onSaved: (String value) {
                      _card.name = value;
                    },
                    textCapitalization: TextCapitalization.words,
                    keyboardType: TextInputType.name,
                    validator: (String value) =>
                        value.isEmpty ? Strings.fieldReq : null,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      new LengthLimitingTextInputFormatter(19),
                      new CardNumberInputFormatter()
                    ],
                    controller: numberController,
                    decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: CardUtils.getCardIcon(_paymentCard.type),
                      hintText: 'What number is written on card?',
                      labelText: 'Number',
                    ),
                    onSaved: (String value) {
                      print('onSaved = $value');
                      print('Num controller has = ${numberController.text}');
                      _paymentCard.number = CardUtils.getCleanedNumber(value);
                    },
                    validator: CardUtils.validateCardNum,
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new TextFormField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      new LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: new Image.asset(
                        'assets/images/card_cvv.png',
                        width: 40.0,
                        color: Colors.grey[600],
                      ),
                      hintText: 'Number behind the card',
                      labelText: 'CVV',
                    ),
                    validator: CardUtils.validateCVV,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _paymentCard.cvv = int.parse(value);
                    },
                  ),
                  new SizedBox(
                    height: 30.0,
                  ),
                  new TextFormField(
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      new LengthLimitingTextInputFormatter(4),
                      new CardMonthInputFormatter()
                    ],
                    decoration: new InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: new Image.asset(
                        'assets/images/calender.png',
                        width: 40.0,
                        color: Colors.grey[600],
                      ),
                      hintText: 'MM/YY',
                      labelText: 'Expiry Date',
                    ),
                    validator: CardUtils.validateDate,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      List<int> expiryDate = CardUtils.getExpiryDate(value);
                      _paymentCard.month = expiryDate[0];
                      _paymentCard.year = expiryDate[1];
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                    child: CheckboxListTile(
                      title: Text("Save Card"),
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                          print(checkedValue.toString());
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      //  <-- leading Checkbox
                    ),
                  ),
                  new SizedBox(
                    height: 50.0,
                  ),
                  new Container(
                    alignment: Alignment.center,
                    child: _getPayButton(),
                  )
                ],
              )),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();

    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => PayForOrderWidget(
    //             "Ocholi Francis",
    //             "080234923492323",
    //             '52 Kg',
    //             '1',
    //             '09 am - 10 am',
    //             '1600',
    //             '1400',
    //             '',
    //             'Online Payment')));

    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      setState(() {
        _autoValidate = true; // Start validating on every change.
      });
      _showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway
//      _showInSnackBar('Payment card is valid');
      if (checkedValue)
        saveCardToSharedPref(
            _card.name,
            _paymentCard.number,
            _paymentCard.type.toString(),
            _paymentCard.month,
            _paymentCard.year,
            _paymentCard.cvv.toString());
      else {
        ProceedToPayment();
      }
    }
  }

  void ProceedToPayment() async {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => FlutterwavePayment(title: 'Payment')));
    _handlePaymentInitialization();
  }

  _handlePaymentInitialization() async {
    final flutterwave = Flutterwave.forUIPayment(
      amount: widget.paid_amount,
      currency: NGN,
      context: this.context,
      publicKey: Params.public_key,
      encryptionKey: Params.encryption_key,
      email: widget.emailAddress,
      fullName: widget.name,
      txRef: DateTime.now().toIso8601String(),
      narration:
          "Payment for gas on Shopie (No 1 home delivery service provider for cooking gas)",
      isDebugMode: this.isDebug,
      phoneNumber: widget.phone,
      acceptAccountPayment: false,
      acceptCardPayment: true,
      acceptUSSDPayment: false,
//card details
      cardName: _card.name,
      cardNumber: _paymentCard.number,
      cvv: _paymentCard.cvv.toString(),
      expiryMonth: _paymentCard.month.toString(),
      expiryYear: _paymentCard.year.toString(),

      volume: widget.volume,
      address: widget.address_id,
      receiveTime: widget.selectedTime,
      couponCode: widget.coupon_code,
      paymentMethod: widget.paymentMethod,
      real_amount: widget.amount,

    );
    final response = await flutterwave.initializeForUiPayments();
    if (response != null) {
      this.showLoading(response.data.status);
      print('flutterwave: Response: ' + response.data.status);
      if (response.data.status == "success") {
        print('flutterwave: Transaction Done Response: ' + response.data.status);


      } else {}
    } else {
      this.showLoading("Transaction not processed!");
    }
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: this.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }

  Widget _getPayButton() {
    if (Platform.isIOS) {
      return new CupertinoButton(
        onPressed: _validateInputs,
        color: CupertinoColors.activeBlue,
        child: const Text(
          Strings.pay,
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    } else {
      return new RaisedButton(
        onPressed: _validateInputs,
        color: Colors.deepOrangeAccent,
        splashColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(100.0)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
        textColor: Colors.white,
        child: new Text(
          Strings.pay.toUpperCase(),
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    }
  }

  void _showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(value),
      duration: new Duration(seconds: 3),
    ));
  }

  onIconAwesomeArrowLPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void saveCardToSharedPref(String name, String number, String networkType,
      int thruMonth, int thruYear, String cvv) async {
    List<String> fromSharedPref = [];

    //save card to sharedPref
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    fromSharedPref = sharedPreferences.getStringList('saved_cards_list') ?? [];
/////////////////////////////////////////////////////////////////////////
/*
*      String myJSON = '{"name":{"first":"foo","last":"bar"}, "age":31, "city":"New York"}';
     var json1 = jsonDecode(myJSON);
//  var nameJson = json['name'];
     String nameString = jsonEncode(json1); // jsonEncode != .toString()
     print(nameString); // outputs {"first":"foo","last":"bar"}

* */
/////////////////////////////////////////////////////////////////////////
    //create String
    String rawCardJson =
        '{"name":"$name", "number":"$number", "cvv":"$cvv", "networkType":"$networkType", "validity":{"thruMonth":$thruMonth,"thruYear":$thruYear}}';
    // encode to json
    var json = jsonDecode(rawCardJson);
    String newCardJson = jsonEncode(json); // jsonEncode != .toString()
    //add to list of strings
    fromSharedPref.add(newCardJson);
    //send to sharedpref
    sharedPreferences.setStringList('saved_cards_list', fromSharedPref);
    // CreditCard x = CreditCard(
    //   // enum CardType {
    //   // Master,
    //   // Visa,
    //   // Verve,
    //   // Discover,
    //   // AmericanExpress,
    //   // DinersClub,
    //   // Jcb,
    //   // Others,
    //   // Invalid
    //   // }
    //
    //   cardNetworkType: networkType == 'Master'
    //       ? CardNetworkType.mastercard
    //       : networkType == 'Visa'
    //       ? CardNetworkType.visaBasic
    //       : networkType == 'Verve'
    //       ? CardNetworkType.rupay
    //       : networkType == 'Other'
    //       ? CardNetworkType.visa
    //       : CardNetworkType.visa,
    //   cardHolderName: name,
    //   cardNumber: number,
    //   company: CardCompany.yesBank,
    //   validity: Validity(
    //     validThruMonth: thruMonth,
    //     validThruYear: thruYear,
    //   ),
    //   cardBackground: null,
    // );

    print('Saved to Sharedpref: ' + fromSharedPref.toString());
    ProceedToPayment();
  }
}
