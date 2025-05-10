import 'package:flutter/material.dart';
import '../../home/home.dart';
import 'package:apac_solution_challenge/widgets/buttons.dart';
import 'login_health_check.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final List<List<String>> interestRows = [
    [
      'Reading',
      'Watching anime',
      'Going to cafés',
      'Painting',
      'Journaling',
      'Watching movies'
    ],
    [
      'Watching dramas',
      'Building models',
      'Driving',
      'Working out',
      'Baking',
      'Gardening'
    ],
    [
      'Exploring restaurants',
      'Drawing',
      'Taking walks',
      'Camping',
      'Board games',
      'Picnicking'
    ],
    [
      'Photography',
      'Coding',
      'Listening to music',
      'Doing yoga',
      'Making playlists',
      'Playing piano'
    ],
    [
      'Listening to songs',
      'Ice cream',
      'YouTube',
      'Karaoke',
      'Dancing',
      'Playing games'
    ],
    [
      'Interior decorating',
      'Shopping',
      'Crafts',
      'Collecting comics',
      'Solving puzzles',
      'Writing'
    ],
  ];

  final Set<String> selectedInterests = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_choose_hobby_page.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 110, 20, 30),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 가로 스크롤 선택 버튼 박스
                  Column(
                    children: interestRows.map((row) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SizedBox(
                          height: 52,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: row.map((item) {
                                final isSelected =
                                    selectedInterests.contains(item);
                                return selectButton(
                                  //버튼 (위젯 설정)
                                  label: item,
                                  isSelected: isSelected,
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        selectedInterests.remove(item);
                                      } else {
                                        selectedInterests.add(item);
                                      }
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(
                    height: 38,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29),
                    child: Text(
                      "Can you share\nwhat you like?\nI'd really love to know!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 33),

                  Padding(
                    padding: const EdgeInsets.only(left: 37),
                    child: Text(
                      "Please choose at least 3!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  // NEXT 버튼
                  if (selectedInterests.length >= 3)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                      child: nextButton(context, LoginHealthCheck()),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
