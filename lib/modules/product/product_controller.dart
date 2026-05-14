import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/mixin/load_more_mixin.dart';
import '/data/models/response/product_response.dart';
import '/data/repository/product_repository.dart';

class ProductController extends GetxController with LoadMoreMixin {
  final _productRepo = ProductRepository();
  List<Product> products = [];

  @override
  Future<void> getData() async {
    final result = await _productRepo.getProducts(pageIndex: page - 1);
    isLoading = false;

    if (result != null) {
      products.addAll(result.products);
      if (page == result.total) isLoadMore = false;
      update();
    } else {
      debugPrint('error ---> getListUser');
      update();
    }
  }

  Future<void> onRefreshData() async {
    products.clear();
    refreshData();
  }

  @override
  void updateData() {
    update();
  }

  @override
  void onReady() {
    super.onReady();
    listenerLoadMoreData();
    getData();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
