import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:lifecycle/screen_2.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 3"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/gifs/bouncing.gif'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => const Screen2(),
                  ),
                );
              },
              child: Text(
                "Go Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                double res = task1();
                debugPrint('Result 1: $res');
              },
              child: Text(
                "Task 1",
                style: TextStyle(color: Colors.white),
              ),
            ),
            //Isolate
            ElevatedButton(
              onPressed: () {
                final recievePort = ReceivePort();
                Isolate.spawn(task2, recievePort.sendPort);
                recievePort.listen((total) {
                  debugPrint('Result 2: $total');
                });
              },
              child: Text(
                "Task 2",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double task1() {
    double total = 0;
    for (double i = 0; i < 1000000000; i++) {
      total += 1;
    }
    return total;
  }
}
//Class Ends

task2(SendPort sendPort) {
  double total = 0;
  for (double i = 0; i < 1000000000; i++) {
    total += 1;
  }
  sendPort.send(total);
}
