import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  int selectedIndex = 0;

  List<String> titles = [
    "Baby",
    "Toddler",
    "Kids",
    "Toys",
    "Maternity",
    "Gifts",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: ListView.builder(
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            selectedIndex = i;
            setState(() {});
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: selectedIndex == i
                  ? Colors.white
                  : Colors.transparent,
            ),
            child: Padding(
              padding:
              EdgeInsetsDirectional.only(start: 10.w, bottom: 10.h),
              child: Text(
                titles[i],
                style: TextStyle(
                  color:
                  selectedIndex == i ? Colors.black : Colors.grey,
                  fontSize: selectedIndex == i ? 20.sp : 16.sp,
                  fontWeight: selectedIndex == i
                      ? FontWeight.w800
                      : FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        itemCount: titles.length,
      ),
    );
  }
}
