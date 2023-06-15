import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../UserModal.dart';

part 'user_modal_event.dart';
part 'user_modal_state.dart';

class UserModalBloc extends Bloc<UserModalEvent, UserModalState> {
  UserModalBloc() : super(UserModalInitial()) {
    on<AddNewUserModal>(addNewlyCreatedUSerModal);
  }

  FutureOr<void> addNewlyCreatedUSerModal(
      AddNewUserModal event, Emitter<UserModalState> emit) {}
}
