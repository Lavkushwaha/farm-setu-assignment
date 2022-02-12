import 'package:farm_setu_assignment/blocs/base_bloc.dart';
import 'package:farm_setu_assignment/blocs/weather_bloc/weather_bloc.dart';
import 'package:farm_setu_assignment/routes.dart';
import 'package:farm_setu_assignment/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class InitialBloc extends BaseBloc {
  BehaviorSubject<bool> loadingController = BehaviorSubject<bool>.seeded(true);

  getCurrentLocation() {
    loadingController.add(true);
    // WeatherBloc().getCurrentLocation();
    loadingController.add(false);
  }

  checkForData() async {
    loadingController.add(true);
    debugPrint("checking for data");

    await weatherBloc.getWeatherData("72", "23");

    loadingController.add(false);

    appNavigationService.pushReplacementNamed(Routes.home);
  }

  @override
  void dispose() {
    loadingController.close();
  }
}

final InitialBloc initialBloc = InitialBloc();
