import 'package:dio/dio.dart';
import 'package:farm_setu_assignment/shared/models/api_result_model.dart';
import 'package:farm_setu_assignment/shared/models/weather_model.dart';
import 'package:farm_setu_assignment/shared/services/api_service.dart';
import 'package:farm_setu_assignment/utils/constants.dart';
import 'package:farm_setu_assignment/utils/helper.dart';
import 'package:flutter/material.dart';

class WeatherAPIProvider {
  DioClient? dioClient;

  WeatherAPIProvider() {
    var dio = Dio();

    dioClient = DioClient(BASEURL, dio);
  }

  Future<ApiResult> getWeatherData(String lat, String lon) async {
    try {
      final response = await dioClient?.get("weather", queryParameters: {
        "appid": API_KEY,
        "lat": lat,
        "lon": lon,
        "units": "metric",
      });

      debugPrint("myrespo $response");

      WeatherModel w = WeatherModel.fromJson(response);
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
        "units": "metric",
        "exclude": "hourly,current,minutely,alerts"
      });

      debugPrint("daily $response");

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }

  Future<ApiResult> getWeatherHistory(String lat, String lon) async {
    //DOWNLOAD DATA FOR 100 DAYS
    DateTime start = DateTime.now().subtract(const Duration(days: 100));
    DateTime end = DateTime.now();

    try {
      //change to history
      final response = await dioClient?.get("history/city", queryParameters: {
        "appid": API_KEY,
        "lat": lat,
        "lon": lon,
        "cnt": "1",
        "units": "metric",
        "start": parseTimeStampToLinux(start),
        "end": parseTimeStampToLinux(end)
      });

      debugPrint("history $response");

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
