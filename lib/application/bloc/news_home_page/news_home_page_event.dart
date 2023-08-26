part of 'news_home_page_bloc.dart';

abstract class NewsHomePageEvent {
  const NewsHomePageEvent();

  factory NewsHomePageEvent.loadingPage(String category) => _LoadingPage(activeCategory: category);
}

class _LoadingPage extends NewsHomePageEvent {
  final String activeCategory;
  _LoadingPage({required this.activeCategory});
}