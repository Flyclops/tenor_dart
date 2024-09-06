import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tenor_dart/src/constants/constants.dart';

Future serverRequest(String url) async {
  final response = await http.Client().get(
    Uri.parse(TENOR_API_URI + url),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw 'Something went wrong. Status code: ${response.statusCode}';
  }
}
