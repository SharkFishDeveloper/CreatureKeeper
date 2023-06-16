import 'package:creature_keeper/user_modal/bloc/user_modal_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user_modal/UserModal.dart';

class DeskBoardScreen extends StatefulWidget {
  const DeskBoardScreen({super.key});

  @override
  State<DeskBoardScreen> createState() => _DeskBoardScreenState();
}

class _DeskBoardScreenState extends State<DeskBoardScreen> {
  UserModal? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserModalBloc, UserModalState>(
        builder: (context, state) {
          if (state is StoredUserModalFromDetailsScreen) {
            user = state.userModalHelper;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user!.username),
              ],
            ),
          );
        },
      ),
    );
  }
}
