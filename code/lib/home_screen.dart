import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/config.dart';
import 'package:zego_zimkit/compnents/compnents.dart';
import 'package:zego_zimkit/pages/pages.dart';

import 'package:flutter_chatting_app/chat_popup_options.dart';

class HomeScreen extends StatefulWidget {
  final String phoneNumber;

  const HomeScreen({super.key, required this.phoneNumber});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0155fe),
        elevation: 0,
        title: const Text('Chats and Groups'),
        actions: const [
          ChatPopupOptions(),
        ],
      ),
      body: Column(
        children: [
          _topSection(),
          _chatListSection(),
        ],
      ),
    );
  }

  _topSection() {
    return InkWell(
      onTap: () {
        copyToClipboard(widget.phoneNumber);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Copy to Clipboard'),
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        alignment: Alignment.center,
        child: Text(
          'Phone Number: ${widget.phoneNumber}',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  _chatListSection() {
    return Expanded(
      child: ZIMKitConversationListView(
        onPressed: (context, consersation, defaultAction) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ZIMKitMessageListPage(
                conversationID: consersation.id,
                conversationType: consersation.type,
              ),
            ),
          );
        },
      ),
    );
  }
}
