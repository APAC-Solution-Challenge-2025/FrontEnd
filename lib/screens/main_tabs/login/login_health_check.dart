import 'package:flutter/material.dart';
import '../../home/home.dart';
import 'package:apac_solution_challenge/widgets/buttons.dart';

class LoginHealthCheck extends StatefulWidget {
  const LoginHealthCheck({super.key});

  @override
  State<LoginHealthCheck> createState() => _LoginHealthCheckState();
}

class _LoginHealthCheckState extends State<LoginHealthCheck> {
  final List<List<String>> healthRows = [
    ['피곤해요', '몸이 무거워요', '통증이 있어요', '수면이 부족해요'],
    ['붓기가 있어요', '식욕이 없어요', '소화가 안돼요'],
    ['우울해요', '불안해요', '예민해졌어요'],
    ['외로워요', '짜증이 많아졌어요', '무기력해요'],
    ['집중이 잘 안돼요', '공허해요', '내 자신이 낯설어요'],
    ['괜찮아요', '조금은 여유로워요', '버틸 수 있어요'],
  ];

  final Set<String> selectedHealth = {};

  void toggleSelection(String label) {
    setState(() {
      if (selectedHealth.contains(label)) {
        selectedHealth.remove(label);
      } else {
        selectedHealth.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_health_check_page.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 24, 24),
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                    child: Text(
                      "I'm really happy\nto get to know you!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(196, 55, 0, 0),
                  child: Text(
                    "How are you doing\nthese days?",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(190, 38, 0, 0),
                  child: Text(
                    "Please choose\nat least 1!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: healthRows.length,
                    itemBuilder: (context, rowIndex) {
                      final row = healthRows[rowIndex];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: row.map((label) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0),
                                  child: selectButton(
                                    label: label,
                                    isSelected: selectedHealth.contains(label),
                                    onTap: () => toggleSelection(label),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // next 버튼
                if (selectedHealth.isNotEmpty)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      //추후 이러한 방식으로 버튼 위치 고정...수정 예정
                      child: nextButton(context, const HomePage()),
                      // 우선 Homepage로 가는 것으로 임시 설정 이후 수정 예정
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
