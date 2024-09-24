import 'package:mocktail/mocktail.dart';
import 'package:tenor_dart/tenor_dart.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

class MockTenorHttpClient extends Mock implements TenorHttpClient {}

class MockTenorResponse extends Mock implements TenorResponse {}
