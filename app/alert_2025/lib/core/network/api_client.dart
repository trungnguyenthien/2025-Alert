import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_interceptor.dart';

class ApiResponse {
  final String? rawData;
  final int? statusCode;
  final String? statusMessage;
  final Map<String, String>? headers;
  final bool isRedirect;

  ApiResponse({
    required this.rawData,
    required this.statusCode,
    required this.statusMessage,
    required this.headers,
    required this.isRedirect,
  });

  /// Convert từ `Response` của `Dio`
  factory ApiResponse.fromDioResponse(Response response) {
    return ApiResponse(
      rawData: response.data.toString(),
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers.map.map((key, value) => MapEntry(key, value.toString())),
      isRedirect: response.isRedirect,
    );
  }
}

class ApiClient {
  final String baseUrl;
  final bool enableLogging;
  late final Dio _dio;

  ApiClient({this.baseUrl = "https://api.example.com", this.enableLogging = true}) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: "application/json",
    ));

    _dio.interceptors.add(ApiInterceptor());

    if (enableLogging) {
      _dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ));
    }
  }

  /// **GET request**
  Future<ApiResponse> get(String path, {Map<String, dynamic>? params, Map<String, String>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: params,
        options: Options(headers: headers),
      );
      return ApiResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// **POST request**
  Future<ApiResponse> post(String path, {dynamic data, Map<String, String>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return ApiResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// **PUT request**
  Future<ApiResponse> put(String path, {dynamic data, Map<String, String>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return ApiResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// **DELETE request**
  Future<ApiResponse> delete(String path, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        options: Options(headers: headers),
      );
      return ApiResponse.fromDioResponse(response);
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  /// **Xử lý lỗi DioException**
  ApiResponse _handleDioError(DioException e) {
    return ApiResponse(
      rawData: e.response?.data?.toString(),
      statusCode: e.response?.statusCode,
      statusMessage: e.response?.statusMessage ?? e.message,
      headers: e.response?.headers.map.map((key, value) => MapEntry(key, value.toString())),
      isRedirect: e.response?.isRedirect ?? false,
    );
  }
}

// final response = await apiClient.get("/user/123");

// if (response.statusCode == 200) {
//   print("✅ Thành công: ${response.rawData}");
// } else {
//   print("❌ Lỗi (${response.statusCode}): ${response.statusMessage}");
// }
