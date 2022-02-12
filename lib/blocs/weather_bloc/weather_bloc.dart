import 'package:farm_setu_assignment/blocs/base_bloc.dart';
import 'package:farm_setu_assignment/shared/models/api_result_model.dart';
import 'package:farm_setu_assignment/shared/models/weather_model.dart';
import 'package:farm_setu_assignment/shared/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc extends BaseBloc {
  BehaviorSubject<bool> loadingController = BehaviorSubject<bool>.seeded(true);

  Weather? latestWeather;

  getWeatherData(lat, lon) async {
    loadingController.add(true);

    try {
      ApiResult<dynamic> state =
          await weatherRepository.getWeatherData('72', '23');
      if (state is SuccessState) {
        //return data to main isolate

        debugPrint('weather data fetched');
        debugPrint(state.value);
        // latestWeather = weatherFromJson(state.value);
        // debugPrint(latestWeather?.toJson().toString());

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
