import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class ReportDetailPage extends StatefulWidget {
  const ReportDetailPage({super.key});

  @override
  State<ReportDetailPage> createState() => _ReportDetailPageState();
}

class _ReportDetailPageState extends State<ReportDetailPage> {
  DateTime? selectedDate;
  Map<int, bool> expandedStates = {}; // 클릭 여부
  List<bool> completedStates = [false, false, false]; // 목표 완료 여부부

  void toggleCompletion(int index) {
    setState(() {
      completedStates[index] = !completedStates[index];
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedDate = ModalRoute.of(context)?.settings.arguments as DateTime?;
  }

  // 각 컨테이너에 대한 Mock 데이터
  final Map<int, String> mockData = {
    0: "This is a detailed explanation of the health status, covering various factors such as heart rate, blood pressure, oxygen saturation, and stress levels. Additionally, it considers recent lifestyle changes and medical history to provide a personalized assessment of overall well-being. Monitoring these health indicators regularly can help detect early warning signs and improve long-term health outcomes.",
    
    1: "Conditions that require attention: Based on recent analysis, an increasing trend in stress levels has been observed, potentially affecting sleep patterns and overall mental health. Prolonged stress may lead to various complications, including hypertension and anxiety disorders. It is highly recommended to incorporate daily relaxation techniques, maintain hydration levels, and adjust physical activity accordingly for better stress management.",

    2: "Potentially dangerous health conditions: There has been a noticeable fluctuation in cardiovascular readings that may indicate underlying risks. Symptoms such as irregular heartbeat, dizziness, or chest discomfort should not be ignored. Consulting a physician for further diagnostic tests like ECG or blood tests is advised to rule out critical health issues. Preventive measures include maintaining a balanced diet, regular exercise, and reducing excessive caffeine intake.",

    3: "Recommended solutions and next steps: To improve the current health status, engaging in mindfulness exercises, meditation, or breathing techniques can be beneficial for reducing stress levels. A well-balanced diet rich in essential nutrients and antioxidants should be prioritized. Drinking sufficient water, following a consistent sleep schedule, and avoiding excessive screen time are additional steps toward enhancing physical and mental well-being."
  };

  List<String> todoItems = [
  "Complete the Flutter project",
  "Write project documentation, ensuring that all technical details, installation guides, API references, and system requirements are clearly outlined. This will help users and developers understand the project better and ease integration with other systems.",
  "Prepare for final review by compiling feedback from stakeholders, adjusting the user interface based on usability testing results, refining the core functionalities to improve performance, and ensuring all edge cases are handled effectively. The review process should also include a thorough analysis of the overall user experience, responsiveness across multiple devices, security improvements, and final refinements before deployment."
  ];

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
        selectedDate != null ? formatDateWithSuffix(selectedDate!) : "날짜 없음";

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFAF6),
        elevation: 0,
        flexibleSpace: Container( 
          decoration: const BoxDecoration(
            color: Color(0xFFFFFAF6),
          ),
        ),
      title: Text(formattedDate)
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    child: const Text(
                      "Status",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.05),
                    child: const Text(
                      "Edit+",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  _buildCustomContainer(
                    screenHeight * 0.05,
                    null,
                    "Summary of health status.",
                    0,
                    16,
                    const Color(0xFFD9D9D9),
                    Colors.white,
                    index: 0,
                  ),
                  const SizedBox(height: 1),
                  _buildCustomContainer(
                    screenHeight * 0.08,
                    null,
                    "Summary of health conditions that require attention.",
                    0,
                    15,
                    const Color(0xFFF2ED87),
                    Colors.white,
                    index: 1,
                  ),
                  const SizedBox(height: 1),
                  _buildCustomContainer(
                    screenHeight * 0.08,
                    null,
                    "Summary of potentially dangerous health conditions.",
                    0,
                    15,
                    const Color(0xFFE5BCBC),
                    Colors.white,
                    index: 2,
                  ),
                  const SizedBox(height: 1),
                  _buildCustomContainer(
                    screenHeight * 0.15,
                    "Recommended solution",
                    "A comprehensive assessment of the current health status and guidance on appropriate recommendations.",
                    18,
                    15,
                    null,
                    const Color(0xFFE5CEBC),
                    hasImage: true,
                    index: 3,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    child: const Text(
                      "Today for Me",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.05),
                    child: const Text(
                      "Edit+",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Column(
                children: todoItems.asMap().entries.map((entry) {
                          int index = entry.key;
                          String text = entry.value;
                          return buildTodoItem(text, index);
                        }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomContainer(
    double height,
    String? title,
    String description,
    double titleSize,
    double descSize,
    Color? circleColor,
    Color bgColor, {
    bool hasImage = false,
    required int index,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    int lineCount = (mockData[index]?.split('\n').length ?? 1);
    double baseExpansion = 40.0;
    double textExpansion = (mockData[index]?.length ?? 50) * 0.45; 
    double additionalHeight = (lineCount * 25.0 + textExpansion + baseExpansion).clamp(50, 300);

    return GestureDetector(
      onTap: () {
        setState(() {
          expandedStates[index] = !(expandedStates[index] ?? false); // 클릭 시 컨테이너 확장/축소
        });
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300), // 애니메이션
        curve: Curves.easeInOut,
        child: Container(
          width: screenWidth * 0.9,
          height: expandedStates[index] ?? false ? height + additionalHeight : height,
          margin: const EdgeInsets.symmetric(vertical: 10),
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
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: hasImage ? 60 : screenWidth * 0.05,
                  top: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (circleColor != null)
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundColor: circleColor,
                              radius: 6,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                if (title != null)
                                  TextSpan(
                                    text: "$title: \n\n",
                                    style: TextStyle(
                                        fontSize: titleSize,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                TextSpan(
                                  text: description,
                                  style: TextStyle(fontSize: descSize, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                    if (expandedStates[index] ?? false)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:10,horizontal:20),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: expandedStates[index]! ? 1.0 : 0.0,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              mockData[index] ?? "no data",
                              style: const TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (hasImage)
                Visibility(
                  visible: !(expandedStates[index] ?? false), // 클릭했을 때 이미지 사라짐
                  child: Positioned(
                    bottom: -15,
                    right: -25,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTodoItem(String text, int index) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => toggleCompletion(index),
      child: Container(
        width: screenWidth * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: completedStates[index] ? const Color(0xffBEC5A4) : Colors.white,
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
              completedStates[index] ? Icons.check_box : Icons.check_box_outline_blank,
              color: completedStates[index] ? Colors.white : Colors.grey,
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
  }
}