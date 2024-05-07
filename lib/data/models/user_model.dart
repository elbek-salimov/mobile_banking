class UserModel {
  final String userName;
  final String email;
  final String password;
  final String imageUrl;
  final String userId;
  final String fcm;
  final String uuid;

  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.userId,
    required this.fcm,
    required this.uuid,
  });

  UserModel copyWith({
    String? userName,
    String? email,
    String? password,
    String? imageUrl,
    String? userId,
    String? fcm,
    String? uuid,
  }) {
    return UserModel(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      fcm: fcm ?? this.fcm,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "password": password,
        "imageUrl": imageUrl,
        "userId": userId,
        "fcm": fcm,
        "uuid": uuid,
      };

  Map<String, dynamic> toJsonForUpdate() => {
        "userName": userName,
        "email": email,
        "password": password,
        "imageUrl": imageUrl,
        "userId": userId,
        "fcm": fcm,
        "uuid": uuid,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json["userName"] as String? ?? '',
      email: json["email"] as String? ?? '',
      password: json["password"] as String? ?? '',
      imageUrl: json["imageUrl"] as String? ?? '',
      userId: json["userId"] as String? ?? '',
      fcm: json["fcm"] as String? ?? '',
      uuid: json["uuid"] as String? ?? '',
    );
  }

  static UserModel initial() => UserModel(
        userName: '',
        email: '',
        password: '',
        imageUrl: '',
        userId: '',
        fcm: '',
        uuid: '',
      );
}
