import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../provider/report_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final reportProvider = Provider.of<ReportProvider>(context);

    bool hasGoals = reportProvider.goals.isNotEmpty;
    bool allAchieved = hasGoals && reportProvider.goals.every((goal) => goal["achieved"] == true);

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
                            style: TextStyle(fontSize: 20, color: Colors.white)),
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
          Positioned(
            top: screenHeight * 0.17,
            child: GestureDetector(
              onTap: () {
                DateTime today = DateTime.now();
                Navigator.pushNamed(
                  context,
                  '/calendarDetail',
                  arguments: DateTime(today.year, today.month, today.day),
                );
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          allAchieved
                                  ? "You are kind to yourself!"
                                  : "How do you feel today?",
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          allAchieved
                                  ? "Celebrate your achievement\nwith kindness."
                                  : "Begin Your Caring Routine",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Padding(
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
            top: screenHeight * 0.35,
            left: screenWidth * 0.05,
            child: const Text(
              "Today for Me",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: screenHeight * 0.38,
            child: Consumer<ReportProvider>(
              builder: (context, boxProvider, child) {
                if (boxProvider.goals.isEmpty) {
                  return Container(
                    width: screenWidth * 0.9,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.08),
                    child: const Text(
                      "No goals set for today yet.",
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: boxProvider.goals.map((data) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: _buildBox(context, data["content"], data["achieved"]),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.6,
            child: SizedBox(
              width: screenWidth * 0.9,
              height: screenHeight * 0.18,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight * 0.2,
                  viewportFraction: 0.6,
                  autoPlay: true,
                  enlargeCenterPage: false,
                ),
                items: [
                  {
                    "url": "https://img.youtube.com/vi/DoIVuR25Yqo/0.jpg",
                    "video": "https://www.youtube.com/watch?v=DoIVuR25Yqo"
                  },
                  {
                    "url": "https://img.youtube.com/vi/wRtvOwBXRBw/0.jpg",
                    "video": "https://www.youtube.com/watch?v=wRtvOwBXRBw"
                  },
                  {
                    "url": "https://img.youtube.com/vi/ZyMQPoMTu_c/0.jpg",
                    "video": "https://www.youtube.com/watch?v=ZyMQPoMTu_c"
                  },
                ].map((item) {
                  return GestureDetector(
                    onTap: () async {
                      if (item["video"]!.isNotEmpty) {
                        final Uri url = Uri.parse(item["video"]!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw "Could not launch ${item["video"]}";
                        }
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: item["url"]!.startsWith("http")
                          ? Image.network(item["url"]!, fit: BoxFit.cover)
                          : Image.asset(item["url"]!, fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBox(BuildContext context, String content, bool achieved) {
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
            achieved
                ? "assets/images/completed.png"
                : "assets/images/non_completed.png",
            width: screenWidth * 0.2,
            height: screenHeight * 0.13,
          ),
          Text(content),
        ],
      ),
    );
  }
}
