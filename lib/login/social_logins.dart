import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/image.dart';

final List<Map<String, String>> _socialLogins = [
  {'title': 'Google', 'icon': "assets/google.png"},
  {'title': 'Apple', 'icon': "assets/apple-logo.png"},
  {'title': 'Facebook', 'icon': "assets/facebook.png"},
  {'title': 'Microsoft', 'icon': "assets/microsoft.png"},
  {'title': 'Twitter', 'icon': "assets/twitter.png"},
];

class SocialLogins extends StatelessWidget {
  const SocialLogins({super.key});

  void _handlePressed(String title) {
    // TODO: Implement social login
    print('Pressed $title login');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            _socialLogins.map((login) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton.icon(
                  onPressed: () => _handlePressed(login['title']!),
                  icon: BBImage(size: 24, url: login['icon']!),
                  label: Text(login['title']!),
                  iconAlignment: IconAlignment.start,
                ),
              );
            }).toList(),
      ),
    );
  }
}
