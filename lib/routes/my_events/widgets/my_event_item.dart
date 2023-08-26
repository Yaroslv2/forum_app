import 'package:flutter/material.dart';
import 'package:light_digital_test_app/application/models/my_event.dart';

class MyEventItem extends StatelessWidget {
  MyEvent event;
  MyEventItem({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF5F5F5),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    event.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Image.asset(
                      event.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 12)),
            Text(
              "роль: ${event.role}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF333037),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Text(
              event.date,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF333037),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
