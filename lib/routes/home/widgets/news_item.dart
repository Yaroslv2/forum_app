import 'package:flutter/material.dart';
import 'package:light_digital_test_app/application/models/news_item.dart';
import 'package:light_digital_test_app/routes/home/widgets/bottom_sheet.dart';

class NewsItem extends StatelessWidget {
  final NewsItemModel news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 129,
      width: double.infinity,
      child: Card(
        elevation: 0,
        color: Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        semanticContainer: true,
        child: InkResponse(
          borderRadius: BorderRadius.circular(12),
          highlightShape: BoxShape.rectangle,
          containedInkWell: true,
          onTap: () {
            showModalBottomSheet(
              elevation: 0,
              backgroundColor: Colors.white,
              useSafeArea: true,
              showDragHandle: true,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              context: context,
              builder: (context) => ModalBottomSheet(
                news: news,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 178,
                      child: Text(
                        news.title,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      news.date,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF778A9B),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    news.imageUrl,
                    width: 96,
                    height: 97,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

