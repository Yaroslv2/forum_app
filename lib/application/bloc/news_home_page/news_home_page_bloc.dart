import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:light_digital_test_app/application/models/news_item.dart';

part 'news_home_page_event.dart';
part 'news_home_page_state.dart';

class NewsHomePageBloc extends Bloc<NewsHomePageEvent, NewsHomePageState> {
  NewsHomePageBloc() : super(NewsHomePageInitial()) {
    on<_LoadingPage>(_loadingPage);
  }

  Future _loadingPage(
      _LoadingPage event, Emitter<NewsHomePageState> emit) async {
    emit(NewsHomePageLoading());

    try {
      final String response =
          await rootBundle.loadString("assets/json/news.json");
      final data = await json.decode(response);
      List<NewsItemModel> list = [];
      if (event.activeCategory == "Все") {
        list.addAll(
          List<NewsItemModel>.from(
            data.map(
              (i) => NewsItemModel.fromJson(i),
            ),
          ),
        );
      } else {
        for (var i in data) {
          if (i["category"] == event.activeCategory) {
            list.add(NewsItemModel.fromJson(i));
          }
        }
      }
      emit(
        NewsHomePageSuccess(
          activeCategory: event.activeCategory,
          news: list,
        ),
      );
    } catch (errorMessage) {
      emit(
        NewsHomePageFailure(
          message: errorMessage as String,
        ),
      );
    }
  }
}
