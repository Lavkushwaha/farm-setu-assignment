import 'package:farm_setu_assignment/blocs/initial_bloc/initial_bloc.dart';
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
    initialBloc.checkForData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: initialBloc.loadingController,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == true) {
                  return Text('Fetching', style: TextStyle(fontSize: 20));
                } else {
                  return Text('...', style: TextStyle(fontSize: 20));
                }
              }),
          SizedBox(
            height: 20,
          ),
          Center(
            child: CircularProgressIndicator(
              strokeWidth: 1,
            ),
          ),
        ],
      ),
    );
  }
}
