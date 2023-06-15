import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:creature_keeper/features/authentication/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../scaffold_messanger.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<ButtonPressedSignUpEvent>(doSignupEvent);
    on<ButtonPressedLogInEvent>(doLoginEvent);
  }

  Future<void> doSignupEvent(
      ButtonPressedSignUpEvent event, Emitter<AuthenticationState> emit) async {
    final FireBaseAuthMethods authmethods =
        FireBaseAuthMethods(FirebaseAuth.instance); //! call repository
    //?emit(AuthenticationLoadingState());
    emit(AuthenticationLoadingState());
    try {
      await authmethods.signUpWithEmail(
        email: event.email,
        password: event.password,
        context: event.context,
      );
      emit(AuthenticationSuccessState());
    } catch (e) {
      showSnackBar(event.context, e.toString());
      emit(AuthenticationInitial());
    }
  }

  FutureOr<void> doLoginEvent(
      ButtonPressedLogInEvent event, Emitter<AuthenticationState> emit) async {
    final FireBaseAuthMethods authmethods =
        FireBaseAuthMethods(FirebaseAuth.instance); //! call repository
    emit(AuthenticationLoadingState());
    try {
      await authmethods.loginWithEmail(
        email: event.email,
        password: event.password,
        context: event.context,
      );
      emit(AuthenticationSuccessState());
    } catch (e) {
      showSnackBar(event.context, e.toString());
      emit(AuthenticationInitial());
    }
  }
}
