import 'package:apac_solution_challenge/screens/main_tabs/login/login_birth_method_page.dart';
import 'package:flutter/material.dart';
import '../../home/home.dart';
import 'package:apac_solution_challenge/widgets/buttons.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'login_body_change_info.dart';

class LoginChooseDate extends StatefulWidget {
  const LoginChooseDate({super.key});

  @override
  State<LoginChooseDate> createState() => _LoginChooseDateState();
}

class _LoginChooseDateState extends State<LoginChooseDate> {
  DateTime today = DateTime.now();
  DateTime? _selectedDay;
  String? formattedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/login_choose_date_page.png',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
          child: Container(
            height: 505,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFDCE5B7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 8.0, 0),
              child: TableCalendar(
                rowHeight: 63,
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                focusedDay: today,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    today = focusedDay;
                    formattedDate =
                        DateFormat('yyyy-MM-dd').format(selectedDay);
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Color(0x5F889E69),
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(fontSize: 17),
                  weekendTextStyle: TextStyle(fontSize: 17),
                  todayTextStyle: TextStyle(fontSize: 17),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF889E69),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  titleTextStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
          ),
        ),
        const Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 89, 32),
                  child: Text(
                    "If you know your expected\ndue date or the birth date,\nplease let us know.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 42, 168),
                  child: Text(
                      "It’s okay if it’s not exactly,\nyou can change it later!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      )),
                )
              ],
            )),
        if (_selectedDay != null)
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 23, 50),
              child: nextButton(
                context,
                LoginBirthMethodPage(),
                onPressed: () {
                  print('보낼 날짜: $formattedDate');
                  // 일시적으로 확인을 위해 print()문을 추가해두었습니다! 이후 삭제 예정
                  // 이를 통해서 날짜 formattedDate에 저장
                  // 추가적으로 백엔드로 보낼 코드 작성 예정...
                },
              ),
            ),
          ),
      ]),
    );
  }
}
