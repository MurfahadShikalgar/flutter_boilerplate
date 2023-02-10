// ignore_for_file: must_call_super, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print

import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkConnectivityController extends GetxController {
  String connectionType = "No Internet";
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;
  @override
  void onInit() {
    GetConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> GetConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      print(e);
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = "Wifi Connected";
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType = "Mobile Data Connected";
        update();
        break;
      case ConnectivityResult.none:
        connectionType = "No Internet";
        update();
        break;
      default:
        break;
    }
  }

  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription.cancel();
  }
}
