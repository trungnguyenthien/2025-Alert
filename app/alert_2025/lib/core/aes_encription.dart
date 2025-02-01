import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';
import 'unique_device_id.dart';

class AesEncryption {
  static const _storage = FlutterSecureStorage();
  static const _ivKey = "aes_iv"; // Lưu IV trong SecureStorage

  /// 🔑 Lấy hoặc tạo key AES từ UniqueDeviceId
  static Future<encrypt.Key> _getEncryptionKey() async {
    String? uniqueId = await UniqueDeviceId.getUniqueId();
    if (uniqueId == null) {
      throw Exception("Không thể lấy Unique ID.");
    }

    // Hash Unique ID thành key 256-bit (32 bytes) dùng SHA-256
    var keyBytes = sha256.convert(utf8.encode(uniqueId)).bytes;
    return encrypt.Key(Uint8List.fromList(keyBytes));
  }

  /// 🔄 Lấy hoặc tạo IV từ SecureStorage
  static Future<encrypt.IV> _getIV() async {
    String? ivString = await _storage.read(key: _ivKey);
    
    if (ivString == null) {
      final newIV = encrypt.IV.fromLength(16);
      await _storage.write(key: _ivKey, value: base64Encode(newIV.bytes));
      return newIV;
    }
    
    return encrypt.IV.fromBase64(ivString);
  }

  /// 🔐 Mã hóa dữ liệu
  static Future<String> encryptData(String plainText) async {
    final key = await _getEncryptionKey();
    final iv = await _getIV();
    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  /// 🔓 Giải mã dữ liệu
  static Future<String> decryptData(String encryptedText) async {
    try {
      final key = await _getEncryptionKey();
      final iv = await _getIV();
      final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: "PKCS7"));

      final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
      return decrypted;
    } catch (e) {
      throw Exception("Giải mã thất bại: $e");
    }
  }
}
