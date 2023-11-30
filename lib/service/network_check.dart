import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkCheck {
  Future<NetworkCheckResults> checkFirstTime();
  void handleNetworkCheck(void Function(NetworkCheckResults results) onCheck);
  void dispose();
}

class NetworkCheck extends INetworkCheck {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? subscription;
  NetworkCheck() {
    _connectivity = Connectivity();
  }

  @override
  Future<NetworkCheckResults> checkFirstTime() async {
    ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    return NetworkCheckResultsExtension.checkResults(connectivityResult);
  }

  @override
  void dispose() {
    subscription?.cancel();
  }

  @override
  void handleNetworkCheck(void Function(NetworkCheckResults results) onCheck) {
    subscription = _connectivity.onConnectivityChanged.listen((event) {
      onCheck.call(NetworkCheckResultsExtension.checkResults(event));
    });
    
  }
}

enum NetworkCheckResults { on, off }

extension NetworkCheckResultsExtension on NetworkCheckResults {
  static NetworkCheckResults checkResults(ConnectivityResult results) {
    switch (results) {
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
      case ConnectivityResult.vpn:
        return NetworkCheckResults.on;
      case ConnectivityResult.none:
      default:
        return NetworkCheckResults.off;
    }
  }
}
