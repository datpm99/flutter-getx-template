import 'package:get/get.dart';

import '/core/utils/app_helper.dart';
import '/core/values/end_points.dart';
import '/data/models/response/product_response.dart';
import '/data/services/api_service.dart';

class ProductRepository {
  final ApiService _apiService = Get.find<ApiService>();

  Future<ProductResponse?> getProducts({required int pageIndex}) async {
    final response = await _apiService.get(
      url: EndPoints.product,
      isToken: true,
      param: {
        'limit': 15,
        'skip': pageIndex * 15,
        'select': 'title,description,price',
      },
    );

    if (response != null && response.statusCode == 200) {
      return ProductResponse.fromJson(response.data);
    }

    if (response != null) {
      AppHelper.showError(response.data['message']);
    }

    return null;
  }
}
