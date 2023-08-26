part of 'my_events_page_bloc.dart';

abstract class MyEventsPageEvent {
  const MyEventsPageEvent();

  factory MyEventsPageEvent.loadingPage() => _LoadingPage();
}

final class _LoadingPage extends MyEventsPageEvent {}
