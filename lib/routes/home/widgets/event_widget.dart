import 'package:flutter/material.dart';
import 'package:light_digital_test_app/application/models/homepage_event_model.dart';

class HomePageEventItem extends StatelessWidget {
  final HomePageEventModel event;

  const HomePageEventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(event.backroundImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 48,
                width: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsetsDirectional.all(12),
                    elevation: 0,
                    backgroundColor: Color(0x52FFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.reply,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                event.eventIconUrl, 
                height: 88,
                width: 88,
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Text(
                "${event.date} | ${event.place}",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 4)),
              Text(
                event.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              Text(
                event.city,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
