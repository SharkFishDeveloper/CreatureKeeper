import 'package:creature_keeper/user_modal/UserModal.dart';

class UserModalMethods {
  final String username;
  final String phoneNo;
  final String city;
  final String email;
  final String bio;
  UserModalMethods(
      this.username, this.phoneNo, this.city, this.email, this.bio);

  final UserModal userModalDetails = UserModal(
      username: username, phoneNo: phoneNo, city: city, email: email, bio: bio);
}
