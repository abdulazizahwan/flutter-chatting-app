import 'package:flutter/material.dart';
import 'package:flutter_chatting_app/config.dart';
import 'package:zego_zimkit/services/services.dart';

import 'package:flutter_chatting_app/login_screen.dart';

void main() async {
  await DataManagement.loadEnvFile;

  final appId = await DataManagement.getSecretData(StoredString.appId);
  final appSignKey =
      await DataManagement.getSecretData(StoredString.appSignKey);

  await ZIMKit().init(
    appID: int.parse(appId),
    appSign: appSignKey,
  );

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ZegoChatApp());
}

class ZegoChatApp extends StatelessWidget {
  const ZegoChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZEGOCLOUD InApp Chat',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: 1.0,
        ),
        child: child!,
      ),
      home: const LoginScreen(),
    );
  }
}
