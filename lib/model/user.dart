class User {
  final String email;
  final String password;
  User({
    required this.email,
    required this.password,
  });
}

List<User> user = [];
List<UserDetails> userDetails = [];

class UserDetails {
   int height;
  int weight;
   int age;
   String gender;
  UserDetails({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });
}

