import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/../widgets/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Widget> chatWidgets = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void handleUserInput(String text) async {
    if (text.trim().isEmpty) return;

    setState(() {
      chatWidgets.add(UserBubble(text: text));
    });

    controller.clear();
    scrollToBottom();

    final aiReply = await tmpAIResponse(text);

    setState(() {
      chatWidgets.add(
        AIBubble(
          text: aiReply.message,
          isgoal: aiReply.isgoal,
          onChoiceSelected: (choice) {
            // 사용자가 버튼으로 선택한 게 잘 저장되엇는가를 확인
            handleUserInput(choice);
          },
        ),
      );
    });
    scrollToBottom();
  }

  Future<AIResponse> tmpAIResponse(String userInput) async {
    // 임시로!! AI 쪽에서 보내 줄 거...
    await Future.delayed(const Duration(seconds: 1));
    return AIResponse(
      message: "${userInput}라고 사용자가 답을 하였다. 이거슨 AI 답변이시다.",
      isgoal: true, //우선은 다 선택 버튼이 보이도록 설정하였삼!!
    );
  }

  void scrollToBottom() {
    // 최신 입력 (최신 말풍선)이 발생하면 자연스럽게 가장 아래로
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
                        hintText: "Write text",
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

// AI로 받는 메세지 - 백엔드로부터 받아옴 이후 수정 예정!!
class AIResponse {
  final String message;
  final bool isgoal;

  AIResponse({required this.message, required this.isgoal});
}
