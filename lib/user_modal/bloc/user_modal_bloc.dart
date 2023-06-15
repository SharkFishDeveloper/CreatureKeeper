import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:creature_keeper/scaffold_messanger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../UserModal.dart';

part 'user_modal_event.dart';
part 'user_modal_state.dart';

class UserModalBloc extends Bloc<UserModalEvent, UserModalState> {
  UserModalBloc() : super(UserModalInitial()) {
    on<AddNewUserModal>(addNewlyCreatedUSerModal);
  }

  FutureOr<void> addNewlyCreatedUSerModal(
      AddNewUserModal event, Emitter<UserModalState> emit) async {
    emit(NewUserModalLoadingState());
    try {
      final firestore = FirebaseFirestore.instance;
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (event.username.isEmpty ||
          event.phoneNo.isEmpty ||
          event.city.isEmpty) {
        throw Exception('Please fill in all the fields.');
      }
      print("Current user if ${event.username} with id ${currentUser!.uid}");
      final userModal = UserModal(
          username: event.username,
          phoneNo: event.phoneNo,
          city: event.city,
          email: event.email,
          bio: " ");
      await firestore
          .collection('users')
          .doc(currentUser!.uid)
          .set(userModal.toMap());

      emit(NewUserModalSuccessState()); //!throw success state
    } catch (e) {
      showSnackBar(event.context, e.toString());
      emit(UserModalInitial());
    }
  }
}
