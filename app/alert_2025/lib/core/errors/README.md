### 🧐 **Sự khác biệt giữa `Failures` và `Exceptions` trong Flutter Clean Architecture**

Khi làm việc với **Clean Architecture**, việc xử lý lỗi được chia thành **hai cấp độ**:  
- **`Exception` (Lỗi cấp thấp - Thường xảy ra trong Data Layer)**
- **`Failure` (Lỗi cấp cao - Thường xảy ra trong Domain Layer)**

📌 **Tóm tắt nhanh:**  
| Đặc điểm | `Exception` (Ngoại lệ) | `Failure` (Lỗi) |
|----------|-----------------|-----------------|
| **Vị trí** | `data/` (datasources) | `domain/` (usecases, repositories) |
| **Bản chất** | Lỗi của hệ thống (liên quan đến API, database) | Lỗi logic của ứng dụng |
| **Cách sử dụng** | `throw Exception` | Trả về `Failure` thay vì throw |
| **Ví dụ** | `throw ServerException("API timeout")` | `return Left(ServerFailure("API timeout"))` |

---

## 📌 **1. `Exception` - Xảy ra ở Data Layer**
- **Dùng để ném lỗi khi truy vấn API hoặc database**.
- **Luôn được `throw` khi xảy ra lỗi**.
- **Được bắt (`catch`) trong Repository và chuyển thành `Failure`**.

📍 **Ví dụ: `exceptions.dart`**
```dart
class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

class NoInternetException implements Exception {}

class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}
```

📍 **Sử dụng `Exception` trong DataSource (API Call)**:
```dart
Future<UserModel> fetchUserFromApi(String id) async {
  try {
    final response = await dio.get('/user/$id');
    return UserModel.fromJson(response.data);
  } on DioError catch (e) {
    throw ServerException(e.message); // 🔴 Ném Exception
  }
}
```

---

## 📌 **2. `Failure` - Xảy ra ở Domain Layer**
- **Dùng trong Repository để báo lỗi cho UseCase**.
- **Không dùng `throw`, thay vào đó trả về `Left<Failure>` của `Either`**.
- **Có thể hiển thị trên UI hoặc xử lý logic**.

📍 **Ví dụ: `failures.dart`**
```dart
import 'package:equatable/equatable.dart';

// Abstract Failure class
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Các loại Failure
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super("No internet connection");
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super("An unknown error occurred");
}
```

📍 **Chuyển `Exception` → `Failure` trong Repository**
```dart
Future<Either<Failure, User>> getUser(String id) async {
  try {
    final user = await fetchUserFromApi(id);
    return Right(user); // ✅ Thành công
  } on ServerException catch (e) {
    return Left(ServerFailure(e.message)); // 🔴 Chuyển Exception thành Failure
  } on NoInternetException {
    return Left(NoInternetFailure()); // 🔴 Lỗi mất mạng
  } catch (e) {
    return Left(UnknownFailure()); // 🔴 Lỗi không xác định
  }
}
```

📍 **Xử lý Failure trong UI**
```dart
void fetchUser() async {
  final result = await userRepository.getUser("123");
  
  result.fold(
    (failure) => print("❌ Lỗi: ${failure.message}"),
    (user) => print("✅ User: ${user.name}")
  );
}
```

---

## 🔥 **Khi nào dùng `Exception` và khi nào dùng `Failure`?**
| Trường hợp | Dùng `Exception` | Dùng `Failure` |
|-----------|-----------------|-----------------|
| **API lỗi (500, timeout, mất mạng)** | ✅ | ✅ (sau khi chuyển từ `Exception`) |
| **Lỗi database (lưu trữ, truy xuất dữ liệu)** | ✅ | ✅ |
| **Lỗi nhập liệu (Validation Error)** | ❌ | ✅ |
| **Lỗi không mong muốn (bug, crash)** | ✅ | ✅ |

🚀 **Quy tắc chung**:
- **Dữ liệu từ API/Database hỏng → `Exception` (Data Layer)**
- **Ứng dụng xử lý lỗi để hiển thị UI → `Failure` (Domain Layer)**

---

## 🎯 **Tóm tắt**
1️⃣ **`Exception`**
   - Dùng để báo lỗi khi gọi API hoặc đọc database.
   - Được **throw** trong `DataSource`.
   - Ví dụ: `throw ServerException("API timeout")`.

2️⃣ **`Failure`**
   - Dùng để truyền lỗi lên UI theo kiểu `Either<Failure, Data>`.
   - Được **trả về** từ Repository (không `throw`).
   - Ví dụ: `return Left(ServerFailure("API timeout"))`.

---

## ✅ **Kết luận**
- Nếu bạn **bắt lỗi API/database** ➝ dùng **`Exception`**.
- Nếu bạn **gửi lỗi lên UI** ➝ dùng **`Failure`**.

💡 Cách tiếp cận này giúp code **sạch hơn**, dễ test hơn và dễ bảo trì hơn! 🚀