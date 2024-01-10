import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        //textTheme: Typography.whiteMountainView,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.orangeAccent,

        ),
      ),
      home: inputpage(),
    );
  }
}
