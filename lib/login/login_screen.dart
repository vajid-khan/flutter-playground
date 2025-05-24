import 'package:flutter/material.dart';

import 'package:flutter_application_1/login/form.dart';
import 'package:flutter_application_1/components/image.dart';
import 'package:flutter_application_1/components/divider.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/login/social_logins.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _handleSignUp() {
	}

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
                    onPressed: _handleSignUp,
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