import 'package:flutter/material.dart';
import 'package:light_digital_test_app/routes/onboarding/onboarding_list.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIdx = 0;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
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
        color: currentIdx == index ? Color(0xFFC60033) : Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onboardingList.length,
      controller: _pageController,
      onPageChanged: (index) => setState(() {
        currentIdx = index;
      }),
      itemBuilder: (context, index) => Stack(
        children: [
          Image.asset(
            onboardingList[index].backgroundImage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              toolbarHeight: 100,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              actions: currentIdx != onboardingList.length - 1
                  ? [
                      Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0x66F2F3F5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Text(
                            "Пропустить",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ]
                  : null,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  onboardingList[index].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    onboardingList[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentIdx == onboardingList.length - 1) {
                        Navigator.pop(context);
                      }
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC60033),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      currentIdx == onboardingList.length - 1
                          ? "Начать работу"
                          : "Далее",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingList.length,
                      (index) => _buildDot(context, index),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
