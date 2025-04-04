import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/login_page_img.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 370, bottom: 50),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                ),
                TextButton.icon(
                  icon: Image.asset(
                    'assets/images/google_logo.png',
                    width: 24,
                    height: 24,
                  ),
                  label: const Text('Sign in with Google'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  onPressed: () {
                    // 여기에 구글 Oauth로그인 관련 코드
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: SignInWithAppleButton(
                    onPressed: () {
                      // 여기에 애플 로그인 Oauth관련 코드
                    },
                    style: SignInWithAppleButtonStyle.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton.icon(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.white,
                    size: 24,
                  ),
                  label: const Text(
                    'Continue with Facebook',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF1877F2),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () {
                    // 여기에 페이스북 Oauth로그인 관련 코드
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Get started faster and easier\nwith your social account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, height: 1),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
