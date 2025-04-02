import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportMainPage extends StatefulWidget {
  const ReportMainPage({super.key});

  @override
  State<ReportMainPage> createState() => _ReportMainPageState();
  }

  class _ReportMainPageState extends State<ReportMainPage> {
    DateTime selectedDate = DateTime.now(); // 현재 날짜

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now(); // 현재 날짜

    int days = daysInMonth(now); // 이번 달 일수
    int startDay = DateTime(now.year, now.month, 1).weekday; // 시작 요일

    // 날짜 리스트 생성
    List<int?> dates = [
      for (int i = 1; i < startDay; i++) null, // 이전 달 빈 칸
      for (int i = 1; i <= days; i++) i,       // 이번 달 날짜
    ];

    while (dates.length % 7 != 0) {
      dates.add(null); // 빈 칸으로 나머지 칸 채우기
    }

    final List<String> week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    final String month = DateFormat('MMMM').format(now);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFAF6),
        title: Text(
          month,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: GestureDetector(
              onTap: () => _selectDate(context), // 기본 제공되는 showDatePicker 사용 -> 이후 디자인 변경
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                      spreadRadius: 0.1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('yyyy. MM. dd.').format(selectedDate),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 캘린더 UI
          Positioned(
            top: 75,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    spreadRadius: 0.1,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 요일 렌더링
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: week.map((day) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: Text(
                                day,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: 40,
                              color: Colors.grey,
                              margin: const EdgeInsets.only(top: 5),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),

                  // 날짜 렌더링
                  Expanded(
                    child: ListView.builder(
                      itemCount: (dates.length / 7).ceil(),
                      itemBuilder: (context, weekIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < 7; i++)
                              if (weekIndex * 7 + i < dates.length) // 유효한 날짜 확인
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: dates[weekIndex * 7 + i] != null
                                          ? () {
                                              Navigator.pushNamed(
                                                context,
                                                '/reportDetailPage',
                                                arguments: DateTime(
                                                  now.year,
                                                  now.month,
                                                  dates[weekIndex * 7 + i]!,
                                                ),
                                              );
                                            }
                                          : null, // 빈 날짜는 터치 안 되게
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        width: 40,
                                        height: 70,
                                        padding: const EdgeInsets.only(top: 5),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Stack(
                                          alignment: Alignment.topCenter,
                                          children: [
                                            if (dates[weekIndex * 7 + i] != null &&
                                                DateTime(
                                                      now.year,
                                                      now.month,
                                                      dates[weekIndex * 7 + i]!,
                                                    ).day ==
                                                    now.day)
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFFBEC5A4),
                                                ),
                                              ),
                                            Text(
                                              dates[weekIndex * 7 + i]?.toString() ?? "",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: dates[weekIndex * 7 + i] != null &&
                                                        DateTime(
                                                              now.year,
                                                              now.month,
                                                              dates[weekIndex * 7 + i]!,
                                                            ).weekday ==
                                                            7
                                                    ? Colors.blue
                                                    : dates[weekIndex * 7 + i] != null &&
                                                            DateTime(
                                                                  now.year,
                                                                  now.month,
                                                                  dates[weekIndex * 7 + i]!,
                                                                ).weekday ==
                                                                1
                                                        ? Colors.red
                                                        : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Container(
                                      height: 1,
                                      width: 40,
                                      color: Colors.grey,
                                      margin: const EdgeInsets.only(top: 10),
                                    ),
                                  ],
                                ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null && pickedDate != selectedDate) {
    setState(() {
      selectedDate = pickedDate;
    });
  }
}


  // 월의 일수 계산 함수
  int daysInMonth(DateTime date) {
    var nextMonth = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 1)
        : DateTime(date.year + 1, 1, 1);
    return nextMonth.subtract(const Duration(days: 1)).day;
  }
}