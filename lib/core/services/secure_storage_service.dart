import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static SecureStorageService? _instance;
  static FlutterSecureStorage? _storage;

  SecureStorageService._internal();

  static SecureStorageService getInstance() {
    _instance = SecureStorageService._internal();
    _storage = const FlutterSecureStorage();
    return _instance!;
  }

  Future<void> write({required String key, required String value}) async {
    await _storage!.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return await _storage!.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await _storage!.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage!.deleteAll();
  }
}
