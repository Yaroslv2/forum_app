part of 'home_events_page_bloc.dart';

abstract class HomeEventsPageEvent {
  const HomeEventsPageEvent();

  factory HomeEventsPageEvent.loadingPage() => _LoadingPage();
}

final class _LoadingPage extends HomeEventsPageEvent {}