part of 'home_events_page_bloc.dart';

class HomeEventsPageState extends Equatable {
  const HomeEventsPageState();

  @override
  List<Object> get props => [];
}

final class HomeEventsPageInitial extends HomeEventsPageState {}

final class HomeEventsPageLoading extends HomeEventsPageState {}

final class HomeEventsPageSuccess extends HomeEventsPageState {
  final List<HomePageEventModel> list;

  const HomeEventsPageSuccess({required this.list});
}

final class HomeEventsPageFailure extends HomeEventsPageState {
  final String message;

  const HomeEventsPageFailure({required this.message});
}
