import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../provider/calendar_data.dart';

class ReportMainPage extends StatefulWidget {
  const ReportMainPage({super.key});

  @override
  State<ReportMainPage> createState() => _ReportMainPageState();
}

class _ReportMainPageState extends State<ReportMainPage> {
  DateTime selectedDate = DateTime.now(); // 선택된 날짜 (초기값: 오늘)

  @override
  Widget build(BuildContext context) {
    final calendarData = Provider.of<CalendarData>(context);

    DateTime now = selectedDate;
    int days = daysInMonth(now);
    int startDay = DateTime(now.year, now.month, 1).weekday;

    List<int?> dates = [
      for (int i = 1; i < startDay; i++) null,
      for (int i = 1; i <= days; i++) i,
    ];

    while (dates.length % 7 != 0) {
      dates.add(null);
    }

    final List<String> week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFAF6),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Calendar",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedDate = DateTime.now();
                });
              },
              icon: const Icon(Icons.today, size: 18),
              label: const Text(
                "today",
                style: TextStyle(fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBEC5A4),
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // 날짜 선택 박스
          Positioned(
            top: 10,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
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
                      DateFormat('yyyy. MM.').format(selectedDate),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 캘린더 UI
          Positioned(
            top: 75,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            child: Container(
              height: screenHeight * 0.58,
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
                                style: const TextStyle(fontSize: 14),
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
                              if (weekIndex * 7 + i < dates.length)
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: dates[weekIndex * 7 + i] != null
                                          ? () {
                                              Navigator.pushNamed(
                                                context,
                                                '/calendarDetail',
                                                arguments: DateTime(
                                                  now.year,
                                                  now.month,
                                                  dates[weekIndex * 7 + i]!,
                                                ),
                                              );
                                            }
                                          : null,
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        width: 40,
                                        height: 70,
                                        padding: const EdgeInsets.only(top: 5),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            // 날짜 텍스트
                                            Container(
                                              alignment: Alignment.topCenter,
                                              width: 40,
                                              height: 70,
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  if (dates[weekIndex * 7 +
                                                              i] !=
                                                          null &&
                                                      DateTime(
                                                            now.year,
                                                            now.month,
                                                            dates[
                                                                weekIndex * 7 +
                                                                    i]!,
                                                          ).day ==
                                                          DateTime.now().day &&
                                                      now.month ==
                                                          DateTime.now()
                                                              .month &&
                                                      now.year ==
                                                          DateTime.now().year)
                                                    Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Color(0xFFBEC5A4),
                                                      ),
                                                    ),
                                                  // 텍스트를 원 위에 렌더링
                                                  Text(
                                                    dates[weekIndex * 7 + i]
                                                            ?.toString() ??
                                                        "",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: dates[weekIndex *
                                                                          7 +
                                                                      i] !=
                                                                  null &&
                                                              DateTime(
                                                                    now.year,
                                                                    now.month,
                                                                    dates[weekIndex *
                                                                            7 +
                                                                        i]!,
                                                                  ).weekday ==
                                                                  7
                                                          ? Colors.blue
                                                          : dates[weekIndex * 7 +
                                                                          i] !=
                                                                      null &&
                                                                  DateTime(
                                                                        now.year,
                                                                        now.month,
                                                                        dates[weekIndex *
                                                                                7 +
                                                                            i]!,
                                                                      ).weekday ==
                                                                      1
                                                              ? Colors.red
                                                              : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // 목표 달성 이미지
                                            Builder(builder: (context) {
                                              String dateKey =
                                                  "${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${dates[weekIndex * 7 + i]?.toString().padLeft(2, '0') ?? '00'}";
                                              int progress = calendarData
                                                  .getProgress(dateKey);

                                              Widget? progressImage;
                                              switch (progress) {
                                                case 0:
                                                  progressImage = Image.asset(
                                                      'assets/images/step0.png',
                                                      width: 30);
                                                  break;
                                                case 1:
                                                  progressImage = Image.asset(
                                                      'assets/images/step1.png',
                                                      width: 30);
                                                  break;
                                                case 2:
                                                  progressImage = Image.asset(
                                                      'assets/images/step2.png',
                                                      width: 30);
                                                  break;
                                                case 3:
                                                  progressImage = Image.asset(
                                                      'assets/images/step3.png',
                                                      width: 30);
                                                  break;
                                                default:
                                                  progressImage = null;
                                              }

                                              return Positioned(
                                                top: 35,
                                                child: progressImage ??
                                                    const SizedBox.shrink(),
                                              );
                                            }),
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
    final selected = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        int tempYear = selectedDate.year;
        int tempMonth = selectedDate.month;
        final screenHeight = MediaQuery.of(context).size.height;

        return AlertDialog(
          backgroundColor: const Color(0xFFFFFAF6),
          title: const Text(
            'Select Year & Month',
          ),
          content: StatefulBuilder(
            builder: (context, setInnerState) {
              return SizedBox(
                height: screenHeight * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // 연도 드롭다운
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                isExpanded: true,
                                value: tempYear,
                                items: [
                                  for (int year = 2000; year <= 2100; year++)
                                    DropdownMenuItem(
                                      value: year,
                                      child: Text('$year'),
                                    )
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    setInnerState(() {
                                      tempYear = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        // 월 드롭다운
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                isExpanded: true,
                                value: tempMonth,
                                items: [
                                  for (int month = 1; month <= 12; month++)
                                    DropdownMenuItem(
                                      value: month,
                                      child: Text(
                                          month.toString().padLeft(2, '0')),
                                    )
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    setInnerState(() {
                                      tempMonth = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              child: const Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(DateTime(tempYear, tempMonth, 1));
              },
            ),
          ],
        );
      },
    );

    if (selected != null) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  int daysInMonth(DateTime date) {
    var nextMonth = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 1)
        : DateTime(date.year + 1, 1, 1);
    return nextMonth.subtract(const Duration(days: 1)).day;
  }
}
