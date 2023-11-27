import 'model.dart';

class UsersStates {}

class GetCategoriesDataLoadingState extends UsersStates {}

class GetCategoriesDataSuccessState extends UsersStates {
  final List<PhotosModel> data;

  GetCategoriesDataSuccessState({required this.data});
}

class GetCategoriesDataFailedState extends UsersStates {}
