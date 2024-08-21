import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:sakhi_app/core/service/token.dart';

class Http {
  Http._();

  static Http get http => Http._();

  final _client = https.Client();

  final _clientWithToken = InterceptedClient.build(
    interceptors: [TokenHandler()],
  );

  String? get baseUrl => dotenv.env['BASE_URL'];

  //GET request
  Future<https.Response> getRequest({
    required String? endpoint,
    Map<String, String>? headers,
  }) async {
    return await _client.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
    );
  }

  //GET request with token
  Future<https.Response> getRequestWithToken({
    required String? endpoint,
  }) async {
    return await _clientWithToken.get(
      Uri.parse('$baseUrl/$endpoint'),
    );
  }

  //POST request
  Future<https.Response> postRequest({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    return await _client.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
  }


  //POST request
  Future<https.Response> postRequestWithoutBody({
    required String endpoint,

    Map<String, String>? headers,
  }) async {
    return await _client.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
    );
  }
  // POST request with token
  Future<https.Response> postRequestWithToken({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers
  }) async {
    return await _clientWithToken.post(
        Uri.parse('$baseUrl/$endpoint'),
        body: jsonEncode(body),
        headers: headers
    );
  }

  //PUT request
  Future<https.Response> updateRequest({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    return await _client.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    );
  }

//PUT request with token
  Future<https.Response> updateRequestWithToken({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    return await _clientWithToken.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(body),
    );
  }

//Delete request
  Future<https.Response> deleteRequest({
    required String endpoint,
  }) async {
    return await _client.delete(Uri.parse('$baseUrl/$endpoint'));
  }

  //Delete request with token

  Future<https.Response> deleteRequestWithToken({
    required String endpoint,
  }) async {
    return await _clientWithToken.delete(Uri.parse('$baseUrl/$endpoint'));
  }
}