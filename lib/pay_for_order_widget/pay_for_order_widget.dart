/*
*  pay_for_order_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */
import 'dart:convert';
import 'dart:math';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:shopie/flutterwave/core/flutterwave.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopie/add_new_card_widget/add_card_details.dart';
import 'package:shopie/values/values.dart';
import 'package:credit_card_slider/card_background.dart';
import 'package:credit_card_slider/card_company.dart';
import 'package:credit_card_slider/card_network_type.dart';
import 'package:credit_card_slider/credit_card_slider.dart';
import 'package:credit_card_slider/credit_card_widget.dart';
import 'package:credit_card_slider/validity.dart';

import 'flutterwave_payment.dart';

class PayForOrderWidget extends StatefulWidget {

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

  PayForOrderWidget(
      @required this.name,
      @required this.phone,
      @required this.volume,
      @required this.address_id,
      @required this.selectedTime,
      @required this.amount,
      @required this.paid_amount,
      @required this.coupon_code,
      @required this.paymentMethod);

  @override
  _PayForOrderWidgetState createState() => _PayForOrderWidgetState();
}

Color kPink = Color(0xFFEE4CBF);
Color kRed = Color(0xFFFA3754);
Color kBlue = Color(0xFF4AA3F2);
Color kPurple = Color(0xFFAF92FB);

var backgrounds = [
  SolidColorCardBackground(Colors.black.withOpacity(0.6)),
  SolidColorCardBackground(kRed.withOpacity(0.4)),
  GradientCardBackground(LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [kBlue, kPurple],
    stops: [0.3, 0.95],
  )),
  ImageCardBackground(AssetImage('assets/images/background_sample.jpg')),
  null,
];

Random random = new Random();

class _PayForOrderWidgetState extends State<PayForOrderWidget> {
  // void onGroup4Pressed(BuildContext context) => Navigator.pushReplacement(
  //     context, MaterialPageRoute(builder: (context) => AddCardDetails()));

  void onAddNewPressed(BuildContext context) => Navigator.pushReplacement(
  //     context, MaterialPageRoute(builder: (context) => AddCardDetails(
  //     widget.name,
  //     widget.phone,
  //     widget.volume,
  //     widget.address_id,
  //     widget.selectedTime,
  //     widget.amount,
  //     widget.paid_amount,
  //     widget.coupon_code,
  //     widget.paymentMethod,
  //   emailAddress
  //
  // )));
      context, MaterialPageRoute(builder: (context) => AddCardDetails(
      "Ocholi Francis", "080234923492323", '52 Kg', '1' , '09 am - 10 am', '1600', '1400', '', 'Online Payment', "5raan6@gmail.com"

  )));

  void onIconAwesomeArrowLPressed(BuildContext context) =>
      Navigator.pop(context);

  void onTimeSelectedPressed(BuildContext context, String option) {
    //add boarder decoration
    setState(() {
      // _isTimeSelected = true;
      // selectedTime = option;
      // Toast.show(selectedTime, context);
      // print(selectedTime);
    });
  }
  static const String NGN = "NGN";
  bool isDebug = true;

  var fromSharedPref = [];
String emailAddress = '';
  /*
  * {
  *   we skip cardBackground (random)
  *   'cardNetworkType': 1, // 1 = Master card, 2 = Visa Card, 3 = Verve, 4 = Others
  *   'cardHolderName': 'Ocholi Francis',
  *   'cardNumber': '1234 1234 1234 1234',
  *   we skip company type (shopie)
  *   'validThruMonth': 1,
  *   'validThruYear': 1,
  *   'validFromMonth': 1,
  *   'validFromYear': 1,
  *
  * }
  *
  *
  *
  * */

  @override
  void initState() {
    super.initState();
    initialLoading();
  }

  bool loaded = false;

  void initialLoading() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      fromSharedPref =
          sharedPreferences.getStringList('saved_cards_list') ?? [];
      emailAddress =
          sharedPreferences.getString('user') ?? "";
      if (fromSharedPref.isNotEmpty) {
//for each json string, create a card instance
        for (String se in fromSharedPref) {
          print('From SharedPref: ' + se);
          var json = jsonDecode(se);
          CreditCard x = CreditCard(
            cardBackground: backgrounds[random.nextInt(5)],
            cardNetworkType: json['networkType'].toString().contains("Master")                ? CardNetworkType.mastercard
                : json['networkType'].toString().contains("Visa")                    ? CardNetworkType.visaBasic
                    : json['networkType'].toString().contains("Verve") ||
                            json['networkType'].toString().contains("Rupay")
                        ? CardNetworkType.rupay
                        : null,
            cardHolderName: json['name'],
            cardNumber: StringUtils.addCharAtPosition(json['number'], " ", 4, repeat: true),
            company: CardCompany.yesBank,
            cvv: json['cvv'],
            validity: Validity(
              validThruMonth: json['validity']['thruMonth'],
              validThruYear: json['validity']['thruYear'],
            ),
          );
          _creditCards.add(x);
          print("Card lent: "+_creditCards.length.toString());
        }
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      loaded = true;

    });
  }

  var cards = [];
  bool _isTimeSelected = false;
  Color highlight = Color.fromARGB(255, 255, 211, 26);
  Color noHighlight = Color.fromARGB(255, 50, 50, 50);

  String cardHoldersName = '';
  String cardHoldersCVV = '';
  String cardHoldersExpiry = '';
  String cardHoldersNumber = '';
  String cardHoldersvalidThruMonth = '';
  String cardHoldersvalidThruYear = '';

  List<CreditCard> _creditCards = [
    // CreditCard(
    //   cardBackground: backgrounds[random.nextInt(5)],
    //   cardNetworkType: CardNetworkType.visaBasic,
    //   cardHolderName: 'The boring developer',
    //   cardNumber: '1234 1234 1234 1234',
    //   company: CardCompany.yesBank,
    //   validity: Validity(
    //     validThruMonth: 1,
    //     validThruYear: 21,
    //     validFromMonth: 1,
    //     validFromYear: 16,
    //   ),
    // ),
    // CreditCard(
    //   cardBackground: backgrounds[random.nextInt(5)],
    //   cardNetworkType: CardNetworkType.mastercard,
    //   cardHolderName: 'Gursheesh Singh',
    //   cardNumber: '2434 2434 **** ****',
    //   company: CardCompany.kotak,
    //   validity: Validity(
    //     validThruMonth: 1,
    //     validThruYear: 21,
    //   ),
    // ),
    // CreditCard(
    //   cardBackground: backgrounds[random.nextInt(5)],
    //   cardNetworkType: CardNetworkType.mastercard,
    //   cardHolderName: 'Very Very very boring devloper',
    //   cardNumber: '4567',
    //   company: CardCompany.sbiCard,
    //   validity: Validity(
    //     validThruMonth: 2,
    //     validThruYear: 2021,
    //   ),
    // ),
    // CreditCard(
    //   cardBackground: backgrounds[random.nextInt(5)],
    //   cardNetworkType: CardNetworkType.mastercard,
    //   cardHolderName: 'John Doe',
    //   cardNumber: '2434 2434 **** ****',
    //   company: CardCompany.virgin,
    //   validity: Validity(
    //     validThruMonth: 1,
    //     validThruYear: 20,
    //   ),
    // ),
    // CreditCard(
    //   cardBackground: backgrounds[random.nextInt(5)],
    //   cardNetworkType: CardNetworkType.mastercard,
    //   cardHolderName: 'John Doe',
    //   cardNumber: '2434 2434 **** ****',
    //   company: CardCompany.virgin,
    //   validity: Validity(
    //     validThruMonth: 1,
    //     validThruYear: 20,
    //   ),
    // ),
    // CreditCard(
    //   cardBackground: backgrounds[random.nextInt(5)],
    //   cardNetworkType: CardNetworkType.rupay,
    //   cardHolderName: 'John Doe',
    //   cardNumber: '2434 2434 **** ****',
    //   company: CardCompany.virgin,
    //   validity: Validity(
    //     validThruMonth: 1,
    //     validThruYear: 20,
    //   ),
    // ),
    // CreditCard(
    //   cardBackground: backgrounds[random.nextInt(5)],
    //   cardNetworkType: CardNetworkType.visaBasic,
    //   cardHolderName: 'John Doe',
    //   cardNumber: '2434 2434 **** ****',
    //   company: CardCompany.virgin,
    //   validity: Validity(
    //     validThruMonth: 1,
    //     validThruYear: 20,
    //   ),
    // ),
    // CreditCard(
    //   cardBackground: backgrounds[random.nextInt(5)],
    //   cardNetworkType: CardNetworkType.rupay,
    //   cardHolderName: 'THE BORING DEVELOPER',
    //   cardNumber: '2434 2434 **** ****',
    //   company: CardCompany.sbi,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Method",
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
      body: !loaded
          ? Container(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )),
            )
          : Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 28,
                    margin: EdgeInsets.only(left: 26, top: 20, right: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Select a Card",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.secondaryText,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              letterSpacing: -1.19879,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: EdgeInsets.only(top: 10, right: 5),
                            child: Image.asset(
                              "assets/images/icon-feather-plus.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 71,
                            height: 21,
                            margin: EdgeInsets.only(top: 4),
                            child: FlatButton(
                              onPressed: () => this.onAddNewPressed(context),
                              color: Color.fromARGB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0)),
                              ),
                              textColor: Color.fromARGB(255, 59, 72, 255),
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "Add new",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 59, 72, 255),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: fromSharedPref.isEmpty
                        ? Image.asset("assets/images/no_item.png")
                        : CreditCardSlider(
                            _creditCards,
                            initialCard: 0,
                            onCardClicked: (index) {
//                  _creditCards[index].cardHolderName
//goto next activity with card details.

                              ProceedToPayment(index);
                              print('Clicked at index: $index');
                            },
                          ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Container(
                  //       width: 324,
                  //       height: 45,
                  //       child: FlatButton(
                  //         onPressed: () => this.onGroup4Pressed(context),
                  //         color: AppColors.secondaryElement,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: Radii.k7pxRadius,
                  //         ),
                  //         textColor: Color.fromARGB(255, 255, 255, 255),
                  //         padding: EdgeInsets.all(0),
                  //         child: Text(
                  //           "Confirm",
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             color: Color.fromARGB(255, 255, 255, 255),
                  //             fontWeight: FontWeight.w400,
                  //             fontSize: 20,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
    );
  }
  void ProceedToPayment(int index) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => FlutterwavePayment(title: 'Payment')));

_handlePaymentInitialization(index);

  }


  _handlePaymentInitialization(int index) async {
    final flutterwave = Flutterwave.forUIPayment(
        amount: widget.paid_amount,
        currency: NGN,
        context: this.context,
        publicKey: Params.public_key,
        encryptionKey: Params.encryption_key,
        email: emailAddress,
        fullName: widget.name,
        txRef: DateTime.now().toIso8601String(),
        narration: "Payment for gas on Shopie (No 1 home delivery service provider for cooking gas)",
        isDebugMode: this.isDebug,
        phoneNumber: widget.phone,
        acceptAccountPayment: false,
        acceptCardPayment: true,
        acceptUSSDPayment: false,
//card details
      cardName:  _creditCards[index].cardHolderName,
      cardNumber:  _creditCards[index].cardNumber.replaceAll(' ', ''),
      cvv:  _creditCards[index].validity.validThruYear.toString(),
      expiryMonth:  _creditCards[index].validity.validThruMonth.toString(),
      expiryYear:  _creditCards[index].validity.validThruYear.toString(),






    );
    final response = await flutterwave.initializeForUiPayments();
    if (response != null) {
      this.showLoading(response.data.status);
    } else {
      this.showLoading("No Response!");
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
}
