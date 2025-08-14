import 'package:flutter/material.dart';
import 'package:myanimationavator/home_page.dart';
import 'package:myanimationavator/sharedPreference_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp( {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(prefs: SharedpreferenceHelper()),
      debugShowCheckedModeBanner: false,
    );
  }
}

