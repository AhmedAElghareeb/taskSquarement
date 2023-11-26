import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../design/search_input.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Baby",
      "Toddler",
      "Kids",
      "Toys",
      "Maternity",
      "Gifts",
    ];

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      appBar: AppBar(
        toolbarHeight: 100.h,
        actions: [
          SizedBox(
            width: 350.w,
            height: 100.h,
            child: SearchInput(),
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
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
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      child: Image.network(
                        "https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-16284.jpg?1",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) => Container(
                          height: 10.h,
                          margin: EdgeInsets.all(5.r),
                          color: Colors.red,
                        ),
                        itemCount: 12,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.h,
                      child: Image.network(
                        "https://img.freepik.com/free-vector/special-offer-creative-sale-banner-design_1017-16284.jpg?1",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Featured Brands",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) => Container(
                          height: 10.h,
                          margin: EdgeInsets.all(5.r),
                          color: Colors.red,
                        ),
                        itemCount: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
