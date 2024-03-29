import 'dart:convert';
import 'dart:io';

import 'package:shopie/flutterwave/core/flutterwave_error.dart';
import 'package:shopie/flutterwave/models/requests/charge_card/validate_charge_request.dart';
import 'package:shopie/flutterwave/models/requests/verify_charge_request.dart';
import 'package:shopie/flutterwave/models/responses/charge_response.dart';
import 'package:shopie/flutterwave/models/responses/get_bank/get_bank_response.dart';
import 'package:shopie/flutterwave/utils/flutterwave_urls.dart';
import 'package:http/http.dart' as http;


/// Flutterwave Utility class
class FlutterwaveAPIUtils {

  /// This method fetches a list of Nigerian banks
  /// it returns an instance of GetBanksResponse or throws an error
  static Future<List<GetBanksResponse>> getBanks(
      final http.Client client) async {
    try {
      final response = await client.get(
        FlutterwaveURLS.GET_BANKS_URL,
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonDecoded = jsonDecode(response.body);
        final banks =
            jsonDecoded.map((json) => GetBanksResponse.fromJson(json)).toList();

        return banks;
      } else {
        throw (FlutterWaveError("Unable to fetch banks. Please contact support"));
      }
    } catch (error) {
      throw (FlutterWaveError(error.toString()));
    } finally {
      client.close();
    }
  }


  /// Validates payments with OTP
  /// returns an instance of ChargeResponse or throws an error
  static Future<ChargeResponse> validatePayment(
      String otp, String flwRef, http.Client client, final bool isDebugMode, final String publicKey, final isBankAccount) async {
    final url = FlutterwaveURLS.getBaseUrl(isDebugMode) + FlutterwaveURLS.VALIDATE_CHARGE;
    final ValidateChargeRequest chargeRequest =
    ValidateChargeRequest(otp, flwRef, isBankAccount);
    final payload = chargeRequest.toJson();
    try {
      final http.Response response = await client.post(url,
          headers: {HttpHeaders.authorizationHeader: publicKey},
          body: payload);

      final ChargeResponse cardResponse =
      ChargeResponse.fromJson(jsonDecode(response.body));
      return cardResponse;
    } catch (error) {
      throw (FlutterWaveError(error.toString()));
    }
  }


  /// Verifies payments with Flutterwave reference
  /// returns an instance of ChargeResponse or throws an error
  static Future<ChargeResponse> verifyPayment(
      final String flwRef,
      final http.Client client,
      final String publicKey,
      final bool isDebugMode) async {
    final url = FlutterwaveURLS.getBaseUrl(isDebugMode) +
        FlutterwaveURLS.VERIFY_TRANSACTION;
    final VerifyChargeRequest verifyRequest = VerifyChargeRequest(flwRef);
    final payload = verifyRequest.toJson();
    try {
      final http.Response response = await client.post(url,
          headers: {HttpHeaders.authorizationHeader: publicKey}, body: payload);

      final ChargeResponse cardResponse =
          ChargeResponse.fromJson(jsonDecode(response.body));
      return cardResponse;
    } catch (error, stacktrace) {
      print(stacktrace);
      throw (FlutterWaveError(error.toString()));
    } 
  }
}
