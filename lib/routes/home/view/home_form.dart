import 'package:flutter/material.dart';
import 'package:light_digital_test_app/routes/home/view/home_events.dart';
import 'package:light_digital_test_app/routes/home/view/home_news.dart';
import 'package:light_digital_test_app/routes/home/widgets/homepage_appbar.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  static final _pages = <Widget>[
    HomeEventsPage(),
    HomeNewsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return <Widget>[
                const SliverAppBar(
                  surfaceTintColor: Colors.white,
                  elevation: 0,
                  pinned: true,
                  collapsedHeight: 88,
                  flexibleSpace: HomePageAppBar(),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MyDelegate(
                    tabBar: TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.transparent,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorWeight: double.minPositive,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tabs: [
                        Tab(
                          text: "Мероприятия",
                        ),
                        Tab(
                          text: "Новости",
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: _pages,
            ),
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate({required this.tabBar});
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            height: 36,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: tabBar,
          ),
        ),
        Container(
          height: 15,
          color: Colors.white,
        ),
      ],
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 10;

  @override
  double get minExtent => tabBar.preferredSize.height + 10;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

// class HomeForm extends StatefulWidget {
//   const HomeForm({super.key});

//   @override
//   State<HomeForm> createState() => _HomeFormState();
// }

// class _HomeFormState extends State<HomeForm> {
//   int _selectedIdx = 0;

//   final _pages = <Widget>[
//     HomeEventsPage(),
//     HomeNewsPage(),
//   ];

//   _onItemTapped(value) {
//     setState(() {
//       _selectedIdx = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: DefaultTabController(
//         length: 2,
//         child: Column(
//           children: [
//             Material(
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 24),
//                 height: 36,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF5F5F5),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(2),
//                   child: TabBar(
//                     physics: ClampingScrollPhysics(),
//                     unselectedLabelColor: Colors.black,
//                     labelColor: Colors.black,
//                     dividerColor: Colors.transparent,
//                     indicatorColor: Colors.transparent,
//                     indicatorPadding: EdgeInsets.zero,
//                     indicatorWeight: double.minPositive,
//                     indicatorSize: TabBarIndicatorSize.tab,
//                     indicator: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     tabs: [
//                       Tab(
//                         text: "Мероприятие",
//                       ),
//                       Tab(
//                         text: "Новости",
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             TabBarView(
//               children: [
//                 CustomScrollView(
//                   slivers: [
//                     SliverList(
//                       delegate: SliverChildBuilderDelegate(
//                         (context, index) => Text("$index"),
//                         childCount: 3,
//                       ),
                      
//                     ),
//                   ],
//                 ),
//                 Center(
//                   child: Text("Hello"),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// Container( 
//       child: Column(
//         children: [
//           // tab bar
//           Expanded(
//             child: DefaultTabController(
//               length: 2,
//               initialIndex: 0,
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 24),
//                     height: 36,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF5F5F5),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(2),
//                       child: TabBar(
//                         onTap: _onItemTapped,
//                         labelStyle: const TextStyle(
//                           fontFamily: "Sansation",
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         unselectedLabelColor: Colors.black,
//                         labelColor: Colors.black,
//                         dividerColor: Colors.transparent,
//                         indicatorColor: Colors.transparent,
//                         indicatorPadding: EdgeInsets.zero,
//                         indicatorWeight: double.minPositive,
//                         indicatorSize: TabBarIndicatorSize.tab,
//                         indicator: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         tabs: [
//                           Tab(
//                             text: 'Мероприятие',
//                           ),
//                           Tab(
//                             text: 'Новости',
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: TabBarView(
//                       children: _pages,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // page
//         ],
//       ),
//     );