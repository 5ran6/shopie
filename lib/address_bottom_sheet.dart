import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import 'constants.dart';

class bottomSheetAddress {
  Future settingModalBottomSheet(context, List category) {
    TextEditingController _productSubCategoryNameController =
        new TextEditingController();
    String address_id = "";
    String category_id = category[0]['value'];
    bool loading = false;

    String _validateAddress(String value) {
      if (value.length > 2) {
        return null;
      }

      return 'Please enter a Valid Address';
    }

    addNewAddress(String city, String address, String long, String lat,
        BuildContext context) async {
      Toast.show("Adding....", context);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String user = await sharedPreferences.get("user");
      Map data = {
        'user': user,
        'city': city,
        'address': address,
        'longitude': long,
        'latitude': lat
      };

      var jsonData;
      var response = await http.post(
        Constants.domain + "add_user_address.php",
        body: data,
      );

      print('Status Code = ' + response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        jsonData = json.decode(response.body);

        address_id =
            jsonData['address_id']; //to be sent back to parent activity TODO

        Map<String, String> fullAddress = {
          'name': address,
          'value': address_id
        };

        if (jsonData['status'] == "success") {
          print('success: ' + response.body);
          print('address_id: ' + address_id);
          Toast.show('Done', context);
          print('Yet to send back Full address: ' + fullAddress.toString());
//          context.

          Navigator.pop(context, fullAddress);
          //        return fullAddress;
        } else {
          String error = "";
          error = 'Oops! Something went wrong.';
          Toast.show("Oops! $error", context);
        }
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => add_product_line(
        //     token: token,
        //   ),
        // ));
      } else {
        try {
          jsonData = json.decode(response.body);
          print('failed: ' + response.body);
          if (response.statusCode == 422) {
            //user not found prompt
            String error = "";
            ///////////TODO///////////////////////////////////////////
            if (jsonData['errors'].toString() != 'null') {
              error = jsonData['errors']
                  .toString()
                  .substring(1, jsonData['errors'].toString().length - 1);
            } else {
              error = jsonData['message'].toString();
            }
            //////////////////////////////////////////////////////
            Toast.show("Oops! $error", context);
          }
        } on FormatException catch (exception) {
          print('Exception: ' + exception.toString());
          print('Error' + response.body);
          String error = "";
          error = 'Oops! Something went wrong.';
          Toast.show("Oops! $error", context);
        }
      }
    }

    getPreviousAddresses(
        String name, String product_category_id, BuildContext context) async {
      Toast.show("Adding....", context);
      Map data = {
        'name': name.trim(),
        'product_category_id': product_category_id.trim()
      };
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String token = await sharedPreferences.get("token");

      var jsonData;
      var response = await http.post(Constants.domain + "addProductSubCategory",
          body: data,
          headers: {
            'Authorization': 'Bearer $token',
          });

      print('Status Code = ' + response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        jsonData = json.decode(response.body);
        print('success: ' + response.body);
        Toast.show('Done', context);
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => add_product_line(
        //     token: token,
        //   ),
        // ));
      } else {
        try {
          jsonData = json.decode(response.body);
          print('failed: ' + response.body);
          if (response.statusCode == 422) {
            //user not found prompt
            String error = "";
            ///////////TODO///////////////////////////////////////////
            if (jsonData['errors'].toString() != 'null') {
              error = jsonData['errors']
                  .toString()
                  .substring(1, jsonData['errors'].toString().length - 1);
            } else {
              error = jsonData['message'].toString();
            }
            //////////////////////////////////////////////////////
            Toast.show("Oops! $error", context);
          }
        } on FormatException catch (exception) {
          print('Exception: ' + exception.toString());
          print('Error' + response.body);
          String error = "";
          error = 'Oops! Something went wrong.';
          Toast.show("Oops! $error", context);
        }
      }
    }

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState
                /*You can rename this!*/) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: loading
                    ? Center(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: new Wrap(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            new Padding(
                              padding: MediaQuery.of(context).viewPadding,
                              child: TextFormField(
                                controller: _productSubCategoryNameController,
                                onFieldSubmitted: (v) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                keyboardType: TextInputType.text,
                                validator: _validateAddress,
                                textInputAction: TextInputAction.done,
                                autofocus: false,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    labelText: 'Full Address',
                                    labelStyle:
                                        TextStyle(color: Colors.black54),
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            new Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_today),
                                  labelText: "Select your city",
                                  filled: true,
                                  fillColor: Colors.white,
                                  errorStyle: TextStyle(color: Colors.yellow),
                                ),
                                value: category[0]['value'],
                                items: category.map((map) {
                                  return DropdownMenuItem(
                                    child: Text(map['name']),
                                    value: map['value'],
                                  );
                                }).toList(),
                                onChanged: (dynamic value) {
                                  category_id = value;
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  new FlatButton(
                                    onPressed: () {
                                      // addSubCategory(
                                      //     _productSubCategoryNameController.text,
                                      //     category_id,
                                      //     context);

                                      setModalState(() {
                                        loading = true;
                                      });
                                    },
                                    child: Text(
                                      "Previous Addresses",
                                    ),
                                    textColor: Colors.indigoAccent,
                                    color: Colors.white,
                                    splashColor: Colors.blue.withOpacity(0.5),
                                  ),
                                  Spacer(),
                                  new FlatButton(
                                    onPressed: () {
                                      // addSubCategory(
                                      //     _productSubCategoryNameController.text,
                                      //     category_id,
                                      //     context);
                                      setModalState(() {
                                        loading = true;
                                      });

                                      //validator
                                      //call addNewAddress
                                      if (_productSubCategoryNameController
                                          .text.isNotEmpty)
                                        addNewAddress(
                                            category_id,
                                            _productSubCategoryNameController
                                                .text,
                                            "",
                                            "",
                                            context);
                                      else
                                        Toast.show(
                                            "Please fill in all required fields",
                                            context);
                                    },
                                    child: Text(
                                      "Add",
                                    ),
                                    textColor: Colors.white,
                                    color: Colors.indigoAccent,
                                    splashColor: Colors.white.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              );
            },
          );
        });
  }
}
