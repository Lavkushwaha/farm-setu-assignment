import 'package:connectivity/connectivity.dart';
import 'package:farm_setu_assignment/blocs/base_bloc.dart';
import 'package:farm_setu_assignment/blocs/weather_bloc/weather_bloc.dart';
import 'package:farm_setu_assignment/routes.dart';
import 'package:farm_setu_assignment/shared/services/connection_service.dart';
import 'package:farm_setu_assignment/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class InitialBloc extends BaseBloc {
  BehaviorSubject<bool> loadingController = BehaviorSubject<bool>.seeded(true);
  // late bool _hasNetworkConnection;
  // late bool _fallbackViewOn;

  getCurrentLocation() {
    loadingController.add(true);
    // WeatherBloc().getCurrentLocation();
    loadingController.add(false);
  }

  checkForData() async {
    if (connectionStatus.connectivity.checkConnectivity() !=
        ConnectivityResult.none) {
      loadingController.add(true);
      debugPrint("checking for data");

      await weatherBloc.getWeatherData();

      // loadingController.add(false);
      appNavigationService.pushReplacementNamed(Routes.home);
    } else {
      debugPrint("No internet connection");

      loadingController.add(false);
    }
  }

  @override
  void dispose() {
    loadingController.close();
  }
}

final InitialBloc initialBloc = InitialBloc();
