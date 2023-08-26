import 'package:flutter/material.dart';

class HomePageTabBar extends StatefulWidget {
  const HomePageTabBar({super.key});

  @override
  State<HomePageTabBar> createState() => _HomePageTabBarState();
}

class _HomePageTabBarState extends State<HomePageTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: TabBar(
          onTap: (value) {},
          labelStyle: const TextStyle(
            fontFamily: "Sansation",
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelColor: Colors.black,
          labelColor: Colors.black,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          indicatorPadding: EdgeInsets.zero,
          indicatorWeight: double.minPositive,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Мероприятие',
            ),
            Tab(
              text: 'Новости',
            ),
          ],
        ),
      ),
    );
  }
}
