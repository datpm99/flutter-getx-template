import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '/core/extensions/widget_ext.dart';
import '/core/theme/app_decoration.dart';

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
      shimmerGradient: LinearGradient(
        colors: [
          Color(0xffF4F4F4),
          Color(0xffe8e8e8),
          Color(0xffe8e8e8),
          Color(0xffe8e8e8),
          Color(0xffF4F4F4),
        ],
        stops: [0.0, 0.3, 0.5, 0.7, 1],
        begin: Alignment(-2.4, -0.2),
        end: Alignment(2.4, 0.2),
        tileMode: TileMode.clamp,
      ),
      child: child ?? ListSkeletonWidget(),
    );
  }
}

class ListSkeletonWidget extends StatelessWidget {
  const ListSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8),
        decoration: AppDecoration.boxDecoration1(),
        child: Column(
          children: [
            Row(
              children: [
                SkeletonAvatar(
                  style: SkeletonAvatarStyle(shape: BoxShape.circle),
                ),
                SizedBox(width: 8),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                    lines: 2,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      height: 10,
                      randomLength: true,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ).expand(),
              ],
            ),
            SizedBox(height: 5),
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 3,
                spacing: 8,
                lineStyle: SkeletonLineStyle(
                  height: 8,
                  randomLength: true,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                width: 64,
                height: 8,
                padding: EdgeInsets.symmetric(horizontal: 8),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
