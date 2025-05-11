import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../provider/notification_provider.dart';

List<Map<String, dynamic>> mockUserData = [
  {
    "name": "Hong Gildong",
    "birthday": "1995-08-21",
    "email": "honggildong@example.com",
    "country": "South Korea",
  },
];

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFAF6),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.2,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.02, left: screenWidth * 0.05),
                  decoration: BoxDecoration(
                    color: const Color(0xFFbec5a4),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          mockUserData[0]
                              ["name"], // 임시 텍스트, 나중에 받아온 유저 정보를 렌더링하는 것으로 변경
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.75,
                            child: const Divider(
                                thickness: 0.5, color: Colors.white), // 구분선
                          ),
                        ],
                      ),
                      Text(
                          DateFormat('yyyy/MM/dd').format(DateTime.parse(
                              mockUserData[0]
                                  ["birthday"])), // 나중에 유저 정보의 생년월일로 변경
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                      Text(
                          mockUserData[0]
                              ["email"], // 임시 텍스트, 나중에 받아온 유저 정보를 렌더링하는 것으로 변경
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                      Text(
                          mockUserData[0][
                              "country"], // 임시 텍스트, 나중에 받아온 유저 정보를 렌더링하는 것으로 변경
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                const Text("My Information",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            spreadRadius: 0.1,
                            blurRadius: 3,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "관심사 설정")), // 백엔드에서 데이터 가져오는 작업으로 수정 필요
                          ),
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.03),
                                const Icon(Icons.favorite_border,
                                    size: 20, color: Colors.grey),
                                SizedBox(width: screenWidth * 0.03),
                                const Text("Interests",
                                    style: TextStyle(fontSize: 14)),
                                Expanded(child: Container()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth * 0.05),
                                  child: const Icon(Icons.arrow_forward_ios,
                                      size: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.8,
                              child: const Divider(
                                  thickness: 0.5, color: Colors.grey),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () =>
                              ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("건강 상태")),
                          ),
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.03),
                                const Icon(Icons.sentiment_very_satisfied,
                                    size: 20, color: Colors.grey),
                                SizedBox(width: screenWidth * 0.03),
                                const Text("Health Condition",
                                    style: TextStyle(fontSize: 14)),
                                Expanded(child: Container()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth * 0.05),
                                  child: const Icon(Icons.arrow_forward_ios,
                                      size: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.8,
                              child: const Divider(
                                  thickness: 0.5, color: Colors.grey),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () =>
                              ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("출산일")),
                          ),
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.03),
                                const Icon(Icons.calendar_today,
                                    size: 20, color: Colors.grey),
                                SizedBox(width: screenWidth * 0.03),
                                const Text("Due Date",
                                    style: TextStyle(fontSize: 14)),
                                Expanded(child: Container()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth * 0.05),
                                  child: const Icon(Icons.arrow_forward_ios,
                                      size: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.8,
                              child: const Divider(
                                  thickness: 0.5, color: Colors.grey), // 구분선
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () =>
                              ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("출산 방법")),
                          ),
                          child: Container(
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                SizedBox(width: screenWidth * 0.03),
                                const Icon(Icons.book_outlined,
                                    size: 20, color: Colors.grey),
                                SizedBox(width: screenWidth * 0.03),
                                const Text("Birth Method",
                                    style: TextStyle(fontSize: 14)),
                                Expanded(child: Container()),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: screenWidth * 0.05),
                                  child: const Icon(Icons.arrow_forward_ios,
                                      size: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(height: screenHeight * 0.04),
                const Text("Notifications",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.16,
                  padding: EdgeInsets.only(left: screenWidth * 0.025),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Consumer<NotificationProvider>(
                        builder: (context, provider, child) {
                          return Theme(
                            data: ThemeData(
                              switchTheme: const SwitchThemeData(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    provider.toggleAll(
                                        !provider.allNotificationsEnabled);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.7,
                                        child: const Text("Turn on All",
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                      Transform.scale(
                                        scale: 0.8,
                                        child: Switch(
                                          value:
                                              provider.allNotificationsEnabled,
                                          onChanged: (value) {
                                            provider.toggleAll(value);
                                          },
                                          activeColor: const Color(0xFFbec5a4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.8,
                                      height: screenHeight * 0.001,
                                      child: const Divider(
                                          thickness: 0.5, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    provider.toggleMorningCheckIn(
                                        !provider.morningCheckInEnabled);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.7,
                                        child: const Text("Morning Check-in",
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                      Transform.scale(
                                        scale: 0.8,
                                        child: Switch(
                                          value: provider.morningCheckInEnabled,
                                          onChanged: (value) {
                                            provider
                                                .toggleMorningCheckIn(value);
                                          },
                                          activeColor: const Color(0xFFbec5a4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: screenWidth * 0.8,
                                      height: screenHeight * 0.001,
                                      child: const Divider(
                                          thickness: 0.5, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    provider.toggleGoalReminders(
                                        !provider.goalRemindersEnabled);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.7,
                                        child: const Text("Goal Reminder",
                                            style: TextStyle(fontSize: 14)),
                                      ),
                                      Transform.scale(
                                        scale: 0.8,
                                        child: Switch(
                                          value: provider.goalRemindersEnabled,
                                          onChanged: (value) {
                                            provider.toggleGoalReminders(value);
                                          },
                                          activeColor: const Color(0xFFbec5a4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                const Text("Account",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.11,
                  padding: EdgeInsets.only(left: screenWidth * 0.025),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: Offset(0, 3)),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("문의사항")),
                        ),
                        child: Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              const Text("FAQ", style: TextStyle(fontSize: 14)),
                              Expanded(child: Container()),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.05),
                                child: const Icon(Icons.arrow_forward_ios,
                                    size: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.8,
                            child: const Divider(
                                thickness: 0.5, color: Colors.grey),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("회원 탈퇴")),
                        ),
                        child: Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              const Text("Delete Account",
                                  style: TextStyle(fontSize: 14)),
                              Expanded(child: Container()),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.05),
                                child: const Icon(Icons.arrow_forward_ios,
                                    size: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
