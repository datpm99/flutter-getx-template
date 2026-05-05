import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  final _storage = FlutterSecureStorage();

  /// --- Token ---
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'token', value: token);
  }

  Future<String> getToken() async {
    return await _storage.read(key: 'token') ?? '';
  }

  /// --- Language ---
  Future<void> saveLanguage(String lang) async {
    await _storage.write(key: 'language', value: lang);
  }

  Future<String> getLanguage() async {
    return await _storage.read(key: 'language') ?? 'vi_VN';
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
