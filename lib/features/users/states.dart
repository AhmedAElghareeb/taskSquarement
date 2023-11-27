import 'model.dart';

class UsersStates {}

class GetUsersDataLoadingState extends UsersStates {}

class GetUsersDataSuccessState extends UsersStates {
  final List<UsersModel> data;

  GetUsersDataSuccessState({required this.data});
}

class GetUsersDataFailedState extends UsersStates {}
