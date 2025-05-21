import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/components/divider.dart';
import 'package:flutter_application_1/components/image.dart';
import 'package:flutter_application_1/login/form.dart';
import 'package:flutter_application_1/login/social_logins.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          secondary: Colors.grey,
        ),
        primaryColor: Colors.black,
        primaryColorDark: Colors.grey,
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _handleSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BBImage(size: 200, url: 'assets/bb_icon.png'),
                  const LoginForm(),
                  const BBDivider(size: 100),
                  BBButton(
                    onPressed: _handleSubmit,
                    text: 'Sign Up',
                    isPrimary: false,
                  ),
                  const BBDivider(size: 100),
                  const SocialLogins(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
