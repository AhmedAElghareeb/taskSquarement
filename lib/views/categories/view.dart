import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_squarement/features/categories/states.dart';

import 'categories_item.dart';
import 'categories_loading.dart';
import '../../core/design/search_input.dart';
import '../../core/design/side_bar.dart';
import '../../features/categories/cubit.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {


  @override
  Widget build(BuildContext context) {
    CategoriesCubit cubit = BlocProvider.of(context)..getData();
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.01),
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
            SideBar(),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (state is GetCategoriesDataLoadingState) {
                  return LoadingShimmer();
                } else if (state is GetCategoriesDataSuccessState) {
                  return ItemData();
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


