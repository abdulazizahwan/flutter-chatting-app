import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class ChatPopupOptions extends StatefulWidget {
  const ChatPopupOptions({super.key});

  @override
  State<ChatPopupOptions> createState() => _ChatPopupOptionsState();
}

class _ChatPopupOptionsState extends State<ChatPopupOptions> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      position: PopupMenuPosition.under,
      icon: const Icon(Icons.more_vert_rounded),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'New Chat',
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.chat_bubble_2_fill,
              ),
              title: Text(
                'New Chat',
                maxLines: 1,
              ),
            ),
            onTap: () {
              ZIMKit().showDefaultNewPeerChatDialog(context);
            },
          ),
          PopupMenuItem(
            value: 'New Group',
            child: const ListTile(
              leading: Icon(
                CupertinoIcons.group_solid,
              ),
              title: Text(
                'New Group',
                maxLines: 1,
              ),
            ),
            onTap: () {
              ZIMKit().showDefaultNewGroupChatDialog(context);
            },
          ),
          PopupMenuItem(
            value: 'Join Group',
            child: const ListTile(
              leading: Icon(
                Icons.group_add,
              ),
              title: Text(
                'Join Group',
                maxLines: 1,
              ),
            ),
            onTap: () {
              ZIMKit().showDefaultJoinGroupDialog(context);
            },
          )
        ];
      },
    );
  }
}
