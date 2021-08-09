class TokenModel {
  TokenModel({
    required this.token,
  });

  final String token;

  // factory TokenModel.fromRawJson(String str) =>
  //     TokenModel.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class SignUpModel {
  final String firstName;
  final String lastName;
  final String email;
  final int number;
  final String password;
  final int age;
  SignUpModel({
    required this.age,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.number,
    required this.password,
  });
}

class SignInModel {
  final String email;
  final String password;
  SignInModel({
    required this.email,
    required this.password,
  });
}
