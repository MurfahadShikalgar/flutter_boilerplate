import 'package:get/get.dart';
import 'package:practice_application/utils/network/network_connectivity.dart';

class NetworkBinding extends Bindings{

  // dependence injection attach our class.
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.lazyPut<NetworkConnectivityController>(() => NetworkConnectivityController());
  }

}