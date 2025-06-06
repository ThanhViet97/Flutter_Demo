import 'package:dio/dio.dart';
import '../constants/app_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio) {
    _setupInterceptors();
  }

  Dio get dio => _dio;

  void _setupInterceptors() {
    _dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: AppConstants.timeoutDuration,
      receiveTimeout: AppConstants.timeoutDuration,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print(obj.toString()),
      ),
    );
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } catch (e) {
      rethrow;
    }
  }
} 