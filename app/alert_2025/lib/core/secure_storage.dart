import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Tạo một instance của FlutterSecureStorage
  static final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Phương thức để lưu dữ liệu
  static Future<void> saveData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Phương thức để đọc dữ liệu
  static Future<String?> readData(String key) async {
    return await _storage.read(key: key);
  }

  // Phương thức để đọc tất cả dữ liệu
  static Future<Map<String, String>> readAllData() async {
    return await _storage.readAll();
  }

  // Phương thức kiểm tra sự tồn tại của một khóa
  static Future<bool> containsData(String key) async {
    return await _storage.containsKey(key: key);
  }

  // Phương thức để xóa dữ liệu theo khóa
  static Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
  }

  // Phương thức để xóa tất cả dữ liệu
  static Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }
}
