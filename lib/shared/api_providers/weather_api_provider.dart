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
      final response = await dioClient?.get("weather",
          queryParameters: {"appid": API_KEY, "lat": lat, "lon": lon});

      debugPrint("myrespo $response");

      Weather w = Weather.fromJson(response);
      debugPrint(w.name);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult> getDailyWeather(String lat, String lon) async {
    try {
      final response = await dioClient?.get("onecall", queryParameters: {
        "appid": API_KEY,
        "lat": lat,
        "lon": lon,
        "exclude": "hourly,current,minutely,alerts"
      });

      debugPrint("myrespo $response");

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult> getWeatherHistory(String lat, String lon) async {
    try {
      //change to history
      final response = await dioClient?.get("onecall", queryParameters: {
        "appid": API_KEY,
        "lat": lat,
        "lon": lon,
        "exclude": "hourly,current,minutely,alerts"
      });

      debugPrint("myrespo $response");

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
