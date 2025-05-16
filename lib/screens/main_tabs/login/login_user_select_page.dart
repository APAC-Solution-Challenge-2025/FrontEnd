import 'package:flutter/material.dart';
import 'package:apac_solution_challenge/widgets/buttons.dart';
import 'login_choose_hobby.dart';
import 'package:provider/provider.dart';
import 'package:apac_solution_challenge/provider/user_input_data_provider.dart';

class LoginUserSelect extends StatefulWidget {
  const LoginUserSelect({super.key});

  @override
  State<LoginUserSelect> createState() => _LoginUserSelectState();
}

class _LoginUserSelectState extends State<LoginUserSelect> {
  String? userType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_user_selection_page.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.11),
              const Center(
                child: Text(
                  "What brings\nyou here today?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userType = ("postpartum");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFCF9C99).withOpacity(
                        userType == null || userType == ("postpartum")
                            ? 1.0
                            : 0.4), // 선택 안 된다면 투명하게
                    elevation: userType == ("postpartum") ? 8 : 0, // 선택된다면 그림자
                    shadowColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 45),
                  ),
                  child: const Text(
                    'I recently\ngave birth',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SizedBox(
                width: 260,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userType = ("guardian");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA792B9).withOpacity(
                        userType == null || userType == ("guardian")
                            ? 1.0
                            : 0.4),
                    elevation: userType == ("guardian") ? 8 : 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 45),
                  ),
                  child: const Text(
                    'Supporting\nafter birth',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.205),
              if (userType != null)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: nextButton(context, InterestScreen(), onPressed: () {
                    final provider = Provider.of<UserInputDataProvider>(context,
                        listen: false);
                    provider.setUserType([userType!]);
                  }),
                )
            ],
          )
        ],
      ),
    );
  }
}
