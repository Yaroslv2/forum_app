import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:light_digital_test_app/application/models/my_event.dart';

part 'my_events_archive_event.dart';
part 'my_events_archive_state.dart';

class MyEventsArchiveBloc extends Bloc<MyEventsArchiveEvent, MyEventsArchiveState> {
  MyEventsArchiveBloc() : super(MyEventsArchiveInitial()) {
    on<_LoadingPage>(_loadingPage);
  }

  Future _loadingPage(_LoadingPage event, Emitter<MyEventsArchiveState> emit) async {
    emit(MyEventsArchiveLoading());

    try {
      final String response =
          await rootBundle.loadString("assets/json/my_events_archive.json");
      final data = await json.decode(response);
      List<MyEvent> list = [];
      list.addAll(List<MyEvent>.from(data.map((i) => MyEvent.fromJson(i))));
      emit(MyEventsArchiveSuccess(list: list));
    } catch (message) {
      emit(MyEventsArchiveFailure(message: message as String));
    }
  }
}
