part of 'user_modal_bloc.dart';

@immutable
abstract class UserModalState {}

class UserModalInitial extends UserModalState {}

class NewUserModalLoadingState extends UserModalState {}

class NewUserModalSuccessState extends UserModalState {}

class StoredUserModalFromDetailsScreen extends UserModalState {
  //! if error then here, trying to transport usermodal data to any page
  final UserModal userModalHelper;

  StoredUserModalFromDetailsScreen(this.userModalHelper);
}
