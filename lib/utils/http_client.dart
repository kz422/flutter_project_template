import 'dart:convert';

import 'package:http/http.dart' as http;

import 'extensions/exception_extension.dart';

class HttpClient {
  static const int duration = 30;

  Future<dynamic> get(String url) async {
    final uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      return _processResponse(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = response.body;
        return responseJson;
      case 400:
        throw BadRequestException(
          jsonDecode(response.body)['message'].toString(),
        );
    }
  }
}
