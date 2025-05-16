import 'package:apac_solution_challenge/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:apac_solution_challenge/widgets/buttons.dart';
import 'package:provider/provider.dart';
import 'package:apac_solution_challenge/provider/user_input_data_provider.dart';

class BodyInfoScreen extends StatefulWidget {
  const BodyInfoScreen({super.key});

  @override
  State<BodyInfoScreen> createState() => _BodyInfoScreenState();
}

class _BodyInfoScreenState extends State<BodyInfoScreen> {
  String? bodyInfoText;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadBodyInfoText();
  }

  Future<void> loadBodyInfoText() async {
    await Future.delayed(const Duration(seconds: 1));
    const dummy = '''
Week 3 Postpartum

Around this time, wrist and lower back pain, as well as fatigue, are common.
You may experience postpartum tendonitis, especially in the wrists.
Try supporting your baby with your whole arm and do light stretches when possible.
Mood swings can also happen—and that’s completely normal.
 How about taking a small moment for yourself today, with a warm cup of tea?
''';

    setState(() {
      bodyInfoText = dummy;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_body_change_info_page.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.45),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: 440,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Scrollbar(
                thumbVisibility: true,
                radius: const Radius.circular(20), // 스크롤 바 둥글게
                thickness: 4,
                child: SingleChildScrollView(
                  child: Text(
                    bodyInfoText ?? "loading .... ",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      height: 1.5, // 줄 간격 설정정
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: nextButton(
              context,
              const Layout(),
            ),
          ),
        ],
      ),
    );
  }
}
