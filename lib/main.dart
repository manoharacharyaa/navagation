import 'package:flutter/material.dart';
import 'package:lifecycle/screen_1.dart';

void main() {
  runApp(const LifeCycle());
}

class LifeCycle extends StatelessWidget {
  const LifeCycle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(),
        appBarTheme: AppBarTheme(centerTitle: true),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.deepPurple,
            ),
          ),
        ),
      ),
      home: const Screen1(),
    );
  }
}
