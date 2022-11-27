import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class GetEntitiesService {
  static final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getAllEntities(String url) async {
    try {
      List<Map<String, dynamic>> allEntities = [];
      String? nextUrl = url;
      while (nextUrl != null) {
        var response = await _dio.get(nextUrl);

        try {
          allEntities.addAll(List<Map<String, dynamic>>.from(response.data["results"]));
        } catch (e) {
          // We don't have info object and pagination
          allEntities.addAll(List<Map<String, dynamic>>.from(response.data));
          nextUrl = null;
        }
      }

      return allEntities;
    } on DioError {
      rethrow;
    }
  }
}
