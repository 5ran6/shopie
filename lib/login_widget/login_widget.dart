/*
*  login_widget.dart
*  Shopie Gas (1)
*
*  Created by Mountedwings Cyber Tech.
*  Copyright © 2018 Mountedwings Cyber Tech. All rights reserved.
    */

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:http/http.dart' as http;
import 'package:shopie/sign_up_widget/sign_up_widget.dart';
import 'package:shopie/tracking_widget/tracking_widget.dart';
import 'package:shopie/values/values.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void checkLoginState() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (!prefs.getString('user').isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TrackingWidget()));
      }
    }
  }

  final focus1 = FocusNode();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String password;
  String email;

  bool _isLoading = false;

  void signIn(String username, String password) async {
    Map data = {
      'email': username.trim(),
      'password': password.trim(),
    };

    var response = await http.post(
      Constants.domain + "user_login.php",
      body: data,
    );
    print('Status Code = ' + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('got a response from server: ' + response.body);

      if (response.body == 'success') {
        print('success: ' + response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', username.trim());

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TrackingWidget()));
      }
      if (response.body == 'denied') {
        print('failed: ' + response.body);
        setState(() {
          _isLoading = false;
        });

        showToast('User not found',
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
      }
    } else {
      try {
        print('failed: ' + response.body);
//        if (response.statusCode == 422 || response.statusCode == 500) {
        //user not found prompt
        setState(() {
          _isLoading = false;
          showToast('Something went wrong. Try again',
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
        });
        //   }
      } on FormatException catch (exception) {
        print('Exception: ' + exception.toString());
        print('Error ' + response.body);
        var error = 'Oops! Something went wrong.';
        setState(() {
          _isLoading = false;
        });
        showToast('$error',
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
      }
    }
  }

  void onIconAwesomeArrowLPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onGroup4Pressed(BuildContext context) {
    if (_emailController.text.isEmpty) {
      Toast.show("Input an email or phone number", context);
      return;
    }
    if (_passwordController.text.isEmpty) {
      Toast.show("Input a password", context);
      return;
    }

    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
        signIn(_emailController.text, _passwordController.text);
      });
    }
  }

  void onRegisterNowPressed(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SignUpWidget()));

  void onIconFeatherEyeOffPressed(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
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
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      )
          : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 249, 249, 249),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 147,
                      height: 123,
                      margin: EdgeInsets.only(top: 72),
                      child: Image.asset(
                        "assets/images/undraw-welcome-3gvl.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 223,
                      height: 57,
                      margin: EdgeInsets.only(top: 7),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            child: Text(
                              "Welcome Back!!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 36,
                            child: Text(
                              "You have been missed!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 119, 119, 119),
                                fontFamily: 'SFNS',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 16, top: 34, right: 15),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      border:
                      Border.fromBorderSide(Borders.secondaryBorder),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 16, top: 22, right: 15),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.primaryElement,
                              border: Border.fromBorderSide(
                                  Borders.secondaryBorder),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: "Password",
                                contentPadding: EdgeInsets.only(left: 15),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              obscureText: true,
                              autocorrect: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 18,
                    margin: EdgeInsets.only(left: 26, top: 9, right: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Forgot password",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromARGB(255, 59, 72, 255),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 102,
                            height: 18,
                            child: FlatButton(
                              onPressed: () =>
                                  this.onRegisterNowPressed(context),
                              color: Color.fromARGB(0, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(0)),
                              ),
                              textColor: Color.fromARGB(255, 59, 72, 255),
                              padding: EdgeInsets.all(0),
                              child: Text(
                                "Register now?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 59, 72, 255),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 324,
                      height: 45,
                      margin: EdgeInsets.only(top: 26),
                      child: FlatButton(
                        onPressed: () => this.onGroup4Pressed(context),
                        color: AppColors.secondaryElement,
                        shape: RoundedRectangleBorder(
                          borderRadius: Radii.k7pxRadius,
                        ),
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.all(0),
                        child: Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
