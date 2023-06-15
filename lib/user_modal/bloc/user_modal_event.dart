part of 'user_modal_bloc.dart';

@immutable
abstract class UserModalEvent {}

class AddNewUserModal extends UserModalEvent {
  final String username;
  final String phoneNo;
  final String city;
  final String email;
  final BuildContext context;

  AddNewUserModal(
      {required this.username,
      required this.phoneNo,
      required this.city,
      required this.email,
      required this.context});
}
