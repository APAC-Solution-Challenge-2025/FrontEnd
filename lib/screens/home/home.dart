import 'package:flutter/material.dart';
import '../../widgets/layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reportMainPage');
              },
              child: const Text('Go to report main page'),
            ),
          ],
        ),
      ),
    );
  }
}