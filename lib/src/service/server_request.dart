import 'dart:convert';
import 'dart:io';

Future serverRequest(String url) async {
  var httpClient = HttpClient();
  var request = await httpClient.getUrl(
    Uri.parse(
      'https://tenor.googleapis.com/v2/' + url,
    ),
  );
  var response = await request.close();
  if (response.statusCode == 200) {
    var json = await utf8.decoder.bind(response).join();
    return jsonDecode(json);
  } else {
    // something went wrong :(
    return [];
  }
}
