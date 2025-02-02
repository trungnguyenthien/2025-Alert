import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertHelper {
  static BuildContext? _loadingContext;

  /// 🔄 Hiển thị Indicator (Loading)
  static void startLoading(BuildContext context) {
    stopLoading(); // Đảm bảo không có loading trước đó
    showDialog(
      context: context,
      barrierDismissible: false, // Không cho đóng khi bấm ra ngoài
      builder: (context) {
        _loadingContext = context;
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  /// 🛑 Ẩn Indicator
  static void stopLoading() {
    if (_loadingContext != null) {
      Navigator.of(_loadingContext!).pop();
      _loadingContext = null;
    }
  }

  /// ✅ Hiển thị thông báo thành công
  static void success(BuildContext context, String message) {
    _showAlert(context, message, "Thành công", Colors.green);
  }

  /// ⚠️ Hiển thị cảnh báo (custom button)
  static void warning(BuildContext context, String message,
      {String? buttonText, VoidCallback? onButtonPressed}) {
    _showAlert(context, message, "Cảnh báo", Colors.orange,
        buttonText: buttonText, onButtonPressed: onButtonPressed);
  }

  /// ❌ Hiển thị lỗi (custom button)
  static void error(BuildContext context, String message,
      {String? buttonText, VoidCallback? onButtonPressed}) {
    _showAlert(context, message, "Lỗi", Colors.red,
        buttonText: buttonText, onButtonPressed: onButtonPressed);
  }

  /// ℹ️ Hiển thị thông tin
  static void note(BuildContext context, String message) {
    _showToast(message);
  }

  /// 🛑 Hàm chung hiển thị alert
  static void _showAlert(BuildContext context, String message, String title, Color color,
      {String? buttonText, VoidCallback? onButtonPressed}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.info, color: color),
            const SizedBox(width: 10),
            Text(title, style: TextStyle(color: color)),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: onButtonPressed ?? () => Navigator.of(context).pop(),
            child: Text(buttonText ?? "OK"),
          ),
        ],
      ),
    );
  }

  /// 🔔 Hiển thị toast thông tin
  static void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
    );
  }
}
