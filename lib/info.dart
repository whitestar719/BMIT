import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String bmi;
  const Info({super.key,required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOdy Mass Index Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Body mass index (BMI) is a value derived from'
                'the mass (weight) and height of a person.'),
            Table(
              border: TableBorder.all(color: Colors.orangeAccent),
              children:const [
                TableRow(
                  children: [
                    TableCell(child: Text('BMI Value',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)
                      ,)
                    ),
                    TableCell(child: Text('Classification',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold)
                      ,)
                    )
                  ]
                ),
                TableRow(
                  children: [
                    TableCell(
                        child: Text(
                          'Below 18.5',
                          textAlign: TextAlign.center,)),
                    TableCell(
                        child: Text(
                          'Underweight',
                          textAlign: TextAlign.center,))
                  ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text(
                            '18.5 - 24.9',
                            textAlign: TextAlign.center,)),
                      TableCell(
                          child: Text(
                            'Normal',
                            textAlign: TextAlign.center,))
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text(
                            'Above 18.5',
                            textAlign: TextAlign.center,)),
                      TableCell(
                          child: Text(
                            'Overweight',
                            textAlign: TextAlign.center,))
                    ]
                )
              ],
            ),
            bmi == '' ? Text('Please enter your weight and height.'):
              Text('Your BMI is :$bmi'),
                Expanded(child: SizedBox(height: 8.0,)),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                },child: Text('Go Back'),)
          ],
        ),),
    );
  }
}
