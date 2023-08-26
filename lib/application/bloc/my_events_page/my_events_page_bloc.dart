import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:light_digital_test_app/application/models/my_event.dart';

part 'my_events_page_event.dart';
part 'my_events_page_state.dart';

class MyEventsPageBloc extends Bloc<MyEventsPageEvent, MyEventsPageState> {
  MyEventsPageBloc() : super(MyEventsPageInitial()) {
    on<_LoadingPage>(_loadingPage);
  }

  Future _loadingPage(
      _LoadingPage event, Emitter<MyEventsPageState> emit) async {
    emit(MyEventsPageLoading());

    try {
      final String response =
          await rootBundle.loadString("assets/json/my_events.json");
      final data = await json.decode(response);
      List<MyEvent> list = [];
      list.addAll(List<MyEvent>.from(data.map((i) => MyEvent.fromJson(i))));
      emit(MyEventsPageSuccess(list: list));
    } catch (message) {
      emit(MyEventsPageFailure(message: message as String));
    }
  }
}