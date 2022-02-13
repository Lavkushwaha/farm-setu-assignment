import 'package:farm_setu_assignment/blocs/initial_bloc/initial_bloc.dart';
import 'package:farm_setu_assignment/modules/errors/no_internet_screen.dart';
import 'package:farm_setu_assignment/shared/services/connection_service.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  void initState() {
    //CALL API SERVICE

    //

    connectionStatus.connectionChange.listen(_updateConnectivity);

    super.initState();
  }

  _updateConnectivity(d) {
    if (d != ConnectionStatus.none) {
      initialBloc.checkForData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: connectionStatus.connectionChangeController,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == ConnectionStatus.none) {
                return const NoInternetScreen();
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                    stream: initialBloc.loadingController,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data == true) {
                        return const Text('Fetching',
                            style: TextStyle(fontSize: 20));
                      } else {
                        return const Text('...',
                            style: TextStyle(fontSize: 20));
                      }
                    }),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
