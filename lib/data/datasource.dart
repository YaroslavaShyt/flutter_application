import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> sendFormData(
      Map<String, dynamic> formData) async {
    try {
      final response = await _dio.post(
        'https://api.byteplex.info/api/test/contact/',
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
        data: jsonEncode(formData),
      );
      if (response.statusCode == 201) {
        return {"success": true, "message": ""};
      }
      return {
        "success": false,
        "message": "${response.data} ${response.statusCode}"
      };
    } catch (error) {
      return {"success": false, "message": error.toString()};
    }
  }
}
