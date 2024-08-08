import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final wtController = TextEditingController();
  static final ftController = TextEditingController();
  static final inController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.all(20.0), // Optional: add some padding
            color: Colors.blueAccent, // Background color for the text
            child: const Text(
              'yourBMI',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const Text(
              'BMI',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700,),
            ),
            TextField(
              controller: wtController,
              decoration: const InputDecoration(
                label: Text('Enter Your Weight in Kgs'),
                prefixIcon: Icon(Icons.line_weight_outlined),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: ftController,
              decoration: const InputDecoration(
                label: Text('Enter Your Height in ft'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 11),
            TextField(
              controller: inController,
              decoration: const InputDecoration(
                label: Text('Enter Your height in inch'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
