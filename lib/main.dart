import 'package:esayapp/constants/Theme.dart';
import 'package:esayapp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.green,
        systemNavigationBarDividerColor: Colors.blue,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ezåy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Ezåy (Control devices anywhere)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorScreen,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Home(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
