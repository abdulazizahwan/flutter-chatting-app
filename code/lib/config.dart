import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StoredString {
  static const String appId = 'appId';
  static const String appSignKey =
      'appSignKey';
}

class DataManagement {
  static get loadEnvFile => dotenv.load(fileName: '.env');

  static getSecretData(String key) => dotenv.env[key];
}

Future<void> copyToClipboard(text) async => await Clipboard.setData(
      ClipboardData(
        text: text.toString(),
      ),
    );
