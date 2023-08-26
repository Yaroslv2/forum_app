part of 'news_home_page_bloc.dart';

sealed class NewsHomePageState extends Equatable {
  const NewsHomePageState();

  @override
  List<Object> get props => [];
}

final class NewsHomePageInitial extends NewsHomePageState {}

class NewsHomePageLoading extends NewsHomePageState {}

class NewsHomePageSuccess extends NewsHomePageState {
  final String activeCategory;
  final List<NewsItemModel> news;

  const NewsHomePageSuccess({required this.activeCategory, required this.news});
}

class NewsHomePageFailure extends NewsHomePageState {
  final String? message;

  const NewsHomePageFailure({required this.message});
}
