import 'package:flutter/material.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.signal_wifi_connected_no_internet_4_rounded,
              color: Colors.grey,
              size: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Check Internet Connection')
          ],
        ),
      ),
    );
  }
}
