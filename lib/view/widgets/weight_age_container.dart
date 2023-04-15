import 'package:flutter/material.dart';
import 'package:bmi/size_config.dart';

class WeightOrAgeContainer extends StatelessWidget {
  final String text;
  final int value;
  final IconData plusicon;
  final IconData minusicon;
  final Function() plusonPressed;
  final Function() minusonPressed;

  const WeightOrAgeContainer({
    Key? key,
    required this.text,
    required this.value,
    required this.minusicon,
    required this.minusonPressed,
    required this.plusicon,
    required this.plusonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 97, 97, 97),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: getFont(30),
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: getFont(30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: plusonPressed,
                icon: Icon(
                  plusicon,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: minusonPressed,
                icon: Icon(
                  minusicon,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
