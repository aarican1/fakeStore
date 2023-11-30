import 'package:dio/dio.dart';

class DioManager {
  late final Dio _dio;
  final String baseUrl;
  DioManager._({required this.baseUrl}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }
  static DioManager instance =
      DioManager._(baseUrl: 'https://fakestoreapi.com');
  Dio get service => _dio;
}

class ManagerException implements Exception {
  ManagerException.fromError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        message = dioException.message.toString();
        
      case DioExceptionType.badCertificate:
        message = dioException.message.toString();
      case DioExceptionType.sendTimeout:
        message = dioException.message.toString();
      case DioExceptionType.receiveTimeout:
        message = dioException.message.toString();
      case DioExceptionType.badResponse:
        message = dioException.message.toString();
      case DioExceptionType.cancel:
        message = dioException.message.toString();
      case DioExceptionType.connectionError:
        message = dioException.message.toString();
      case DioExceptionType.unknown:
        message = dioException.message.toString();
    }
  }
  String message = '';
  @override
  String toString() {
    return message;
  }
}
