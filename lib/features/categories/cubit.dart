import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_squarement/features/categories/states.dart';

import '../../core/logic/server_gate.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesStates());

  Future<void> getData() async {
    emit(
      GetCategoriesDataLoadingState(),
    );

    final response = await DioHelper().getData(
      url: "photos",
    );

    if (response.success) {
      print(response.response!.data);
      emit(
        GetCategoriesDataSuccessState(),
      );
    } else {
      emit(
        GetCategoriesDataFailedState(),
      );
    }
  }
}
