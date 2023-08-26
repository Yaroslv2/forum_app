import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_digital_test_app/application/bloc/my_events_page/my_events_page_bloc.dart';
import 'package:light_digital_test_app/routes/my_events/widgets/my_event_item.dart';
import 'package:light_digital_test_app/routes/my_events/view/my_events_archive_form.dart';

class MyEventsForm extends StatelessWidget {
  const MyEventsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "мои мероприятия",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyEventsArchiveForm(),
                  ),
                );
              },
              icon: Icon(
                Icons.watch_later_outlined,
                size: 32,
              ),
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) =>
            MyEventsPageBloc()..add(MyEventsPageEvent.loadingPage()),
        child: BlocBuilder<MyEventsPageBloc, MyEventsPageState>(
          builder: (context, state) {
            if (state is MyEventsPageSuccess) {
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
