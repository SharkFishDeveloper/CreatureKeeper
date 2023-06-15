import 'package:creature_keeper/features/authentication/bloc/authentication_bloc.dart';
import 'package:creature_keeper/features/authentication/login_screen.dart';
import 'package:creature_keeper/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/details_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sign Up page'),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
        if (state is AuthenticationSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      email: emailController.text,
                    )),
          );
        }
      }, builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 240,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    authenticationBloc.add(ButtonPressedSignUpEvent(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context));
                  },
                  child: state is AuthenticationLoadingState
                      ? const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text('Sign Up'),
                ),
                const SizedBox(
                  height: 190,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Already signed up? '),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()),
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ]),
              ],
            ));
      }),
    );
  }
}
