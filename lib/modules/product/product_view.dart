import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/theme/app_colors.dart';
import 'package:get/get.dart';

import '/core/theme/app_decoration.dart';
import '/core/theme/app_text_styles.dart';
import '/widget/listview_widget.dart';
import 'product_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        title: Text(
          'Products',
          style: AppTextStyles.normalTextW700(color: Colors.white, size: 20),
        ),
      ),
      body: GetBuilder<ProductController>(
        builder: (c) {
          return ListViewWidget(
            isLoading: c.isLoading,
            itemCount: c.products.length,
            scrollController: c.scrollController,
            onRefresh: c.onRefreshData,
            showIndicatorLoadMore: (!c.isLoadData),
            padding: EdgeInsetsGeometry.all(15),
            child: (ctx, index) {
              final item = c.products[index];

              return Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.grey6),
                  boxShadow: AppDecoration.boxShadow1(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: AppTextStyles.mediumTextW700()),
                    SizedBox(height: 5),
                    Text(
                      item.description,
                      style: AppTextStyles.smallText(color: Colors.grey),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$${item.price}',
                      style: AppTextStyles.normalTextW700(color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
