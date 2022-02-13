import 'package:farm_setu_assignment/modules/home-screen/components/google_map_component.dart';
import 'package:flutter/material.dart';

class WeatherCityComponent extends StatelessWidget {
  final String? cityName;
  final String? cityPressure;
  final String? cityTemp;
  const WeatherCityComponent(
      {Key? key, this.cityName, this.cityPressure, this.cityTemp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const MapComponent()),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 50,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$cityName",
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            right: 0,
            bottom: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              // width: 100,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.thermostat),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("$cityTemp C"),
                ],
              ),
            )),
        Positioned(
            right: 0,
            bottom: 60,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              // width: 100,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.cloud),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("$cityPressure Pa")
                ],
              ),
            ))
      ],
    );
  }
}
