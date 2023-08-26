import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_digital_test_app/application/bloc/profile_page/profile_page_bloc.dart';
import 'package:light_digital_test_app/routes/login/view/login_page.dart';
import 'package:light_digital_test_app/routes/my_events/view/my_events_form.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfilePageBloc()..add(ProfilePageEvent.loadingPage()),
      child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
        builder: (context, state) {
          if (state is ProfilePageSuccess) {
            return ListView(
              padding:
                  EdgeInsets.only(top: 19, bottom: 24, left: 24, right: 24),
              children: [
                ProfileButton(
                  height: 112,
                  icon: SizedBox(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Image.asset(
                        state.user.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  text: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.user.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFF212122),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          "ID: ${state.user.id}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                  func: () {},
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 12)),
                Text(
                  "Основное",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6D7885),
                  ),
                ),
                ProfileButton(
                  height: 65,
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    color: Color(0xFFC60033),
                  ),
                  text: SizedBox(
                    height: 167,
                    child: Text(
                      "Центр уведомлений",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  func: () {},
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                ProfileButton(
                  height: 65,
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    color: Color(0xFFC60033),
                  ),
                  text: SizedBox(
                    width: 167,
                    child: Text(
                      "Мои мероприятия",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyEventsForm(),
                      ),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                ProfileButton(
                  height: 65,
                  icon: Icon(
                    Icons.cases_outlined,
                    color: Color(0xFFC60033),
                  ),
                  text: SizedBox(
                    width: 167,
                    child: Text(
                      "Сервисы",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  func: () {},
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                ProfileButton(
                  height: 65,
                  icon: Icon(
                    Icons.new_releases_outlined,
                    color: Color(0xFFC60033),
                  ),
                  text: SizedBox(
                    width: 167,
                    child: Text(
                      "Статус бейдж и ТС",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  func: () {},
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                ProfileButton(
                  height: 65,
                  icon: Icon(
                    Icons.settings_outlined,
                    color: Color(0xFFC60033),
                  ),
                  text: SizedBox(
                    width: 167,
                    child: Text(
                      "Настройки аккаунта",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  func: () {},
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 12)),
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color(0xFFF9F9F9),
                    child: InkResponse(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      borderRadius: BorderRadius.circular(12),
                      highlightShape: BoxShape.rectangle,
                      containedInkWell: true,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Выйти из аккаунта",
                              style: TextStyle(
                                  color: Color(0xFFFF4141),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.door_front_door_outlined,
                              color: Color(0xFFFF4141),
                              size: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
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

class ProfileButton extends StatelessWidget {
  final double height;
  final Widget icon;
  final Widget text;
  final Function() func;
  const ProfileButton({
    super.key,
    required this.height,
    required this.icon,
    required this.text,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Color(0xFFF9F9F9),
        child: InkResponse(
          onTap: func,
          borderRadius: BorderRadius.circular(12),
          highlightShape: BoxShape.rectangle,
          containedInkWell: true,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                icon,
                text,
                Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF778A9B),
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
