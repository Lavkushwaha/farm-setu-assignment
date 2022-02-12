import 'package:dio/dio.dart';
import 'package:farm_setu_assignment/shared/models/api_result_model.dart';
import 'package:farm_setu_assignment/shared/models/weather_model.dart';
import 'package:farm_setu_assignment/shared/services/api_service.dart';
import 'package:farm_setu_assignment/utils/constants.dart';
import 'package:flutter/material.dart';

class WeatherAPIProvider {
  DioClient? dioClient;

  WeatherAPIProvider() {
    var dio = Dio();

    dioClient = DioClient(BASEURL, dio);
  }

  Future<ApiResult> getWeatherData(String lat, String lon) async {
    try {
      final response = await dioClient?.get("movie/popular",
          queryParameters: {"appid": API_KEY, "lat": lat, "lon": lon});

      // debugPrint("Response: ${response}");

      Weather w = weatherFromJson(response);
      debugPrint(w.name);

      return ApiResult.success(weatherToJson(response));
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
