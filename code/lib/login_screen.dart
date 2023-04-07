import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chatting_app/home_screen.dart';
import 'package:zego_zimkit/services/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  void changeSystemNavigationAndStatusBarColor(
          {Color navigationBarColor = Colors.white,
          Color statusBarColor = Colors.transparent,
          Brightness? statusIconBrightness = Brightness.dark,
          Brightness? navigationIconBrightness = Brightness.dark}) =>
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: navigationBarColor,
          statusBarColor: statusBarColor,
          statusBarIconBrightness: statusIconBrightness,
          systemNavigationBarIconBrightness: navigationIconBrightness,
        ),
      );

  @override
  void initState() {
    changeSystemNavigationAndStatusBarColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://mms.businesswire.com/media/20230201005055/en/1700614/22/color_cropped.jpg',
            ),
            TextFormField(
              controller: _userNameController,
              cursorColor: const Color(0xff424242),
              decoration: InputDecoration(
                enabledBorder: _border,
                focusedBorder: _border,
                border: _border,
                filled: true,
                hintText: 'Username',
                fillColor: const Color(0xfff3f2f2),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _phoneNumberController,
              cursorColor: const Color(0xff424242),
              decoration: InputDecoration(
                enabledBorder: _border,
                focusedBorder: _border,
                border: _border,
                filled: true,
                hintText: 'Phone Number',
                fillColor: const Color(0xfff3f2f2),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 17,
                  horizontal: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            _zegoButton('Log In', () async {
              await ZIMKit().connectUser(
                id: _phoneNumberController.text,
                name: _userNameController.text,
              );

              if (!mounted) return;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      HomeScreen(phoneNumber: _phoneNumberController.text),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  _zegoButton(String btnLabel, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0155fe),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
      ),
      child: Text(
        btnLabel,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  get _border => OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(
          color: const Color(0xff424242).withOpacity(0.2),
          width: 1,
        ),
      );
}
