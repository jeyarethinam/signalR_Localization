import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:research_and_development_ondemand/showSearch/util/global.dart';

var headers = {
  'Content-Type': 'application/json',
};
// var authHeader = {
//   'Authorization': 'Bearer $apiToken',
//     'Content-Type': 'application/json'
// };

post(String url, Map data) {
  return http.post(BASE_URL + url, body: json.encode(data), headers: headers);
}

posting(String url, String apiToken) {
  return http.post(BASE_URL + url, headers: {
    'Authorization': 'Bearer $apiToken',
    'Content-Type': 'application/json'
  });
}

postings(String url, String apiToken, Map data) {
  return http.post(BASE_URL + url, body: json.encode(data), headers: {
    'Authorization': 'Bearer $apiToken',
    'Content-Type': 'application/json'
  });
}

get(String url) {
  print(BASE_URL + url);
  return http.get(BASE_URL + url, headers: headers);
}

delete(String url) {
  return http.delete(BASE_URL + url, headers: headers);
}

patch(String url) {
  return http.patch(BASE_URL + url, headers: headers);
}

put(String url, Map data) {
  return http.put(BASE_URL + url, body: json.encode(data), headers: headers);
}

class Deserialize {
  dynamic response;
  Deserialize(this.response);

  RestCommonBody responseMessage() {
    RestCommonBody body = RestCommonBody.fromJson(json.decode(response.body));
    return body;
  }
}

class RestCommonBody {
  dynamic result;
  IsError error;

  RestCommonBody({this.result, this.error});

  RestCommonBody.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    error = IsError.fromJson(json["error"]);
  }
}

class IsError {
  bool is_error;
  List<dynamic> errors;

  IsError({
    this.is_error,
    this.errors,
  });

  factory IsError.fromJson(Map<String, dynamic> json) => new IsError(
        is_error: json["is-error"],
        errors: new List<dynamic>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "is-error": is_error,
        "errors": new List<dynamic>.from(errors.map((x) => x)),
      };
}
