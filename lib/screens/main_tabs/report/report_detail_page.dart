import 'package:flutter/material.dart';

class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('report detail'),
      ),
      body: const Center(
        child: Text('This is Page detail'),
      ),
    );
  }
}