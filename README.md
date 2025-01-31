## 🚀 **Hướng dẫn Build và Debug Flutter trên iOS & Android**  

Dưới đây là hướng dẫn chi tiết cho cả **iOS** và **Android**, giúp bạn build, mở giả lập, chạy ứng dụng, debug từng dòng code, và sử dụng **hot reload**.

---

# 🏗 **1. Hướng dẫn trên iOS**
### 📌 **Bước 1: Build Project**
Trước tiên, cần đảm bảo dự án Flutter đã được tạo hoặc bạn đang trong thư mục dự án.  
Chạy lệnh sau để build cho iOS:
```bash
flutter build ios
```
Nếu gặp lỗi liên quan đến CocoaPods, chạy:
```bash
cd ios
pod install
cd ..
```

### 📌 **Bước 2: Mở iPhone Simulator**
Mở Simulator thủ công:
```bash
open -a Simulator
```
Hoặc mở Simulator và chọn thiết bị cụ thể:
```bash
xcrun simctl list devices  # Liệt kê danh sách simulator
xcrun simctl boot "iPhone 15 Pro"  # Thay bằng tên thiết bị mong muốn
```

### 📌 **Bước 3: Run App trên iPhone Simulator**
Sau khi Simulator đã khởi động, chạy:
```bash
flutter run -d iOS
```
Hoặc chỉ định một thiết bị cụ thể (nếu có nhiều):
```bash
flutter run -d <DEVICE_ID>
```

### 📌 **Bước 4: Debug App (Line by Line)**
1. Mở **VS Code** hoặc **Android Studio**.
2. Đặt **breakpoint** bằng cách click vào lề trái trong file **Dart**.
3. Chạy app trong **Debug Mode**:
   ```bash
   flutter run --debug
   ```
4. Mở **Debug Console**, theo dõi biến, thực hiện **Step Over**, **Step Into**, **Step Out** để debug từng dòng.

### 📌 **Bước 5: Hot Reload**
Khi cần cập nhật UI nhanh chóng, chạy:
```bash
r
```
trong terminal nếu đang chạy `flutter run`.

Hoặc dùng **VS Code** / **Android Studio**:
- **VS Code**: Bấm `Shift + Command + \` hoặc nút 🔄 **Hot Reload**.
- **Android Studio**: Bấm **Hot Reload** trên thanh công cụ.

---

# 🤖 **2. Hướng dẫn trên Android**
### 📌 **Bước 1: Build Project**
Tạo file `.apk` hoặc `.aab` (để upload lên Play Store):
```bash
flutter build apk  # Xuất file .apk
flutter build appbundle  # Xuất file .aab
```

### 📌 **Bước 2: Mở Android Emulator**
Cách 1: Mở bằng Android Studio:
- **Mở Android Studio** → `Tools > Device Manager` → Chọn thiết bị → `Start`.

Cách 2: Mở bằng terminal:
```bash
emulator -list-avds  # Liệt kê danh sách AVD
emulator -avd <AVD_NAME>  # Thay bằng tên thiết bị
```

### 📌 **Bước 3: Run App trên Android Emulator**
Sau khi Emulator chạy, thực hiện:
```bash
flutter run -d android
```
Hoặc chỉ định thiết bị cụ thể:
```bash
flutter run -d <DEVICE_ID>
```

### 📌 **Bước 4: Debug App (Line by Line)**
1. Mở **VS Code** hoặc **Android Studio**.
2. Đặt **breakpoint** trong file **Dart**.
3. Chạy app trong chế độ **Debug**:
   ```bash
   flutter run --debug
   ```
4. Sử dụng Debug Console để **Step Over**, **Step Into**, **Step Out**.

### 📌 **Bước 5: Hot Reload**
Giống như iOS:
- **Terminal**: Nhấn `r` khi đang chạy `flutter run`.
- **VS Code**: Bấm `Shift + Command + \`.
- **Android Studio**: Nhấn **Hot Reload** trên thanh công cụ.

---

## 🎯 **Tóm tắt nhanh**
| Hành động           | iOS | Android |
|----------------------|------|---------|
| **Build**           | `flutter build ios` | `flutter build apk` |
| **Mở Emulator**     | `open -a Simulator` | `emulator -avd <AVD_NAME>` |
| **Run App**         | `flutter run -d iOS` | `flutter run -d android` |
| **Debug**           | `flutter run --debug` | `flutter run --debug` |
| **Hot Reload**      | `r` trong terminal, `Shift + Command + \` trên VS Code | `r` trong terminal, `Shift + Command + \` trên VS Code |

Vậy là bạn đã có hướng dẫn chi tiết cho cả iOS và Android! Nếu gặp lỗi gì, gửi mình hỗ trợ tiếp nhé! 🚀