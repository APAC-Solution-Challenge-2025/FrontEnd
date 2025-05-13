import 'package:flutter/material.dart';

final List<Map<String, dynamic>> boxData = [
  {"label": "Box 1", "isComplete": true},
  {"label": "Box 2", "isComplete": false},
  {"label": "Box 3", "isComplete": true},
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFFbec5a4),
        appBar: AppBar(
          backgroundColor: const Color(0xFFbec5a4),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.27,
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nice to see you,",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          SizedBox(height: 8),
                          Text("Hong Gildong",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xffe5cebc),
                        foregroundImage: AssetImage("assets/images/hug_me.png"),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container(color: const Color(0xFFFFFAF6))),
              ],
            ),

            // 첫 번째 박스 (위쪽에 위치)
            Positioned(
              top: screenHeight * 0.2,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/calendarDetail');
                },
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.15,
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
                  padding: const EdgeInsets.only(left: 20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("How do you feel today?",
                              style: TextStyle(fontSize: 15)),
                          SizedBox(height: 8),
                          Text("Begin Your Caring Routine",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Icon(Icons.arrow_forward_ios,
                            size: 30, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenHeight * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: boxData.map((data) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    child:
                        _buildBox(context, data["label"], data["isComplete"]),
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }

  Widget _buildBox(BuildContext context, String label, bool isComplete) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.25,
      height: screenHeight * 0.18,
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
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isComplete
                ? "assets/images/completed.png"
                : "assets/images/non_completed.png",
            width: screenWidth * 0.2,
            height: screenHeight * 0.13,
          ),
          Text(label),
        ],
      ),
    );
  }
}
