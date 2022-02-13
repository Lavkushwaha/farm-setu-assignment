import 'package:farm_setu_assignment/blocs/weather_bloc/weather_bloc.dart';
import 'package:farm_setu_assignment/configs/app-config.dart';
import 'package:farm_setu_assignment/modules/home-screen/components/weather_city_component.dart';
import 'package:farm_setu_assignment/modules/home-screen/components/weather_component.dart';
import 'package:farm_setu_assignment/routes.dart';
import 'package:farm_setu_assignment/shared/services/navigation_service.dart';
import 'package:farm_setu_assignment/utils/helper.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(appConfig.appName.toString()),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              StreamBuilder(
                  stream: weatherBloc.loadingController,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData && snapshot.data == false) {
                      return WeatherCityComponent(
                        cityName: weatherBloc.latestWeather?.name ?? " ",
                        cityTemp: weatherBloc.latestWeather?.main?.tempMax
                                .toString() ??
                            " ",
                        cityPressure: weatherBloc.latestWeather?.main?.pressure
                                .toString() ??
                            " ",
                      );
                    }

                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    }
                    return const Text('...');
                  }),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: weatherBloc.loadingController,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData && snapshot.data == false) {
                      if (weatherBloc.weatherDaily != null) {
                        // return Text(
                        //     weatherBloc.weatherDaily!.daily!.length.toString());

                        List<Widget> forcastList =
                            weatherBloc.weatherDaily!.daily!
                                .map((e) => WeatherForecastComponent(
                                      date: parseTimeStamp(e.dt ?? 0),
                                      dayTemp: e.temp?.day.toString(),
                                      nightTemp: e.temp?.night.toString(),
                                      humidity: e.humidity.toString(),
                                      pressure: e.pressure.toString(),
                                      windSpeed: e.windSpeed.toString(),
                                    ))
                                .toList();

                        return SizedBox(
                          height: 200,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            children: forcastList,
                          ),
                        );
                      }
                      return const Center(
                        child: Text("DAILY WEATHER NOT AVAILABLE"),
                      );
                    }

                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    }
                    return const Text('...');
                  }),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    appNavigationService.pushNamed(Routes.history);
                  },
                  child: Container(
                    height: 40,
                    // width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    child: const Center(
                      child: Text("View History"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
