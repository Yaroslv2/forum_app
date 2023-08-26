import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_digital_test_app/application/bloc/news_home_page/news_home_page_bloc.dart';

class NewsCategoryListView extends StatefulWidget {
  const NewsCategoryListView({super.key});

  @override
  State<NewsCategoryListView> createState() => _NewsCategoryListViewState();
}

class _NewsCategoryListViewState extends State<NewsCategoryListView> {
  final List<String> _categories = [
    "Все",
    "Глобальные тренды",
    "Отрасли",
    "Российский вектор",
    "Финансы и торговля",
    "Технологии будущего",
    "Регионы России",
    "Национальные проекты",
  ];

  String activeCategory = "Все";

  changeCategory(newCategory) {
    if (activeCategory == newCategory) return;
    setState(() {
      activeCategory = newCategory;
      BlocProvider.of<NewsHomePageBloc>(context)
          .add(NewsHomePageEvent.loadingPage(activeCategory));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 24),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24),
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                changeCategory(_categories.elementAt(index));
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: activeCategory == _categories.elementAt(index)
                    ? Color(0xFFC60033)
                    : Color(0xFFF5F5F5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                _categories.elementAt(index),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: activeCategory == _categories.elementAt(index)
                      ? FontWeight.w700
                      : FontWeight.w400,
                  color: activeCategory == _categories.elementAt(index)
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}