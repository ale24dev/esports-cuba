import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:esports_cuba/src/shared/constants/connectivity_status.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connnectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    var subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      ConnectivityStatus connectionStatus = _getStatusFromResult(result);
      print("RESULT: " + result.toString());
      print("RESULT NAME: " + result.name);

      connnectionStatusController.add(connectionStatus);
      // Got a new connectivity status!
    });
    // ConnectivityService().onConnectivityChanged.listen((ConnectivityResult result) {
    // Convert this result to enum
    //ConnectivityStatus connectionStatus = _getStatusFromResult(result);

    // Emit this over stream
    //connnectionStatusController.add(connectionStatus);
    //});
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
