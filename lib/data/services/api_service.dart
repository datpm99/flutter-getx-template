import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '/core/constants/app_constants.dart';
import '/core/utils/app_talker.dart';
import 'storage_service.dart';

class ApiService extends GetxService {
  late Dio _dio;

  Future<void> init() async {
    var timeout = Duration(seconds: AppConstants.apiTimeout);

    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.domain,
        headers: {'content-type': 'application/json'},
        connectTimeout: timeout,
        receiveTimeout: timeout,
        sendTimeout: timeout,
      ),
    );

    // --- interceptors ---
    _dio.interceptors.add(
      TalkerDioLogger(
        talker: AppTalker.talker,
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
        ),
      ),
    );
  }

  Future<void> setupHeaderRequest(bool isToken) async {
    _dio.options.headers = {};
    if (isToken) {
      final storage = Get.find<StorageService>();
      final token = await storage.getToken();
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }

    _dio.options.responseType = ResponseType.json;
    _dio.options.contentType = 'application/json';
  }

  Future<Response?> _request(Future<Response> Function() call) async {
    try {
      return await call();
    } on DioException catch (e) {
      if (e.response != null) return e.response;
      debugPrint('_dio Error: ${e.message}');
    } catch (e) {
      debugPrint('Generic Error: ${e.toString()}');
    }
    return null;
  }

  Future<Response?> get({
    required String url,
    bool isToken = true,
    Map<String, dynamic>? param,
  }) async {
    await setupHeaderRequest(isToken);
    return await _request(() => _dio.get(url, queryParameters: param));
  }

  Future<Response?> post({
    required String url,
    bool isToken = true,
    dynamic data,
    Map<String, dynamic>? param,
  }) async {
    await setupHeaderRequest(isToken);
    return await _request(
      () => _dio.post(url, data: data, queryParameters: param),
    );
  }

  Future<Response?> put({
    required String url,
    bool isToken = true,
    dynamic data,
    Map<String, dynamic>? param,
  }) async {
    await setupHeaderRequest(isToken);
    return await _request(
      () => _dio.put(url, data: data, queryParameters: param),
    );
  }

  Future<Response?> delete({
    required String url,
    bool isToken = true,
    dynamic data,
    Map<String, dynamic>? param,
  }) async {
    await setupHeaderRequest(isToken);
    return await _request(
      () => _dio.delete(url, data: data, queryParameters: param),
    );
  }

  Future<Response?> getFile({
    required String url,
    bool isToken = true,
    Map<String, dynamic>? param,
  }) async {
    await setupHeaderRequest(isToken);
    _dio.options.responseType = ResponseType.bytes;
    return await _request(() => _dio.get(url, queryParameters: param));
  }

  Future<Response?> uploadFile({
    required String url,
    bool isToken = true,
    required File file,
  }) async {
    await setupHeaderRequest(isToken);
    final partFile = await MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );
    FormData formData = FormData.fromMap({"file": partFile});

    return await _request(() => _dio.post(url, data: formData));
  }

  Future<Response?> uploadMultipleFile({
    required String url,
    bool isToken = true,
    required List<File> files,
  }) async {
    await setupHeaderRequest(isToken);
    _dio.options.contentType = 'multipart/form-data';

    final formData = FormData();
    for (File file in files) {
      final itemFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      );
      formData.files.add(MapEntry("files", itemFile));
    }
    formData.fields.add(const MapEntry("fileType", 'FILE_EXTRA'));

    return await _request(() => _dio.post(url, data: formData));
  }
}
