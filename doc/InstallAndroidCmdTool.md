Để khắc phục lỗi "cmdline-tools component is missing" khi chạy lệnh `flutter doctor`, bạn có thể thực hiện theo các bước sau:

## Bước 1: Mở Android Studio
- Khởi động **Android Studio** trên máy tính của bạn.

## Bước 2: Truy cập SDK Manager
- Vào menu **Tools** và chọn **SDK Manager**. Điều này sẽ mở cửa sổ cài đặt SDK.

## Bước 3: Cài đặt Command-line Tools
- Trong cửa sổ SDK Manager, chọn tab **SDK Tools**.
- Tìm mục **Android SDK Command-line Tools (latest)** và đánh dấu vào ô chọn bên cạnh nó.
- Nhấn **Apply** để cài đặt.

## Bước 4: Chấp nhận Giấy phép Android
Sau khi cài đặt thành công, bạn cần chấp nhận các giấy phép của Android SDK:
- Mở Terminal và chạy lệnh:
  ```bash
  flutter doctor --android-licenses
  ```
- Làm theo hướng dẫn để chấp nhận tất cả các giấy phép.

## Bước 5: Kiểm tra lại cấu hình Flutter
Chạy lại lệnh `flutter doctor` để xác nhận rằng mọi thứ đã được cấu hình đúng:
```bash
flutter doctor
```