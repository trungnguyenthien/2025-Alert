import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}


// final networkInfo = NetworkInfoImpl(Connectivity());

// if (await networkInfo.isConnected) {
//   print("Có kết nối Internet!");
// } else {
//   print("Không có kết nối Internet!");
// }
