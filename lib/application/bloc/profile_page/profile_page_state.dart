part of 'profile_page_bloc.dart';

sealed class ProfilePageState extends Equatable {
  const ProfilePageState();
  
  @override
  List<Object> get props => [];
}

final class ProfilePageInitial extends ProfilePageState {}

final class ProfilePageLoading extends ProfilePageState {}

final class ProfilePageSuccess extends ProfilePageState {
  User user;

  ProfilePageSuccess({required this.user});
}

final class ProfilePageFailure extends ProfilePageState {
  String? message;
  ProfilePageFailure({required this.message});
}