import 'package:encrypt/encrypt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final key = Key.fromUtf8("1245714587458888"); //hardcode

class SecureStorageService {
  SecureStorageService._();

  static final SecureStorageService _instance = SecureStorageService._();

  factory SecureStorageService() {
    return _instance;
  }


  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  final iv = IV.fromUtf8("e16ce888a20dadb8"); //hardcode

  Future<void> saveToken(
    String accessToken,
  ) async {
    await SecureStorageService().write(
      'accessToken',
      accessToken,
    );
  }

  Future<String?> getToken() async {
    return await getValue('accessToken');
  }

  Future<void> removeToken() async {
    await SecureStorageService().deleteValue("accessToken");
  }

  Future<String> write(String key, String value) async {
    await storage.write(key: key, value: value);
    return value;
  }

  Future<String> getValue(String key) async {
    try {
      return await storage.read(key: key) ?? "";
    } catch (e) {
      return "";
    }
  }

  Future<void> deleteValue(String key) async {
    try {
      await storage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
