import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Controllers should be static if you want them to persist across widget rebuilds, otherwise, they should be instance variables.
  static final TextEditingController wtController = TextEditingController();
  static final TextEditingController ftController = TextEditingController();
  static final TextEditingController inController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMIHome(),
    );
  }
}

class BMIHome extends StatefulWidget {
  const BMIHome({super.key});

  @override
  _BMIHomeState createState() => _BMIHomeState();
}

class _BMIHomeState extends State<BMIHome> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          
          height: 100, // Height of the navbar-like background
          width: double.infinity, // Full width of the app bar
          alignment: Alignment.center, // Center the text inside the container
          color: Colors.blueAccent, // Background color for the text
          child: const Text(
            'yourBMI',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
          ),
        ),
        backgroundColor: Colors.transparent, // Make the app bar itself transparent
        elevation: 0, // Remove the shadow under the app bar
      ),
      body: Center(
        child: Container(
          color: Colors.orange,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BMI',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 21),
              TextField(
                controller: MyApp.wtController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Weight in Kgs',
                  prefixIcon: Icon(Icons.line_weight_outlined),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 21),
              TextField(
                controller: MyApp.ftController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Height in ft',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 21),
              TextField(
                controller: MyApp.inController,
                decoration: const InputDecoration(
                  labelText: 'Enter Your Height in inch',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 21),
              ElevatedButton(

                onPressed: () {
                  var wt = MyApp.wtController.text.trim();
                  var ft = MyApp.ftController.text.trim();
                  var inch = MyApp.inController.text.trim();

                  if (wt.isNotEmpty && ft.isNotEmpty && inch.isNotEmpty) {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt * 12) + iInch;

                    var tCm = tInch * 2.54;
                    var tM = tCm / 100;

                    var bmi = iWt / (tM * tM);

                    setState(() {
                      result = "Your BMI is ${bmi.toStringAsFixed(4)}";
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the required fields!";
                    });
                  }
                },
                child: const Text('Calculate'),


              ),
              const SizedBox(height: 21),
              Text(
                result,
                style: const TextStyle(fontSize: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}
