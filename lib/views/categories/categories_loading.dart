import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: Colors.grey.withOpacity(0.8),
      child: Container(
        color: Colors.transparent,
        width: 230.w,
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10.h,
            ),
            GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.6,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                margin: EdgeInsetsDirectional.all(5.r),
                decoration: BoxDecoration(
                  color: Colors.grey
                ),
              ),
              itemCount: 9,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: List.generate(
                3,
                    (index) => Container(
                  margin: EdgeInsetsDirectional.all(5.r),
                  padding: EdgeInsetsDirectional.all(3.r),
                  color: Colors.grey,
                  width: 66.w,
                  height: 20.h,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              height: 100.h,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 50.w,
              height: 20.h,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10.h,
            ),
            GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.8,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                height: 10.h,
                margin: EdgeInsetsDirectional.all(5.r),
                decoration: BoxDecoration(
                  color: Colors.grey
                ),
              ),
              itemCount: 9,
            ),
          ],
        ),
      ),
    );
  }
}
