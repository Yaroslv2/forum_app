class MyEvent {
  String title;
  String role;
  String date;
  String imageUrl;

  MyEvent({
    required this.title,
    required this.role,
    required this.date,
    required this.imageUrl,
  });

  factory MyEvent.fromJson(Map<String, dynamic> json) => MyEvent(
        title: json["title"],
        role: json["role"],
        date: json["date"],
        imageUrl: json["imageUrl"],
      );
}
