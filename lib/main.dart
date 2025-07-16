import 'dart:math';

import 'package:flutter/material.dart';

import 'info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TODO 2: Declare local variable
  double _bmi = 0.0;
  double _weight = 0.0;
  double _height = 0.0;
  String _bmiOutput='';
  String _bmiImage = 'assets/images/empty.png';
  final TextEditingController _weightCtrl = TextEditingController();
  final TextEditingController _heightCtrl = TextEditingController();

  //TODO 3: Calculate BMI value
  void _calculateBMI() {
    _weight = double.tryParse(_weightCtrl.text)!;
    _height = double.tryParse(_heightCtrl.text)!;
    setState(() {
      _bmi = _weight / pow(_height/100, 2);
      if (_bmi < 18.5) {
        _bmiImage = 'assets/images/under.png';
        _bmiOutput = '${_bmi.toStringAsFixed(2)} [Underweight]';
      }else if(_bmi >=25 ){
        _bmiImage = 'assets/images/over.png';
        _bmiOutput = '${_bmi.toStringAsFixed(2)} [Overweight]';
      }else{
        _bmiImage = 'assets/images/normal.png';
        _bmiOutput = '${_bmi.toStringAsFixed(2)} [Normal]';
      }
    });
  }

  //TODO 4: Reset all widgets
  void _resetScreen(){
    _weightCtrl.clear();
    _heightCtrl.clear();
    setState(() {
      _bmi = 0.0;
      _bmiOutput = '';
      _bmiImage = 'assets/images/empty.png';
    });
  }

  //TODO 5: Override the dispose method
  @override
  void dispose() {
    super.dispose();
    _weightCtrl.dispose();
    _heightCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 6: set resize of screen to avoid overflow issue
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        //TODO 7: Insert a Padding widget
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO 8: Insert Stack with image and text
              Stack(
                fit: StackFit.loose,
                alignment: AlignmentDirectional.center,
                children: [
                  //TODO 9: Insert two containers
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      _bmiImage,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    alignment: Alignment.center,
                    child: _bmi==0.0 ? const Text(
                      textAlign: TextAlign.center,
                      'Enter body weight and height to know your Body Mass Index (BMI)',
                      style: TextStyle(fontSize: 12, color: Colors.orange, ),
                    ): const Text(''),
                  ),
                ],
              ),
              //TODO 10: Insert text widget showing BMI status
              const Text(
                'You Body Mass Index (BMI) is :',
              ),
              Text(
                _bmiOutput,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              //TODO 11: Insert TextField and Button
              TextField(
                controller: _weightCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter weight (kg)',
                ),
              ),
              TextField(
                controller: _heightCtrl,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter height (cm)',
                ),
              ),

              //Insert an IconButton


              const Expanded(child: SizedBox(height: double.infinity,),),
              IconButton(
                icon: const Icon(Icons.info),
                color: Colors.orangeAccent, iconSize: 48,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Info(bmi: _bmiOutput)),
                  );
                },
              ),
              //TODO 13: Insert reset and calculate buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _resetScreen, child: const Text('Reset')),
                  const SizedBox(width: 8.0,),
                  ElevatedButton(
                      onPressed: _calculateBMI, child: const Text('Calculate')),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
