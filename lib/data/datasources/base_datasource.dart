import 'package:dio/dio.dart';
import 'package:edusys_client/core/config/config_state.dart';

class BaseDatasource {
  final Dio dio;

  BaseDatasource()
      : dio = Dio(
          BaseOptions(
            baseUrl: ConfigState.apiAddressController.text, // Substitua pela URL da sua API
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }
}
