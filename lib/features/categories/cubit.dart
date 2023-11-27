import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_squarement/features/categories/model.dart';
import 'package:task_squarement/features/categories/states.dart';

import '../../core/logic/dio_helper.dart';

class CategoriesCubit extends Cubit<UsersStates> {
  CategoriesCubit() : super(UsersStates());

  Future<void> getData() async {
    emit(
      GetCategoriesDataLoadingState(),
    );

    final response = await DioHelper().getData(
      url: "photos",
    );

    if (response.success) {
      final data = PhotosData.fromJson(response.response!.data).data;
      emit(
        GetCategoriesDataSuccessState(
          data: data,
        ),
      );
    } else {
      emit(
        GetCategoriesDataFailedState(),
      );
    }
  }
}
