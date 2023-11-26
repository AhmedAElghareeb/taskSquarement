import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, this.controller});

  @override
  State<SearchInput> createState() => _SearchInputState();

  final TextEditingController? controller;
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 18.w,
        vertical: 20.h,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              35.r,
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              35.r,
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              35.r,
            ),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          prefixIcon: Icon(Icons.search, color: Colors.blue, size: 25.r,),
          hintText: "What are you looking for?",
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
