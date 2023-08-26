part of 'my_events_archive_bloc.dart';

abstract class MyEventsArchiveEvent {
  const MyEventsArchiveEvent();

  factory MyEventsArchiveEvent.loadingPage() => _LoadingPage();
}

final class _LoadingPage extends MyEventsArchiveEvent {}
