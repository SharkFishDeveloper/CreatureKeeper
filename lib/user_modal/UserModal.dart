import 'dart:convert';

class UserModal {
  final String username;
  final String phoneNo;
  final String city;
  final String email;
  final String bio;

  UserModal({
    required this.username,
    required this.phoneNo,
    required this.city,
    required this.email,
    required this.bio,
  });

  UserModal copyWith({
    String? username,
    String? phoneNo,
    String? city,
    String? email,
    String? bio,
  }) {
    return UserModal(
      username: username ?? this.username,
      phoneNo: phoneNo ?? this.phoneNo,
      city: city ?? this.city,
      email: email ?? this.email,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'phoneNo': phoneNo,
      'city': city,
      'email': email,
      'bio': bio,
    };
  }

  factory UserModal.fromMap(Map<String, dynamic> map) {
    return UserModal(
      username: map['username'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      city: map['city'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) =>
      UserModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModalDetails(username: $username, phoneNo: $phoneNo, city: $city, email: $email, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModal &&
        other.username == username &&
        other.phoneNo == phoneNo &&
        other.city == city &&
        other.email == email &&
        other.bio == bio;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        phoneNo.hashCode ^
        city.hashCode ^
        email.hashCode ^
        bio.hashCode;
  }
}
