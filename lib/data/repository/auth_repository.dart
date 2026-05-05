import 'package:get/get.dart';

import '/core/values/end_points.dart';
import '/data/models/response/login_response.dart';
import '/data/services/api_service.dart';

class AuthRepository {
  final ApiService _apiService = Get.find<ApiService>();

  Future<LoginResponse?> login({
    required String username,
    required String password,
  }) async {
    final response = await _apiService.post(
      url: EndPoints.login,
      isToken: false,
      data: {'username': username, 'password': password},
    );

    if (response != null && response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    }
    return null;
  }
}
