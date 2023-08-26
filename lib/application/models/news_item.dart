class NewsItemModel {
  String title;
  String category;
  String date;
  String text;
  String imageUrl;

  NewsItemModel({
    required this.title,
    required this.category,
    required this.date,
    required this.imageUrl,
    required this.text,
  });

  factory NewsItemModel.fromJson(Map<String, dynamic> json) => NewsItemModel(
        title: json["title"],
        category: json["category"],
        date: json["date"],
        imageUrl: json["imageUrl"],
        text: json["text"],
      );
}
