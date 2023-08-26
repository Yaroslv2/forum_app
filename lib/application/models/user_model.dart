class User {
  String name;
  String id;
  String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );
}
