import 'package:dartz/dartz.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfo(this.connectionChecker);

  Future<bool> isConnected() async {
    return connectionChecker.hasConnection;
  }
}
