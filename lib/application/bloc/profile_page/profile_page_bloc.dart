import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:light_digital_test_app/application/models/user_model.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(ProfilePageInitial()) {
    on<_LoadingPage>(_loadingPage);
  }

  Future _loadingPage(
      _LoadingPage event, Emitter<ProfilePageState> emit) async {
    emit(ProfilePageLoading());
    try {
      final String response =
          await rootBundle.loadString("assets/json/user.json");
      final data = await json.decode(response);
      emit(ProfilePageSuccess(user: User.fromJson(data)));
    } catch (errorMessage) {
      emit(
        ProfilePageFailure(
          message: errorMessage as String,
        ),
      );
    }
  }
}
