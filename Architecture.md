## 🚀 **Kiến trúc dự án Flutter tối ưu cho dự án vừa phải**  

Với một dự án Flutter **không quá lớn**, bạn nên sử dụng kiến trúc **Clean Architecture + BLoC (hoặc Riverpod)** để có:
✅ **Code dễ bảo trì**  
✅ **Tách biệt rõ ràng giữa UI, logic, và dữ liệu**  
✅ **Dễ dàng mở rộng khi cần**  

---

## 📌 **1. Cấu trúc thư mục**
Dưới đây là **cấu trúc thư mục hợp lý cho dự án Flutter vừa phải**:

```
lib/
│── main.dart               # Điểm khởi chạy chính
│── core/                   # Các thành phần chung
│   ├── config/             # Cấu hình (AppConfig, Env)
│   ├── constants/          # Hằng số, enum
│   ├── errors/             # Xử lý lỗi chung
│   ├── network/            # HTTP client (Dio, Retrofit)
│   ├── theme/              # Chủ đề (ThemeData)
│── data/                   # Lớp dữ liệu (repository, API, database)
│   ├── datasources/        # API & Local Data
│   │   ├── remote/         # API từ server
│   │   ├── local/          # Database (SQLite, Hive)
│   ├── models/             # Định nghĩa Model
│   ├── repositories/       # Repository (kết hợp dữ liệu từ API/DB)
│── domain/                 # Lớp business logic (Use Cases, Entities)
│   ├── entities/           # Định nghĩa Entity
│   ├── usecases/           # Business Logic (định nghĩa nghiệp vụ)
│── presentation/           # Lớp UI (screens, widgets, bloc)
│   ├── blocs/              # BLoC/Riverpod (State Management)
│   ├── screens/            # Màn hình chính
│   ├── widgets/            # Widget tái sử dụng
│── routes/                 # Định tuyến ứng dụng
│── main.dart               # Entry point
```


```sh
mkdir -p lib/{core/{config,constants,errors,network,theme},data/{datasources/{remote,local},models,repositories},domain/{entities,usecases},presentation/{blocs,screens,widgets},routes}
```

---

## 📌 **2. Giải thích chi tiết các phần**
### **🛠 `core/` - Thành phần chung**
- `config/` → Chứa các cài đặt chung như `AppConfig`
- `constants/` → Chứa các hằng số dùng trong app
- `errors/` → Xử lý lỗi chung (Exception, Failure)
- `network/` → Cấu hình **Dio**, Interceptor, Logging
- `theme/` → **ThemeData** cho toàn app

### **📂 `data/` - Data Layer (Làm việc với API, Database)**
- **`datasources/`**
  - `remote/` → API gọi từ server (`Dio`, `Retrofit`)
  - `local/` → Database (`Hive`, `SharedPreferences`, `SQLite`)
- **`models/`** → Chứa các class `fromJson/toJson`
- **`repositories/`** → Chứa logic lấy dữ liệu từ API/local DB

🔹 **Ví dụ model `UserModel`**
```dart
class UserModel {
  final String id;
  final String name;

  UserModel({required this.id, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
```

---

### **📂 `domain/` - Business Logic Layer (Nghiệp vụ)**
- **`entities/`** → Các class thuần (Entity)
- **`usecases/`** → Chứa business logic độc lập

🔹 **Ví dụ UseCase**
```dart
class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<User> call(String id) async {
    return await repository.getUserById(id);
  }
}
```

---

### **📂 `presentation/` - UI Layer**
- **`screens/`** → Các màn hình chính (`HomeScreen`, `LoginScreen`)
- **`widgets/`** → Các widget tái sử dụng
- **`blocs/`** → State management (BLoC/Riverpod)

🔹 **Ví dụ BLoC**
```dart
class UserBloc extends Cubit<UserState> {
  final GetUser getUser;

  UserBloc(this.getUser) : super(UserInitial());

  void fetchUser(String id) async {
    emit(UserLoading());
    try {
      final user = await getUser(id);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError("Failed to load user"));
    }
  }
}
```

---

## 📌 **3. Lựa chọn State Management**
Bạn có thể chọn:
- **BLoC** (cấu trúc mạnh, dễ test)
- **Riverpod** (dễ dùng hơn Provider, an toàn hơn)
- **GetX** (dễ dùng nhưng không phù hợp với dự án lớn)

🔥 **Gợi ý**: Nếu dự án Flutter **vừa phải**, **BLoC hoặc Riverpod** là lựa chọn tối ưu!

---

## 📌 **4. Gợi ý thư viện hữu ích**
| Chức năng | Thư viện |
|-----------|---------|
| State Management | `flutter_bloc`, `riverpod` |
| API | `dio`, `retrofit` |
| Database | `hive`, `sqflite` |
| UI | `flutter_svg`, `lottie`, `cached_network_image` |
| Routing | `go_router`, `auto_route` |
| Logging | `logger`, `flutter_bloc_observer` |

Cài đặt thư viện:
```bash
flutter pub add flutter_bloc dio retrofit hive go_router
```

---

## 📌 **5. Khi nào dùng Clean Architecture?**
- Khi dự án **có thể mở rộng trong tương lai**.
- Khi muốn **code dễ bảo trì, dễ test**.
- Khi team **làm việc nhóm, cần phân lớp rõ ràng**.

Nếu dự án **rất nhỏ** (chỉ có 1-2 màn hình), có thể **giảm bớt** `domain/` layer để code đơn giản hơn.

---

## 🎯 **Kết luận**
- **Dự án Flutter vừa phải** nên dùng **Clean Architecture + BLoC/Riverpod**.
- **Cấu trúc thư mục** rõ ràng giúp code **dễ bảo trì, mở rộng**.
- **BLoC hoặc Riverpod** là lựa chọn tối ưu.
