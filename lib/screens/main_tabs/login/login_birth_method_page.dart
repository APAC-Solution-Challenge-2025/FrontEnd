import 'package:flutter/material.dart';
import 'package:apac_solution_challenge/widgets/buttons.dart';
import 'login_body_change_info.dart';

class LoginBirthMethodPage extends StatefulWidget {
  const LoginBirthMethodPage({super.key});

  @override
  State<LoginBirthMethodPage> createState() => _LoginBirthMethodPageState();
}

class _LoginBirthMethodPageState extends State<LoginBirthMethodPage> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_birth_method_page.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.328),
              const Center(
                child: Text(
                  "Which childbirth method\nhave you selected?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.075),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedMethod = ("Natural");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCF9C99).withOpacity(
                        selectedMethod == null || selectedMethod == ("Natural")
                            ? 1.0
                            : 0.4), // 선택 안 된다면 투명하게
                    elevation:
                        selectedMethod == ("Natural") ? 8 : 0, // 선택된다면 그림자
                    shadowColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 45),
                  ),
                  child: const Text(
                    'Natural Birth',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedMethod = ("Cesarean");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA792B9).withOpacity(
                        selectedMethod == null || selectedMethod == ("Cesarean")
                            ? 1.0
                            : 0.4),
                    elevation: selectedMethod == ("Cesarean") ? 8 : 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 45),
                  ),
                  child: const Text(
                    'Cesarean Section',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.022),
              const Text(
                "Not sure yet? No worries!\nYou can change it later!",
                style: TextStyle(
                    color: Color(0xFF889E69), fontWeight: FontWeight.bold),
              ),
              if (selectedMethod != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: nextButton(context, BodyInfoScreen(), onPressed: () {
                    if (selectedMethod != null) {
                      print('보낼 날짜: $selectedMethod');
                      //이후 프린트는 삭제 예정
                      //이후 이 블록 내에 백엔드로 넘겨주는 코드 작성 예정!
                    }
                  }),
                )
            ],
          )
        ],
      ),
    );
  }
}
