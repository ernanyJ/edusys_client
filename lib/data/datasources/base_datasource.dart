import 'package:dio/dio.dart';

class BaseDatasource {
  final Dio dio;

  BaseDatasource()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'http://192.168.1.7:8080', // Substitua pela URL da sua API
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }
}
