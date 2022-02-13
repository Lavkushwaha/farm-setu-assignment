import 'package:flutter/material.dart';

class WeatherForecastComponent extends StatelessWidget {
  final String? date;
  final String? dayTemp;
  final String? nightTemp;
  final String? humidity;
  final String? pressure;
  final String? windSpeed;

  const WeatherForecastComponent(
      {Key? key,
      this.date,
      this.dayTemp,
      this.nightTemp,
      this.humidity,
      this.pressure,
      this.windSpeed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 150,
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$date',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Day Temp : '),
                Text('$dayTemp C'),
              ],
            ),
            Row(
              children: [
                const Text('Night Temp : '),
                Text('$nightTemp C'),
              ],
            ),
            Row(
              children: [
                const Text('Humidity : '),
                Text('$humidity %'),
              ],
            ),
            Row(
              children: [
                const Text('Pressure : '),
                Text('$pressure Pa'),
              ],
            ),
            Row(
              children: [
                const Text('Wind Speed : '),
                Text('$windSpeed ms'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
