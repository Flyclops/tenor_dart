import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tenor_dart/src/constants/constants.dart';
import 'package:tenor_dart/src/exceptions/exceptions.dart';

// Errors will return error in the body.
// https://developers.google.com/tenor/guides/response-objects-and-errors
Future serverRequest(String url, Duration timeout) async {
  try {
    final response =
        await http.Client().get(Uri.parse(tenorApiUrl + url)).timeout(timeout);
    // get json
    final Map<Object, dynamic> json = jsonDecode(response.body);

    // if an error is present, throw it
    if (json['error'] != null ||
        (response.statusCode != 200 && response.statusCode != 202)) {
      throw TenorApiException(
        code: response.statusCode,
        message: json['error']['message'] ?? '',
      );
    }
    // if no error, return the json for consumption
    return json;
  } on TimeoutException {
    throw TenorNetworkException();
  } on ClientException catch (e) {
    if (e.runtimeType.toString() == '_ClientSocketException') {
      throw TenorNetworkException();
    }
  } catch (e) {
    // let the consumer handle it
    rethrow;
  }
}
