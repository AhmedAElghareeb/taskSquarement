import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_squarement/views/basket/view.dart';
import 'package:task_squarement/views/categories/view.dart';
import 'package:task_squarement/views/home/view.dart';
import 'package:task_squarement/views/my_account/view.dart';
import 'package:task_squarement/views/my_lists/view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  List<Widget> pages = [
    const HomeView(),
    const CategoriesView(),
    const BasketView(),
    const MyListsView(),
    const MyAccountView(),
  ];

  List<String> titles = [
    "Home",
    "Categories",
    "Basket",
    "My Lists",
    "My Account",
  ];

  List<Icon> iconsList = [
    const Icon(
      Icons.home,
    ),
    const Icon(
      Icons.manage_search_outlined,
    ),
    const Icon(
      Icons.shopping_basket_outlined,
    ),
    const Icon(
      Icons.bookmark_add_outlined,
    ),
    const Icon(
      Icons.person,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          pages.length,
              (y) => BottomNavigationBarItem(
                icon: iconsList[y],
                label: titles[y],
              ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (x) {
          index = x;
          setState(() {});
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[500],
        iconSize: 30.r,
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
