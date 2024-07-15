import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

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
      print("full url $uri");
    }

    print("request $url , $queryParams");

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

  static Future<void> storeToken(String accessToken) async {
    final accessTokenExp =
        DateTime.now().add(const Duration(days: 20)).millisecondsSinceEpoch;
    await storage.write(key: 'accessToken', value: accessToken);
    await storage.write(
        key: 'accessTokenExp', value: accessTokenExp.toString());
  }

  static Future<String?> getToken() async {
    final expiry = await storage.read(key: 'accessTokenExp');
    if (expiry != null &&
        DateTime.now().millisecondsSinceEpoch > int.parse(expiry)) {
      await deleteToken();
      return null;
    }
    return await storage.read(key: 'accessToken');
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: 'accessToken');
  }
}
