part of 'user_modal_bloc.dart';

@immutable
abstract class UserModalState {}

class UserModalInitial extends UserModalState {}

class NewUserModalLoadingState extends UserModalState {}

class NewUserModalSuccessState extends UserModalState {}
