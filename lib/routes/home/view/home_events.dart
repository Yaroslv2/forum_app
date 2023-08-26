import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_digital_test_app/application/bloc/home_events_page/home_events_page_bloc.dart';
import 'package:light_digital_test_app/routes/home/widgets/event_widget.dart';

class HomeEventsPage extends StatefulWidget {
  const HomeEventsPage({super.key});

  @override
  State<HomeEventsPage> createState() => _HomeEventsPageState();
}

class _HomeEventsPageState extends State<HomeEventsPage> {
  int currentIdx = 0;

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 0.87);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _buildDot(context, index) {
    return Container(
      height: 10,
      width: currentIdx == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIdx == index ? Colors.black : Color(0xFFFDF0F4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeEventsPageBloc()..add(HomeEventsPageEvent.loadingPage()),
      child: BlocBuilder<HomeEventsPageBloc, HomeEventsPageState>(
        builder: (context, state) {
          if (state is HomeEventsPageSuccess) {
            return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: state.list.length,
                  onPageChanged: (index) => setState(() {
                    currentIdx = index;
                  }),
                  itemBuilder: (context, index) {
                    return HomePageEventItem(event: state.list[index]);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  state.list.length,
                  (index) => _buildDot(context, index),
                ),
              ),
            ],
          );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
