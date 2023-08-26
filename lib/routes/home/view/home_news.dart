import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_digital_test_app/application/bloc/news_home_page/news_home_page_bloc.dart';
import 'package:light_digital_test_app/routes/home/widgets/news_category.dart';
import 'package:light_digital_test_app/routes/home/widgets/news_list_view.dart';

class HomeNewsPage extends StatelessWidget {
  HomeNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsHomePageBloc()..add(NewsHomePageEvent.loadingPage("Все")),
      child: Column(
        children: [
          NewsCategoryListView(),
          Flexible(
            child: NewsListView(),
          ),
        ],
      ),
    );
  }
}
