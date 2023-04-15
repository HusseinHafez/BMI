import 'package:flutter/material.dart';
import 'package:bmi/size_config.dart';

class SliderContainer extends StatelessWidget {
  final String text;
  final double tall;
  final Function(double x,) onChanged;
  const SliderContainer({Key? key,required this.text,required this.onChanged,required this.tall}) : super(key: key);

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
            tall.toStringAsFixed(1),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: getFont(30),
            ),
          ),
          Slider(
            value: tall,
            onChanged: onChanged,
            activeColor: Colors.white,
            inactiveColor: Colors.black45,
            min: 130,
            max: 250,
          ),
        ],
      ),
    );
  }
}
