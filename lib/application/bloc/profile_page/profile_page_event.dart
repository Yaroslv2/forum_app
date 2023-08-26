part of 'profile_page_bloc.dart';

abstract class ProfilePageEvent {
  const ProfilePageEvent();

  factory ProfilePageEvent.loadingPage() => _LoadingPage();
}

class _LoadingPage extends ProfilePageEvent {
  _LoadingPage();
}