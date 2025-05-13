import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/../widgets/chat_bubble.dart';
import '/provider/chat_api.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Widget> chatWidgets = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final ChatApi api = ChatApi();
  final String userId = "test"; // 임시로 userId를 test로 설정

  void handleUserInput(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      chatWidgets.add(UserBubble(text: text));
    });

    controller.clear();
    scrollToBottom();

    try {
      final String aiReply = await api.sendChat(userId: userId, prompt: text);
      final bool suggestGoal =
          aiReply.contains('goal'); // 우선은 goal이 text 내에 들어간다면 버튼이 나오도록 설정
      setState(() {
        chatWidgets.add(
          AIBubble(
            text: aiReply,
            isgoal: suggestGoal,
            onChoiceSelected: handleUserInput,
          ),
        );
      });
    } catch (e) {
      setState(() {
        chatWidgets.add(
          AIBubble(
            text: 'ERROR',
            isgoal: false,
            onChoiceSelected: (_) {},
          ),
        );
      });
    }
    scrollToBottom();
  }

  void scrollToBottom() {
    // 최신 입력(최신 말풍선)이 발생하면 자연스럽게 가장 아래로
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final today = DateFormat('(E) MMM/d/yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: const Color(0xFFFAF5F2),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.015,
              ),
              child: Text(
                today,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView(
                key: const PageStorageKey<String>('chatListView'),
                controller: scrollController,
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  ...chatWidgets,
                  const Text("recent message", textAlign: TextAlign.center),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.03,
                screenHeight * 0.01,
                screenWidth * 0.03,
                screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Type a message here...",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: handleUserInput,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => handleUserInput(controller.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
