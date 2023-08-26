import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_digital_test_app/application/bloc/news_home_page/news_home_page_bloc.dart';
import 'package:light_digital_test_app/routes/home/widgets/news_item.dart';


class NewsListView extends StatelessWidget {
  const NewsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsHomePageBloc, NewsHomePageState>(
      builder: (context, state) {
        if (state is NewsHomePageSuccess) {
          if (state.news.isEmpty) {
            return Center(
              child: Text("Нет новостей по данной категории..."),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24),
            shrinkWrap: true,
            itemCount: state.news.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: NewsItem(
                news: state.news.elementAt(index),
              ),
            ),
          );
        }
        if (state is NewsHomePageFailure) {
          return Center(
            child: Text("Ошибка: ${state.message}"),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}