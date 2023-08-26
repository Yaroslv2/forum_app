class HomePageEventModel {
  final String date;
  final String place;
  final String title;
  final String backroundImageUrl;
  final String eventIconUrl;
  final String city;

  const HomePageEventModel({
    required this.date,
    required this.place,
    required this.title,
    required this.backroundImageUrl,
    required this.eventIconUrl,
    required this.city,
  });

  factory HomePageEventModel.fromJson(Map<String, dynamic> json) =>
      HomePageEventModel(
        date: json["date"],
        place: json["place"],
        title: json["title"],
        backroundImageUrl: json["background"],
        eventIconUrl: json["icon"],
        city: json["city"],
      );
}
