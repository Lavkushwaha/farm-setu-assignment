import 'package:farm_setu_assignment/blocs/base_bloc.dart';
import 'package:farm_setu_assignment/shared/models/api_result_model.dart';
import 'package:farm_setu_assignment/shared/models/weather_model.dart';
import 'package:farm_setu_assignment/shared/repositories/weather_repository.dart';
import 'package:farm_setu_assignment/shared/services/geolocation_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc extends BaseBloc {
  BehaviorSubject<bool> loadingController = BehaviorSubject<bool>.seeded(true);

  Weather? latestWeather;

  getWeatherData() async {
    loadingController.add(true);

    try {
      Position loc = await geoLocationService.getCurrentPosition();
      ApiResult<dynamic> state = await weatherRepository.getWeatherData(
          loc.latitude.toString(), loc.longitude.toString());
      if (state is SuccessState) {
        debugPrint('weather data fetched');

        latestWeather = Weather.fromJson(state.value);

        loadingController.sink.add(false);
        return state.value;
      } else if (state is ErrorState) {
        loadingController.sink.add(false);
        return null;
      }
    } catch (e) {
      loadingController.addError(e);
      loadingController.sink.add(false);
    }
  }

  getDailyWeather() async {
    loadingController.add(true);

    try {
      Position loc = await geoLocationService.getCurrentPosition();
      ApiResult<dynamic> state = await weatherRepository.getWeatherDaily(
          loc.latitude.toString(), loc.longitude.toString());
      if (state is SuccessState) {
        debugPrint('weather daily fetched');

        // latestWeather = Weather.fromJson(state.value);

        loadingController.sink.add(false);
        return state.value;
      } else if (state is ErrorState) {
        loadingController.sink.add(false);
        return null;
      }
    } catch (e) {
      loadingController.addError(e);
      loadingController.sink.add(false);
    }
  }

  getWeatherhistory() async {
    loadingController.add(true);

    try {
      Position loc = await geoLocationService.getCurrentPosition();
      ApiResult<dynamic> state = await weatherRepository.getWeatherDaily(
          loc.latitude.toString(), loc.longitude.toString());
      if (state is SuccessState) {
        debugPrint('weather daily fetched');

        // latestWeather = Weather.fromJson(state.value);

        loadingController.sink.add(false);
        return state.value;
      } else if (state is ErrorState) {
        loadingController.sink.add(false);
        return null;
      }
    } catch (e) {
      loadingController.addError(e);
      loadingController.sink.add(false);
    }
  }

  @override
  void dispose() {
    loadingController.close();
  }
}

final WeatherBloc weatherBloc = WeatherBloc();
