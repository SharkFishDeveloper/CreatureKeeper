import 'package:creature_keeper/screens/deskboard_screen.dart';
import 'package:creature_keeper/user_modal/bloc/user_modal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  final String email;
  const DetailsScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userModalBloc = BlocProvider.of<UserModalBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('User Information'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<UserModalBloc, UserModalState>(
        listener: (context, state) {
          if (state is NewUserModalSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DeskBoardScreen()),
            ); // TODO: implement listener
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    labelText: 'Username',
                    prefixIcon: const Icon(
                      Icons.person_outlined,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: phoneNoController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    labelText: 'Phone Number',
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  keyboardType: TextInputType.number,

                  //   if (value == null || value.length != 10) {
                  //     return 'Please enter your phone number.';
                  //   }
                  //   return null;
                  // }),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade900),
                    ),
                    labelText: 'City',
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter city.';
                  //   }
                  //   return null;
                  // }),
                ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54,
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    userModalBloc.add(AddNewUserModal(
                        username: usernameController.text,
                        phoneNo: phoneNoController.text,
                        city: cityController.text,
                        email: widget.email,
                        context: context));
                    // Add your logic for the proceed button here
                  },
                  child: state is NewUserModalLoadingState
                      ? const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        )
                      : const Text('Proceed'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
