part of 'my_events_page_bloc.dart';

class MyEventsPageState extends Equatable {
  const MyEventsPageState();

  @override
  List<Object> get props => [];
}

final class MyEventsPageInitial extends MyEventsPageState {}

final class MyEventsPageLoading extends MyEventsPageState {}

final class MyEventsPageSuccess extends MyEventsPageState {
  final List<MyEvent> list;

  const MyEventsPageSuccess({required this.list});
}

final class MyEventsPageFailure extends MyEventsPageState {
  final String message;
  const MyEventsPageFailure({required this.message});
}
