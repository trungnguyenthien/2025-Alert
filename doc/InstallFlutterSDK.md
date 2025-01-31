### Hướng dẫn cài đặt Flutter trên macOS và tạo project đầu tiên "2025-Alert"

#### **Bước 1: Cài đặt Flutter**
1. **Tải Flutter SDK**
   - Truy cập trang chủ Flutter: [https://docs.flutter.dev/get-started/install/macos](https://docs.flutter.dev/get-started/install/macos)
   - Tải về bản **Flutter stable** (file `.zip`).

2. **Giải nén và di chuyển thư mục**
   ```bash
   unzip flutter_macos_<version>.zip
   mv flutter ~/development/flutter
   ```

3. **Thêm Flutter vào PATH**
   ```bash
   export PATH="$PATH:$HOME/development/flutter/bin"
   ```

   Để giữ lại sau khi restart máy, thêm dòng trên vào `~/.zshrc` (nếu dùng Zsh) hoặc `~/.bashrc` (nếu dùng Bash):
   ```bash
   echo 'export PATH="$PATH:$HOME/development/flutter/bin"' >> ~/.zshrc
   source ~/.zshrc
   ```

4. **Kiểm tra cài đặt**
   ```bash
   flutter doctor
   ```

   Nếu thiếu Xcode hoặc Android Studio, hãy cài đặt theo hướng dẫn.

#### **Bước 2: Cài đặt các công cụ cần thiết**
1. **Cài đặt Xcode** (nếu chưa có)
   ```bash
   xcode-select --install
   ```

2. **Cài đặt CocoaPods**
   ```bash
   sudo gem install cocoapods
   ```

3. **Cài đặt Android Studio** (nếu muốn build Android)
   - Tải từ: [https://developer.android.com/studio](https://developer.android.com/studio)
   - Cài đặt plugin Flutter & Dart từ **Preferences > Plugins**.

4. **Chạy lại `flutter doctor` để kiểm tra**
   ```bash
   flutter doctor
   ```

#### **Bước 3: Tạo Project Flutter đầu tiên**
1. **Tạo project "2025-Alert"**
   ```bash
   flutter create 2025-Alert
   cd 2025-Alert
   ```

2. **Chạy ứng dụng trên iOS Simulator**
   ```bash
   open -a Simulator
   flutter run
   ```

   Nếu dùng thiết bị thật, cần cấp quyền:
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   ```

3. **Chạy ứng dụng trên Android Emulator**
   - Mở Android Studio, bật AVD Emulator.
   - Chạy:
     ```bash
     flutter run
     ```

#### **Bước 4: Mở project trong VS Code hoặc Android Studio**
- VS Code:
  ```bash
  code .
  ```
- Android Studio:
  ```bash
  open -a "Android Studio" .
  ```

#### **Bước 5: Chỉnh sửa ứng dụng**
- Mở `lib/main.dart`, sửa nội dung `MyHomePage` để hiển thị dòng chữ **"Welcome to 2025-Alert!"**.

  ```dart
  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: '2025-Alert',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      );
    }
  }

  class MyHomePage extends StatelessWidget {
    const MyHomePage({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('2025-Alert'),
        ),
        body: const Center(
          child: Text(
            'Welcome to 2025-Alert!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    }
  }
  ```

4. **Hot Reload để xem thay đổi ngay lập tức**
   ```bash
   flutter run
   ```

#### **Bước 6: Build và Xuất bản ứng dụng**
1. **Build iOS**
   ```bash
   flutter build ios
   ```
   Nếu cần xuất file `.ipa` để upload lên App Store, chạy:
   ```bash
   cd ios
   pod install
   xcodebuild -workspace Runner.xcworkspace -scheme Runner -sdk iphoneos -configuration Release archive
   ```

2. **Build APK**
   ```bash
   flutter build apk
   ```

3. **Build App Bundle (dành cho Play Store)**
   ```bash
   flutter build appbundle
   ```

---

Bây giờ bạn đã có project Flutter "2025-Alert" chạy được trên cả iOS và Android. Nếu có lỗi gì trong quá trình cài đặt, bạn có thể gửi lỗi mình sẽ hỗ trợ! 🚀