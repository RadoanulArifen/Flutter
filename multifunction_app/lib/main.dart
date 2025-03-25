import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(), // Set WelcomePage as the initial screen
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MULTIFUNCTION APP")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to the BMI and Calculator App!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20, width: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to HomeScreen when button is pressed
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    CalculatorPage(),
    BMIPage(),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'BMI Calculator'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = "0";
  String currentInput = "";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  buttonPressed(String s) {
    setState(() {
      if (s == "C") {
        output = "0";
        currentInput = "";
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if (s == "+" || s == "-" || s == "*" || s == "/") {
        if (currentInput.isNotEmpty) {
          num1 = double.parse(currentInput);
          currentInput = "";
          operator = s;
        }
      } else if (s == "=") {
        if (operator.isNotEmpty && currentInput.isNotEmpty) {
          num2 = double.parse(currentInput);
          double result = 0;

          switch (operator) {
            case "+":
              result = num1 + num2;
              break;
            case "-":
              result = num1 - num2;
              break;
            case "*":
              result = num1 * num2;
              break;
            case "/":
              result = num1 / num2;
              break;
          }

          output = result.toString();
          currentInput = output;
        }
      } else {
        currentInput += s;
        output = currentInput;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator"), backgroundColor: const Color.fromARGB(255, 68, 72, 74)),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      button("1"),
                      button("2"),
                      button("3"),
                      button("+"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      button("4"),
                      button("5"),
                      button("6"),
                      button("-"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      button("7"),
                      button("8"),
                      button("9"),
                      button("*"),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      button("0"),
                      button("C"),
                      button("="),
                      button("/"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  button(String s) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () => buttonPressed(s),
          child: Text(
            s,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _result = '';
  String _interpretation = '';

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        _result = 'Your BMI is: ${bmi.toStringAsFixed(2)}';
        _interpretation = _getInterpretation(bmi);
        // Add the result to the history
        HistoryScreen.addBMIResult('BMI: ${bmi.toStringAsFixed(2)} - $_interpretation');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid height and weight')),
      );
    }
  }

  String _getInterpretation(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              decoration: const InputDecoration(labelText: 'Height (in cm)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(labelText: 'Weight (in kg)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        _result,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _interpretation,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatefulWidget {
  static final List<String> _bmiHistory = [];

  const HistoryScreen({super.key});

  static void addBMIResult(String result) {
    _bmiHistory.add(result);
  }

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI History'),
      ),
      body: ListView.builder(
        itemCount: HistoryScreen._bmiHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(HistoryScreen._bmiHistory[index]),
            tileColor: const Color.fromARGB(255, 228, 189, 47),
          );
        },
      ),
    );
  }
}
