import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'login_user_select_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final _storage = const FlutterSecureStorage();

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
                  // Google OAuth2.0
                  onPressed: () async {
                    final GoogleSignIn googleSignIn = GoogleSignIn(
                      clientId:
                          kIsWeb ? dotenv.env['GOOGLE_WEB_CLIENT_ID'] : null,
                      scopes: ['email', 'profile'],
                    );

                    try {
                      final GoogleSignInAccount? account =
                          await googleSignIn.signIn();
                      final GoogleSignInAuthentication auth =
                          await account!.authentication;
                      final accessToken = auth.accessToken;

                      if (accessToken != null) {
                        final response = await http.post(
                          Uri.parse(
                              'https://spring-backend-619167511861.asia-northeast3.run.app/api/auth/google'),
                          headers: {'Content-Type': 'application/json'},
                          body: jsonEncode({'accessToken': accessToken}),
                        );

                        if (response.statusCode == 200) {
                          print("로그인 성공");
                          if (response.statusCode == 200) {
                            final data = jsonDecode(response.body);
                            final token = data['token'];
                            final email = data['email'];
                            final name = data['name'];

                            await _storage.write(key: 'jwt', value: token);
                            await _storage.write(key: 'email', value: email);
                            await _storage.write(key: 'name', value: name);

                            print("환영합니다 $name");

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginUserSelect()),
                            );
                          } else {
                            print("로그인 실패");
                          }
                        } else {
                          print("로그인 실패");
                        }
                      }
                    } catch (e) {
                      print("Google 로그인 중 오류: $e");
                    }
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
                      // 만일 성공한다면 넘어가도록 추후 구현 예정정
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginUserSelect(),
                        ),
                      );
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
                    // 만일 성공한다면 넘어가도록 추후 구현 예정정
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginUserSelect(),
                      ),
                    );
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
