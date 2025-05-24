import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_application_1/home/home.dart';
import 'package:flutter_application_1/store/user_store.dart';
import 'package:flutter_application_1/login/login_screen.dart';

GetIt getIt = GetIt.instance;

void main() {
	 SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
    ),
  );

	getIt.registerSingleton<UserStore>(UserStore(),
      signalsReady: true);

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
	final store = GetIt.instance<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        body: store.isLoggedIn ? 	const	 Home() : const LoginScreen(),
      ),
    );
  }
}
