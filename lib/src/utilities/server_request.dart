import 'dart:convert';
import 'dart:io';

import 'package:tenor_dart/src/constants/constants.dart';

Future serverRequest(String url) async {
  final httpClient = HttpClient();
  final request = await httpClient.getUrl(
    Uri.parse(TENOR_API_URI + url),
  );
  final response = await request.close();
  if (response.statusCode == 200) {
    final json = await utf8.decoder.bind(response).join();
    return jsonDecode(json);
  } else {
    throw 'Something went wrong. Status code: ${response.statusCode}';
  }
}
