import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../scaffold_messanger.dart';

class FireBaseAuthMethods {
  final FirebaseAuth _auth;

  FireBaseAuthMethods(this._auth);

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(user.toString());

    // User? currentUser = FirebaseAuth.instance.currentUser;

    // UserModal userModal = UserModal(
    //     uid: currentUser!.uid,
    //     username: currentUser.displayName ?? 'no name',
    //     phoneNumber: currentUser.phoneNumber ?? 'no phone number',
    //     isAdmin: true,
    //     bio: 'no bio',
    //     city: 'no city',
    //     idOfFollowers: [],
    //     skill: [],
    //     email: currentUser.email ?? 'no email',
    //     rating: '0');

    // CollectionReference users =
    //     FirebaseFirestore.instance.collection('all_users');
    // users.doc(currentUser.uid).set(userModal.toMap());

    //! } on FirebaseAuthException catch (e) {
    //   showSnackBar(context, e.message!);
    // } catch (e) {
    //   showSnackBar(context, e.toString());
    //! }
  }

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
