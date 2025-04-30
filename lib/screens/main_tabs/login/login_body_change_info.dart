import 'package:flutter/material.dart';
import '../../home/home.dart';
import 'package:apac_solution_challenge/widgets/buttons.dart';

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
테스트용 텍스트입니다
1.
2.
3.
4.
5.
6.
7.
8.
9.
10.
.
.
.
.
.
.
.
.
.
.
.
30
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
                    bodyInfoText ?? "ERROR", // 만약에 넘어오는 값이 널일 경우를 위한...
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
                context, const HomePage()), // 일시적으로 HomePage로 이동하도록 설정!
          ),
        ],
      ),
    );
  }
}
