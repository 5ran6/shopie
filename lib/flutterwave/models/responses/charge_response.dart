import 'package:shopie/flutterwave/models/requests/authorization.dart';

import 'charge_card_response/charge_card_response_data.dart';

class ChargeResponse {
  String status;
  String message;
  ChargeResponseData data;
  Meta meta;

  ChargeResponse({this.status, this.message, this.data, this.meta});

  ChargeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ChargeResponseData.fromJson(json['data']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    print('flutterwave: Response: ' + status);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}


class Meta {
  Authorization authorization;

  Meta({this.authorization});

  Meta.fromJson(Map<String, dynamic> json) {
    authorization = json['authorization'] != null ? new Authorization.fromJson(json['authorization']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authorization != null) {
      data['authorization'] = this.authorization.toJson();
    }
    return data;
  }
}

