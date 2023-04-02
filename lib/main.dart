import 'package:coin_rich/home.dart';
import 'package:coin_rich/providers/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(255, 255, 255, 0), // status bar color
  ));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          return AppState();
        },
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
          )),
      home: const HomeScreen(title: 'CoinRich'),
    );
  }
}
