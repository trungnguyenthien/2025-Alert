/// =========================================================
///  ✅ Lớp cha cho các Exception liên quan đến API
/// =========================================================
abstract class ApiException implements Exception {
  final String message;
  final int? statusCode; // HTTP Status Code (nếu có)
  ApiException(this.message, {this.statusCode});
}

/// ❌ Exception: Khi API trả về lỗi 400 - 499 (Client Error)
/// 👉 Ví dụ: Sai mật khẩu, dữ liệu đầu vào không hợp lệ
class ClientException extends ApiException {
  ClientException(super.message, {super.statusCode});
}

/// ❌ Exception: Khi API trả về lỗi 500 - 599 (Server Error)
/// 👉 Ví dụ: Lỗi server, API không hoạt động
class ServerException extends ApiException {
  ServerException(super.message, {super.statusCode});
}

/// ❌ Exception: Khi API không có kết nối Internet
/// 👉 Ví dụ: WiFi bị mất, mạng di động không có sóng
class NoInternetException extends ApiException {
  NoInternetException() : super("No internet connection.");
}

/// ❌ Exception: Khi API timeout do mạng yếu hoặc server quá tải
/// 👉 Ví dụ: Request API lâu hơn 30 giây mà chưa có phản hồi
class TimeoutException extends ApiException {
  TimeoutException() : super("Request timeout.");
}

/// ❌ Exception: Khi nhận dữ liệu JSON không hợp lệ từ API
/// 👉 Ví dụ: API trả về dữ liệu trống hoặc sai định dạng JSON
class InvalidResponseException extends ApiException {
  InvalidResponseException(super.message);
}

/// ❌ Exception: Khi gọi API mà không có quyền (401 Unauthorized)
/// 👉 Ví dụ: Token đã hết hạn, chưa đăng nhập
class UnauthorizedException extends ApiException {
  UnauthorizedException() : super("Unauthorized access.");
}

/// ❌ Exception: Khi API từ chối truy cập (403 Forbidden)
/// 👉 Ví dụ: Người dùng không có quyền thực hiện hành động này
class ForbiddenException extends ApiException {
  ForbiddenException() : super("Access forbidden.");
}

/// ❌ Exception: Khi không tìm thấy dữ liệu trên API (404 Not Found)
/// 👉 Ví dụ: Người dùng nhập ID không tồn tại trong hệ thống
class NotFoundException extends ApiException {
  NotFoundException(super.message);
}

/// ❌ Exception: Khi API gặp lỗi không xác định
/// 👉 Ví dụ: API trả về lỗi không nằm trong danh sách trên
class UnknownApiException extends ApiException {
  UnknownApiException() : super("Unknown API error occurred.");
}

/// =========================================================
///  ✅ Lớp cha cho các Exception liên quan đến Database
/// =========================================================
abstract class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

/// ❌ Exception: Khi không thể truy cập Database
/// 👉 Ví dụ: Ứng dụng chưa mở database hoặc quyền bị từ chối
class DatabaseAccessException extends DatabaseException {
  DatabaseAccessException() : super("Database access denied.");
}

/// ❌ Exception: Khi không tìm thấy dữ liệu trong Database
/// 👉 Ví dụ: Tìm kiếm User bằng ID nhưng không có trong SQLite
class DatabaseNotFoundException extends DatabaseException {
  DatabaseNotFoundException(super.message);
}

/// ❌ Exception: Khi xảy ra lỗi trong quá trình đọc dữ liệu từ Database
/// 👉 Ví dụ: Truy vấn SQLite/Hive nhưng dữ liệu bị lỗi
class DatabaseReadException extends DatabaseException {
  DatabaseReadException(super.message);
}

/// ❌ Exception: Khi xảy ra lỗi trong quá trình ghi dữ liệu vào Database
/// 👉 Ví dụ: Lưu User vào SQLite nhưng lỗi
class DatabaseWriteException extends DatabaseException {
  DatabaseWriteException(super.message);
}

/// ❌ Exception: Khi không thể xóa dữ liệu trong Database
/// 👉 Ví dụ: Xóa dữ liệu nhưng khóa ngoại trong SQLite cản trở
class DatabaseDeleteException extends DatabaseException {
  DatabaseDeleteException(super.message);
}

/// ❌ Exception: Khi thao tác với Database gặp lỗi không xác định
/// 👉 Ví dụ: SQLite bị hỏng, file database bị mất
class UnknownDatabaseException extends DatabaseException {
  UnknownDatabaseException() : super("Unknown database error occurred.");
}

/**
Future<UserModel> fetchUserFromApi(String id) async {
  try {
    final response = await dio.get('/user/$id');

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else if (response.statusCode == 403) {
      throw ForbiddenException();
    } else if (response.statusCode == 404) {
      throw NotFoundException("User not found.");
    } else if (response.statusCode! >= 500) {
      throw ServerException("Server error occurred.");
    } else {
      throw UnknownApiException();
    }
  } on DioError catch (e) {
    if (e.type == DioErrorType.connectionTimeout) {
      throw TimeoutException();
    } else if (e.type == DioErrorType.unknown) {
      throw NoInternetException();
    } else {
      throw ServerException(e.message);
    }
  }
}


Future<UserModel> getUserFromDatabase(int id) async {
  try {
    final userData = await database.query("users", where: "id = ?", whereArgs: [id]);

    if (userData.isEmpty) {
      throw DatabaseNotFoundException("User with ID $id not found.");
    }

    return UserModel.fromJson(userData.first);
  } on DatabaseAccessException {
    throw DatabaseAccessException();
  } on DatabaseReadException catch (e) {
    throw DatabaseReadException("Error reading user data: ${e.message}");
  } catch (e) {
    throw UnknownDatabaseException();
  }
}
 */
