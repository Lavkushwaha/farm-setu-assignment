import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:rxdart/rxdart.dart';

enum ConnectionStatus { good, bad, none }

class ConnectionStatusSingleton {
  Timer? _timer;

  BehaviorSubject<ConnectionStatus?> connectionChangeController =
      BehaviorSubject<ConnectionStatus?>.seeded(ConnectionStatus.good);

  final Connectivity connectivity = Connectivity();
  void initialize() {
    connectivity.onConnectivityChanged.listen(_connectionChange);
    const Duration sec = Duration(seconds: 5);
    _timer = Timer.periodic(
      sec,
      (Timer t) => checkConnection(),
    );
  }

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    _timer?.cancel();
    connectionChangeController.close();
  }

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  void updateConnectionStatusSubject(ConnectionStatus value) {
    if (connectionChangeController.value == value) {
      return;
    }
    connectionChangeController.add(value);
  }

  Future<void> checkConnection() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('example.com').timeout(
        Duration(seconds: 3),
      );
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        updateConnectionStatusSubject(ConnectionStatus.good);
      } else {
        updateConnectionStatusSubject(ConnectionStatus.none);
      }
    } on SocketException catch (_) {
      updateConnectionStatusSubject(ConnectionStatus.none);
    } on TimeoutException catch (_) {
      updateConnectionStatusSubject(ConnectionStatus.bad);
    }
  }
}

final ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton();
