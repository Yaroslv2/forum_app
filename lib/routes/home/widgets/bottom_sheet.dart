import 'package:flutter/material.dart';
import 'package:light_digital_test_app/application/models/news_item.dart';

class ModalBottomSheet extends StatelessWidget {
  final NewsItemModel news;

  const ModalBottomSheet({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Новость",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 24),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFF2F3F7),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              )),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              news.imageUrl,
              height: 168,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Text(
                  news.date,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF778A9B)),
                )
              ],
            ),
          ),
          Text(
            news.text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF778A9B),
            ),
          ),
        ],
      ),
    );
  }
}
