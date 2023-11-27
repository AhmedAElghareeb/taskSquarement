import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_squarement/features/users/model.dart';
import 'package:task_squarement/features/users/states.dart';

import '../../core/logic/dio_helper.dart';

class UsersCubit extends Cubit<UsersStates> {
  UsersCubit() : super(UsersStates());

  Future<void> getData() async {
    emit(
      GetUsersDataLoadingState(),
    );

    final response = await DioHelper().getData(
      url: "users",
    );

    if (response.success) {
      final data = UsersData.fromJson(response.response!.data).data;
      emit(
        GetUsersDataSuccessState(
          data: data,
        ),
      );
    } else {
      emit(
        GetUsersDataFailedState(),
      );
    }
  }
}
