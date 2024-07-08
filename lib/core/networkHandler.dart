import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class NetworkHandler {
  static const storage = FlutterSecureStorage();

  static Future<http.Response> getRequest(String url,
      {Map<String, dynamic>? queryParams, bool includeToken = false}) async {

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    if (includeToken) {
      String? token = await getToken();
      headers["Authorization"] = "Bearer $token";
    }

    var uri = Uri.parse(url);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    try {
      var response = await http.get(uri, headers: headers);
      return response;
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  static Future<http.Response> postRequest(String url, var data,
      {Map<String, dynamic>? queryParams, bool includeToken = false}) async {

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    if (includeToken) {
      String? token = await getToken();
      headers["Authorization"] = "Bearer $token";
    }
    var uri = Uri.parse(url);
    if (queryParams != null) {
      uri = uri.replace(queryParameters: queryParams);
    }

    try {
      var response = await http.post(
        uri,
        body: json.encode(data),
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception('Failed to send data');
    }
  }

  static Future<http.Response> postParamsRequest(String url,
      {Map<String, dynamic>? queryParams, bool includeToken = false}) async {

    Map<String, String> headers = {};
    if (includeToken) {
      String? token = await getToken();
      headers["Authorization"] = "Bearer $token";
    }

    Uri uri = Uri.parse(url).replace(queryParameters: queryParams);

    try {
      return await http.post(uri, headers: headers);
    } catch (e) {
      throw Exception('Failed to send data');
    }
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<void> storeExpirationDate(String expiration) async {
    await storage.write(key: 'expiration', value: expiration);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  static Future<DateTime?> getExpirationDate() async {
    try {
      var store = await storage.read(key: 'expiration');
      if (store != null) {
        return DateTime.tryParse(store);
      }
    } catch (e) {
      print("Error fetching expiration date: $e");
    }
    return null;
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'expiration');
  }
}