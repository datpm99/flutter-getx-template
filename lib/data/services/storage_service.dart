import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  final _storage = FlutterSecureStorage();
  String _tokenTimeout = '';

  Future<StorageService> init() async {
    _tokenTimeout = await _storage.read(key: 'tokenTimeout') ?? '';
    return this;
  }

  /// --- accessToken ---
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
  }

  Future<String> getAccessToken() async {
    return await _storage.read(key: 'accessToken') ?? '';
  }

  /// --- refreshToken ---
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: 'refreshToken', value: token);
  }

  Future<String> getRefreshToken() async {
    return await _storage.read(key: 'refreshToken') ?? '';
  }

  /// --- tokenTimeout ---
  Future<void> saveTokenTimeout(String token) async {
    _tokenTimeout = token;
    await _storage.write(key: 'tokenTimeout', value: token);
  }

  String getTokenTimeout() => _tokenTimeout;

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
