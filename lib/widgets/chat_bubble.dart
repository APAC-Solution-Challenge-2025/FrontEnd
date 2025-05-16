import 'package:flutter/material.dart';

// 사용자 말풍선
class UserBubble extends StatelessWidget {
  final String text;

  const UserBubble({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFE8EDDA),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            softWrap: true,
          ),
        ),
      ),
    );
  }
}

// AI 말풍선 + 조건부 yes/no 버튼
class AIBubble extends StatelessWidget {
  final String text;
  final bool isgoal;
  final void Function(String)? onChoiceSelected;

  const AIBubble({
    super.key,
    required this.text,
    this.isgoal = false,
    this.onChoiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로필 이미지
              ClipOval(
                child: Image.asset(
                  'assets/images/AI_profile.png',
                  width: 36,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              // 말풍선
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      text,
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      softWrap: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isgoal)
            Padding(
              padding: const EdgeInsets.only(left: 44.0, top: 8.0),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () => onChoiceSelected?.call('Accept'),
                      child: const Text(
                        'Accept',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  const SizedBox(width: 8),
                  ElevatedButton(
                      onPressed: () => onChoiceSelected?.call('Decline'),
                      child: const Text(
                        'Decline',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
