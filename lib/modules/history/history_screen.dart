import 'package:farm_setu_assignment/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    weatherBloc.getWeatherhistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: StreamBuilder<bool>(
          stream: weatherBloc.historyLoadingController.stream,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (!snapshot.hasData || snapshot.data!) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Text('History'),
            );
          }),
    );
  }
}
