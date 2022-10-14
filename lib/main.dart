import 'package:flutter/material.dart';
import 'package:lorache/home.dart';
import 'package:lorache/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

// TODO BORRAR SI NO SE USA
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  //runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShowPerDay(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF69D0F6),
        primaryColor: Colors.lightBlue[800],
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
