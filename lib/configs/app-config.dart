import 'package:flutter/foundation.dart' as Foundation;

class AppConfig {
  String? appName;

  bool showDebugBanner = true;

  bool isDebugMode = Foundation.kDebugMode;

  bool isReleaseMode = Foundation.kReleaseMode;

  bool isWeb = Foundation.kIsWeb;

  bool isProfileMode = Foundation.kProfileMode;

  // isProduction = bool.fromEnvironment("dart.vm.product");
  initalize() {
    if (isReleaseMode) {
      appName = "Farm-Setu-App";
      showDebugBanner = false;
    } else {
      appName = "Farm-Setu-App-Debug";
    }
  }
}

final AppConfig appConfig = AppConfig();
