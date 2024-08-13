import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Controllers for weight, height in feet, and height in inches
  static final TextEditingController wtController = TextEditingController();
  static final TextEditingController ftController = TextEditingController();
  static final TextEditingController inController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BMIHome(),
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

  // Initialize bgColor with a non-null default value
  Color bgColor = const Color.fromARGB(255, 99, 106, 178);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.blue,
          child: const Text(
            'yourBMI',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Colors.white, // Set text color to white
                  ),
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
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overweight!";
                        bgColor = Colors.red.shade800;
                      } else if (bmi < 18) {
                        msg = "You are Underweight!";
                        bgColor = Colors.blueAccent.shade400;
                      } else {
                        msg = "You are Healthy! Going great!";
                        bgColor = Colors.green.shade400;
                      }
                      setState(() {
                        result = "$msg \n BMI is ${bmi.toStringAsFixed(4)}";
                        if (bmi < 18.5) {
                          bgColor = Colors.blue.shade200;
                        } else if (bmi >= 18.5 && bmi < 25) {
                          bgColor = Colors.green.shade200;
                        } else {
                          bgColor = Colors.red.shade200;
                        }
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required fields!";
                        bgColor = Colors.indigo.shade200; // Reset to default
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set button color to blue
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white), // Set button text color to white
                  ),
                ),
                const SizedBox(height: 21),
                Text(
                  result,
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white, // Set result text color to white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
