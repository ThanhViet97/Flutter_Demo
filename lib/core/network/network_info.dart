import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    try {
      final result = await connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      // If connectivity check fails, assume no connection
      return false;
    }
  }
} 