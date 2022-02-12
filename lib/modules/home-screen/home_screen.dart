import 'package:farm_setu_assignment/blocs/weather_bloc/weather_bloc.dart';
import 'package:farm_setu_assignment/configs/app-config.dart';
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
        appBar: AppBar(
          title: Text(appConfig.appName.toString()),
        ),
        body: Column(
          children: [
            StreamBuilder(
                stream: weatherBloc.loadingController,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data == true) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data == false) {
                    return Center(
                      child: Text("data"),
                    );
                  }
                  return Text('Hello World');
                }),
          ],
        ),
      ),
    );
  }
}
