import 'package:bmi/controller/bmi_controller.dart';
import 'package:bmi/view/result_screen.dart';
import 'package:bmi/view/widgets/gender_container.dart';
import 'package:bmi/view/widgets/slider_container.dart';
import 'package:bmi/view/widgets/weight_age_container.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = BmiController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          children:  [
            Text(
              'MBI',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: getFont(50)
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GenderContainer(
                      isActive: controller.isActiveMale,
                      icon: Icons.man,
                      text: 'MALE',
                      onTap: () {
                        setState(() {
                          if (!controller.isActiveMale) {
                            controller.isActiveMale = true;
                            controller.isActiveFemale = false;
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: getWidth(15),
                  ),
                  Expanded(
                    child: GenderContainer(
                      isActive: controller.isActiveFemale,
                      icon: Icons.woman,
                      text: 'FEMALE',
                      onTap: () {
                        setState(() {
                          if (!controller.isActiveFemale) {
                            controller.isActiveMale = false;
                            controller.isActiveFemale = true;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(15),
            ),
            Expanded(
                child: SliderContainer(
              text: 'TALL',
              tall: controller.tall,
              onChanged: (v) {
                setState(() {
                  controller.tall = v;
                });
              },
            )),
            SizedBox(
              height: getHeight(15),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: WeightOrAgeContainer(
                      text: 'AGE',
                      value: controller.age,
                      minusicon: Icons.remove,
                      minusonPressed: () {
                        setState(() {
                          controller.age--;
                        });
                      },
                      plusicon: Icons.add,
                      plusonPressed: () {
                        setState(() {
                          controller.age++;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: getWidth(15),
                  ),
                  Expanded(
                    child: WeightOrAgeContainer(
                      text: 'WEIGHT',
                      value: controller.weight,
                      minusicon: Icons.remove,
                      minusonPressed: () {
                        setState(() {
                          controller.weight--;
                        });
                      },
                      plusicon: Icons.add,
                      plusonPressed: () {
                        setState(() {
                          controller.weight++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(ResultScreen.routeName,arguments: {
                    'age':controller.age,
                    'weight':controller.weight,
                    'tall':controller.tall,
                    'icon':controller.isActiveMale?Icons.man:Icons.woman,
                  });
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
                child:  Text('Calculate',style: TextStyle(
                  color: Colors.white,
                  fontSize: getFont(30),
                  fontStyle:FontStyle.italic,
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
