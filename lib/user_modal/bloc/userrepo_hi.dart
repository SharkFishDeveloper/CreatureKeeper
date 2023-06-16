import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creature_keeper/user_modal/UserModal.dart';

class UserRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<UserModal?> getUser(String uid) async {
    try {
      final snapshot = await usersCollection.doc(uid).get();
      if (snapshot.exists) {
        final data = snapshot.data();
        final UserModal userLoggedIn;
        return userLoggedIn(
          username: data['username'],
        );
       }// else {
      //   return null;
      // }
    } catch (e) {
      //!handle errors
      return null;
    }
  }
}
