import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_digital_test_app/application/bloc/my_events_archive/my_events_archive_bloc.dart';
import 'package:light_digital_test_app/routes/my_events/widgets/my_event_item.dart';

class MyEventsArchiveForm extends StatelessWidget {
  const MyEventsArchiveForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyEventsArchiveBloc()..add(MyEventsArchiveEvent.loadingPage()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
            "архив мероприятий",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "очистить",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<MyEventsArchiveBloc, MyEventsArchiveState>(
          builder: (context, state) {
            if (state is MyEventsArchiveSuccess) {
              return ListView.builder(
                padding: EdgeInsets.all(24),
                itemBuilder: (context, index) => MyEventItem(
                  event: state.list.elementAt(index),
                ),
                itemCount: state.list.length,
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
