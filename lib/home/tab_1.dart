import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_application_1/components/image.dart';
import 'package:flutter_application_1/store/user_store.dart';

class Tab1 extends StatelessWidget {
  Tab1({super.key});

  final store = GetIt.instance<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Observer(
        builder:
            (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      BBImage(
                        size: 100,
                        url: store.user['avatar_urls']['96'],
                        isNetwork: true,
                        borderRadius: 100,
                      ),
											const SizedBox(width: 16),
                      Text(
                        'Welcome ${store.isLoggedIn ? store.user['name'] : ''}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      store.logout();
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
