part of 'my_events_archive_bloc.dart';

class MyEventsArchiveState extends Equatable {
  const MyEventsArchiveState();
  
  @override
  List<Object> get props => [];
}

final class MyEventsArchiveInitial extends MyEventsArchiveState {}

final class MyEventsArchiveLoading extends MyEventsArchiveState {}

final class MyEventsArchiveSuccess extends MyEventsArchiveState {
  final List<MyEvent> list;

  const MyEventsArchiveSuccess({required this.list});
}

final class MyEventsArchiveFailure extends MyEventsArchiveState {
  final String message;

  MyEventsArchiveFailure({required this.message});
}
