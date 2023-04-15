import 'package:bmi/controller/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:bmi/size_config.dart';

class ResultScreen extends StatelessWidget {
  static const routeName='/result_screen';
  const ResultScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final data=ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    final controller=BmiController();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                Color.fromARGB(255, 2, 4, 3),
                Color.fromARGB(255, 75, 98, 112)
              ])),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'MBI',
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: getFont(50)),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Your Information',
              style: TextStyle(
                color: Colors.white,
                fontSize: getFont(50),
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Text(
                  'Gender Icon :',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getFont(30),
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  data['icon'],
                  size: getFont(40),
                  color: Colors.white,
                ),
                const Spacer(),
                Text(
                  'Age :   ${data['age']}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getFont(30),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Weight :  ${data['weight']}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getFont(30),
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  'Tall :   ${data['tall'].toStringAsFixed(1)}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getFont(30),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              'Your BMI',
              style: TextStyle(
                color: Colors.white,
                fontSize: getFont(60),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              controller.getResult( data['weight'],data['tall'])!.toStringAsFixed(2),
              style: TextStyle(
                color: Colors.white,
                fontSize: getFont(40),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              controller.getResultState(),
              style: TextStyle(
                color: Colors.green,
                fontSize: getFont(50),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              controller.getText(),
              style: TextStyle(
                color: Colors.white,
                fontSize: getFont(32),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: getHeight(30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color.fromARGB(255, 97, 97, 97),
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'ReCalculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getFont(30),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
