part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {}

// class AuthenticationErrorState extends AuthenticationState {
//   final String errorMessage;
//   AuthenticationErrorState({
//     required this.errorMessage,
//   });
// }

class AuthenticationSuccessState extends AuthenticationState {}

// class AuthenticationErrorState extends AuthenticationState {
//   final String errorMessage;
//   final BuildContext context;
//   AuthenticationErrorState({
//     required this.errorMessage,
//     required this.context,
//   });

//   void showSnackBar(BuildContext context, String text) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(text),
//       backgroundColor: Colors.red,
//     ));
//   }
// }
