import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:light_digital_test_app/application/models/homepage_event_model.dart';

part 'home_events_page_event.dart';
part 'home_events_page_state.dart';

class HomeEventsPageBloc
    extends Bloc<HomeEventsPageEvent, HomeEventsPageState> {
  HomeEventsPageBloc() : super(HomeEventsPageInitial()) {
    on<_LoadingPage>(_loadingPage);
  }

  Future _loadingPage(
      _LoadingPage event, Emitter<HomeEventsPageState> emit) async {
    emit(HomeEventsPageLoading());
    try {
      final String response =
          await rootBundle.loadString("assets/json/events.json");
      final data = await json.decode(response);
      List<HomePageEventModel> list = [];
      list.addAll(List<HomePageEventModel>.from(
          data.map((i) => HomePageEventModel.fromJson(i))));
      emit(HomeEventsPageSuccess(list: list));
    } catch (message) {
      emit(HomeEventsPageFailure(message: message as String));
    }
  }
}
