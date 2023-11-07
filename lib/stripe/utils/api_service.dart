import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum ApiServiceMethodType {
  get,
  post,
}

const baseUrl = 'https://api.stripe.com/v1';
final Map<String, String> requestHeaders = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization':
      'Bearer sk_test_51LJESJINsLzJqHMhakVQeM3P1FxvXaLgHh9opAZFmRugJNTF9Zg2QzXKm8xmJNxk2eeQdjzJD59BPtMgmlcdSIud00YRzODRmu',
};

Future<Map<String, dynamic>?> apiService({
  required ApiServiceMethodType requestMethod,
  required String endpoint,
  Map<String, dynamic>? requestBody,
}) async {
  final requestUrl = '$baseUrl/$endpoint';

  // +++++++++++++++++
  // ++ GET REQUEST ++
  // +++++++++++++++++

  print('created customer id is ${requestHeaders}');
  if (requestMethod == ApiServiceMethodType.get) {
    try {
      final requestResponse = await http.get(
        Uri.parse(requestUrl),
        headers: requestHeaders,
      );

      return json.decode(requestResponse.body);
    } catch (err) {
      debugPrint("Error: $err");
    }
  }

  // ++++++++++++++++++
  // ++ POST REQUEST ++
  // ++++++++++++++++++

  try {
    final requestResponse = await http.post(
      Uri.parse(requestUrl),
      headers: requestHeaders,
      body: requestBody,
    );

    return json.decode(requestResponse.body);
  } catch (err) {
    debugPrint("Error: $err");
  }
  return null;
}
