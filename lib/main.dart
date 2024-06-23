import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer_timer/pages/SelectCityPage.dart';
import 'package:prayer_timer/pages/homeStart.dart';
import 'package:prayer_timer/pages/loading.dart';
import 'package:prayer_timer/pages/timeCity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.amber,
      title: 'Prayer timer',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/homeStart': (context) => HomeStartPoint(),
        '/timeCity': (context) => TimeCity(),
        '/selectCity': (context) => SelectCity()
      },
    );
  }
}
