import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import '../../../provider/report_provider.dart';

class ReportDetailPage extends StatefulWidget {
  const ReportDetailPage({super.key});

  @override
  State<ReportDetailPage> createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage> {
  late ReportProvider reportProvider;
  DateTime? selectedDate;
  Map<int, bool> expandedStates = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedDate = ModalRoute.of(context)?.settings.arguments as DateTime?;
    reportProvider = Provider.of<ReportProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map<String, dynamic> responseData = {
        "date": "2025-05-16",
        "healthStatus": [
          {
            "content": "Your overall health appears to be stable, with no significant deviations observed in your recent biometric data, including heart rate, sleep duration, and general activity levels.",
            "status": 0
          },
          {
            "content": "You should pay attention to specific symptoms such as recurring fatigue, mild headaches in the late afternoon, and slight difficulty concentrating, which could be early signs of stress or dehydration.",
            "status": 1
          },
          {
            "content": "There are potentially dangerous health conditions noted, including sudden spikes in blood pressure during rest and irregular breathing patterns during sleep, which may require medical consultation.",
          },
        ],
        "recommendedSolution": "To improve your overall well-being, consider establishing a consistent sleep schedule that allows for at least 7 to 8 hours of restful sleep each night. Increase your daily water intake to stay properly hydrated, aiming for at least 2 liters per day, and incorporate regular low-impact physical activities such as walking, stretching, or yoga. Additionally, try to reduce stress through mindfulness practices, maintain a balanced diet rich in fruits and vegetables, and avoid excessive screen time before bedtime to enhance sleep quality.",
        "goals": [
          {"content": "goal1", "achieved": true},
          {"content": "goal2", "achieved": false},
          {"content": "goal3", "achieved": true},
        ],
        
      };


      if (mounted) {
        // 날짜 비교
        final reportDate = DateTime.tryParse(responseData["date"]);
        final sameDate = reportDate != null &&
            selectedDate != null &&
            reportDate.year == selectedDate!.year &&
            reportDate.month == selectedDate!.month &&
            reportDate.day == selectedDate!.day;

        if (sameDate) {
          reportProvider.updateReportData(responseData);
        } else {
          reportProvider.clearReportData(); // 날짜가 다르면 데이터 클리어
        }
      }
    });
  }

  String formatDateWithSuffix(DateTime date) {
    final day = date.day;
    final suffix = (day % 10 == 1 && day != 11)
        ? "st"
        : (day % 10 == 2 && day != 12)
            ? "nd"
            : (day % 10 == 3 && day != 13)
                ? "rd"
                : "th";

    return "${DateFormat('MMM').format(date)} $day$suffix, ${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        selectedDate != null ? formatDateWithSuffix(selectedDate!) : "no date";

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFAF6),
        elevation: 0,
        title: Text(formattedDate),
      ),
      body: Consumer<ReportProvider>(
        builder: (context, reportProvider, child) {
          final hasData = reportProvider.healthStatus.isNotEmpty ||
              reportProvider.goals.isNotEmpty ||
              reportProvider.recommendedSolution.isNotEmpty;

          if (!hasData) {
            return const Center(
              child: Text(
                    "No report available for this date.",
                    style: TextStyle(fontSize: 18),
                  ),
            );
          }

          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  _buildSectionTitle(screenWidth, "Status"),
                  _buildCustomContainer(
                    null,
                    "Summary of health status.",
                    0,
                    16,
                    const Color(0xFFD9D9D9),
                    Colors.white,
                    index: 0,
                    isExpanded: expandedStates[0] ?? false,
                    onTap: () {
                      setState(() {
                        expandedStates[0] = !(expandedStates[0] ?? false);
                      });
                    },
                  ),
                  _buildCustomContainer(
                    null,
                    "Summary of health conditions that require attention.",
                    0,
                    15,
                    const Color(0xFFF2ED87),
                    Colors.white,
                    index: 1,
                    isExpanded: expandedStates[1] ?? false,
                    onTap: () {
                      setState(() {
                        expandedStates[1] = !(expandedStates[1] ?? false);
                      });
                    },
                  ),
                  _buildCustomContainer(
                    null,
                    "Summary of potentially dangerous health conditions.",
                    0,
                    15,
                    const Color(0xFFE5BCBC),
                    Colors.white,
                    index: 2,
                    isExpanded: expandedStates[2] ?? false,
                    onTap: () {
                      setState(() {
                        expandedStates[2] = !(expandedStates[2] ?? false);
                      });
                    },
                  ),
                  _buildCustomContainer(
                    "Recommended solution:",
                    "A comprehensive assessment of the current health status and guidance on appropriate recommendations.",
                    18,
                    15,
                    null,
                    const Color(0xFFE5CEBC),
                    hasImage: true,
                    index: 3,
                    isExpanded: expandedStates[3] ?? false,
                    onTap: () {
                      setState(() {
                        expandedStates[3] = !(expandedStates[3] ?? false);
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  _buildSectionTitle(screenWidth, "Today for Me"),
                  ...List.generate(
                    reportProvider.goals.length,
                    (index) {
                      final goal = reportProvider.goals[index];
                      return buildTodoItem(goal["content"], index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(double screenWidth, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Text("Edit+",
              style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildCustomContainer(
    String? title,
    String paramDescription,
    double titleSize,
    double descSize,
    Color? circleColor,
    Color bgColor, {
    bool hasImage = false,
    required int index,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final healthStatus = reportProvider.healthStatus;
    final recommendedSolution = reportProvider.recommendedSolution;

    String expandedText = (index == 3)
        ? recommendedSolution
        : (index < healthStatus.length ? (healthStatus[index]["content"] ?? "") : "");

    return GestureDetector(
      onTap: onTap,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
          width: screenWidth * 0.9,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: bgColor,
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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (circleColor != null)
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 10, top: 4),
                      decoration: BoxDecoration(
                        color: circleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title != null)
                          Text(title,
                              style: TextStyle(
                                  fontSize: titleSize,
                                  fontWeight: FontWeight.bold)),
                        if (title != null) const SizedBox(height: 8),
                        Text(paramDescription,
                            style: TextStyle(fontSize: descSize)),
                        if (isExpanded) ...[
                          const SizedBox(height: 10),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: isExpanded ? 1.0 : 0.0,
                            child: Text(expandedText,
                                style: TextStyle(
                                    fontSize: descSize,
                                    color: Colors.grey[700])),
                          ),
                        ]
                      ],
                    ),
                  ),
                  if (hasImage) const SizedBox(width: 110),
                ],
              ),
              if (hasImage)
                Positioned(
                  bottom: -25,
                  right: -40,
                  child: Visibility(
                    visible: !isExpanded,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Transform.rotate(
                        angle: -pi / 7,
                        child: Image.asset(
                          "assets/images/hug_me.png",
                          width: 130,
                          height: 130,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTodoItem(String text, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<ReportProvider>(
      builder: (context, provider, _) {
        final isCompleted = provider.goals[index]["achieved"] as bool;

        return GestureDetector(
          onTap: () => provider.toggleGoalCompletion(index),
          child: Container(
            width: screenWidth * 0.9,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isCompleted ? const Color(0xffBEC5A4) : Colors.white,
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
              children: [
                Icon(
                  isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                  color: isCompleted ? Colors.white : Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
