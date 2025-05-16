import 'package:flutter/material.dart';
import 'package:apac_solution_challenge/widgets/buttons.dart';
import 'login_choose_date.dart';
import 'package:provider/provider.dart';
import 'package:apac_solution_challenge/provider/user_input_data_provider.dart';

class LoginHealthCheck extends StatefulWidget {
  const LoginHealthCheck({super.key});

  @override
  State<LoginHealthCheck> createState() => _LoginHealthCheckState();
}

class _LoginHealthCheckState extends State<LoginHealthCheck> {
  final List<List<String>> healthRows = [
    ['I feel tired', 'My body feels heavy', 'I have pain', 'I lack sleep'],
    ['I feel swollen', 'I have no appetite', 'I have digestive issues'],
    ['I feel depressed', 'I feel anxious', 'I’m irritable'],
    ['I feel lonely', 'I get annoyed easily', 'I feel lethargic'],
    ['I can’t concentrate', 'I feel empty', 'I don’t recognize myself'],
    ['I’m okay', 'I feel a bit relaxed', 'I can hang in there'],
  ];

  final Set<String> selectedCondition = {};

  void toggleSelection(String label) {
    setState(() {
      if (selectedCondition.contains(label)) {
        selectedCondition.remove(label);
      } else {
        selectedCondition.add(label);
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
                                    isSelected:
                                        selectedCondition.contains(label),
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
                if (selectedCondition.isNotEmpty)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: nextButton(
                        context,
                        LoginChooseDate(),
                        onPressed: () {
                          Provider.of<UserInputDataProvider>(context,
                                  listen: false)
                              .setCondition(selectedCondition.toList());
                        },
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
