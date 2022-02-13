import 'package:farm_setu_assignment/shared/api_providers/weather_api_provider.dart';
import 'package:farm_setu_assignment/shared/models/api_result_model.dart';

class WeatherRepository {
  final weatherProvider = WeatherAPIProvider();

  Future<ApiResult> getWeatherData(String lat, String lon) =>
      weatherProvider.getWeatherData(lat, lon);

  Future<ApiResult> getWeatherDaily(String lat, String lon) =>
      weatherProvider.getDailyWeather(lat, lon);

  Future<ApiResult> getWeatherHistory(String lat, String lon) =>
      weatherProvider.getWeatherHistory(lat, lon);
}

final WeatherRepository weatherRepository = WeatherRepository();
