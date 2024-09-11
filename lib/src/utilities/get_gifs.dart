import 'package:tenor_dart/src/constants/constants.dart';
import 'package:tenor_dart/src/models/response.dart';
import 'package:tenor_dart/src/utilities/utilities.dart';

/// Shared functionality between Search and Featured endpoints.
Future<TenorResponse?> getGifs(
  TenorEndpoint endPoint,
  Duration timeout,
  String parameters, {
  int limit = 1,
  TenorContentFilter? contentFilter,
  TenorAspectRatioRange? aspectRatioRange,
  List<String>? mediaFilter,
  String? pos,
  bool sticker = false,
  bool random = false,
}) async {
  var path = endPoint.name + parameters;

  path += '&limit=${limit.clamp(1, 50)}';

  if (sticker) {
    path += '&searchfilter=sticker';
  }
  if (random) {
    path += '&random=true';
  }
  if (contentFilter != null) {
    path += '&contentfilter=${contentFilter.name}';
  }
  if (mediaFilter != null) {
    path += '&media_filter=${mediaFilter.join(',')}';
  }
  if (aspectRatioRange != null) {
    path += '&ar_range=${aspectRatioRange.name}';
  }
  if (pos != null) {
    path += '&pos=$pos';
  }

  var data = await serverRequest(path, timeout);
  TenorResponse? res;
  if (data != null && data.length > 0) {
    res = TenorResponse.fromJson(
      {
        ...data,
        'endpoint': endPoint.name,
        'parameters': parameters,
      },
    );
  }
  return res;
}
