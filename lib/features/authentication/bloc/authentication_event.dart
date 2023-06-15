part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class ButtonPressedLogInEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final BuildContext context;
  ButtonPressedLogInEvent(
      {required this.email, required this.password, required this.context});
}

class ButtonPressedSignUpEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final BuildContext context;

  ButtonPressedSignUpEvent(
      {required this.email, required this.password, required this.context});
}
