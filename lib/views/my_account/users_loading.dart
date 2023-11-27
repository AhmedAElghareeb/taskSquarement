import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class UsersLoading extends StatelessWidget {
  UsersLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: Colors.grey.withOpacity(0.8),
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          margin:
              EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 16.h),
          padding: EdgeInsetsDirectional.all(16.r),
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(
              10.r,
            ),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                10,
                (index) => Container(
                  margin: EdgeInsetsDirectional.symmetric(
                    vertical: 2.h
                  ),
                  width: 200.w,
                  height: 10.h,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => Divider(
          indent: 16.w,
          endIndent: 16.w,
        ),
        itemCount: 10,
      ),
    );
  }
}
