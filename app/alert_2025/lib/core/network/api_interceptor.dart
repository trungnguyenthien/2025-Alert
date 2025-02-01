import 'package:dio/dio.dart';
import '../errors/exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiInterceptor extends Interceptor {
  final storage = const FlutterSecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.read(key: "access_token");
    
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    
    options.headers["Accept"] = "application/json";
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      throw UnauthorizedException();
    } else if (err.response?.statusCode == 403) {
      throw ForbiddenException();
    } else if (err.response?.statusCode == 404) {
      throw NotFoundException("Not Found: ${err.requestOptions.path}");
    } else if (err.type == DioExceptionType.connectionTimeout) {
      throw TimeoutException();
    } else if (err.type == DioExceptionType.unknown) {
      throw NoInternetException();
    } else {
      throw ServerException("API Error: ${err.message}");
    }
  }
}


// final dio = Dio();
// dio.interceptors.add(ApiInterceptor());

// final response = await dio.get("/user/123");
