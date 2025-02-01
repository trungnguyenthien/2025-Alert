import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class UniqueDeviceId {
  static Future<String?> getUniqueId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? uniqueId;

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      ///IDFV là một loại định danh duy nhất (UIUD) được gán cho một tài khoản cụ thể của nhà phát triển ứng dụng iOS và có thể được sử dụng cho nhiều ứng dụng khác nhau thuộc cùng một nhà phát triển. Các ứng dụng được xuất bản bởi cùng một nhà phát triển và đang chạy trên một thiết bị sẽ sở hữu mã IDFV giống nhau. Nếu có nhiều ứng dụng trên một thiết bị người dùng do các nhà phát triển khác nhau quản lý, mỗi ứng dụng sẽ có một mã IDFV khác nhau. Các ứng dụng trên các thiết bị khác nhau cũng có các mã IDFV khác nhau, dù có cùng nhà phát triển hay không đi chăng nữa.
      uniqueId = iosInfo.identifierForVendor; // ID duy nhất trên iOS
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      uniqueId = androidInfo.id; // ID duy nhất trên Android
    }

    return uniqueId;
  }
}

// void main() async {
//   String? deviceId = await UniqueDeviceId.getUniqueId();
//   print('Unique Device ID: $deviceId');
// }
