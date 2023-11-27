import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_squarement/features/users/cubit.dart';
import 'package:task_squarement/features/users/states.dart';

import 'users_item.dart';
import 'users_loading.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  @override
  Widget build(BuildContext context) {
    UsersCubit cubit = BlocProvider.of(context)..getData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users Data",
        ),
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if(state is GetUsersDataLoadingState) {
            return UsersLoading();
          } else if (state is GetUsersDataSuccessState) {
            return ListView.separated(
              itemBuilder: (context, index) => Item(
                model: state.data[index],
              ),
              separatorBuilder: (context, index) => Divider(
                indent: 16.w,
                endIndent: 16.w,
              ),
              itemCount: state.data.length,
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
