import 'package:flutter/material.dart';
import 'package:bmi/size_config.dart';

class GenderContainer extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;
  final bool isActive;
  const GenderContainer({Key? key,required this.isActive,required this.text,required this.icon,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive?const Color.fromARGB(255, 66, 66, 66) :const Color.fromARGB(255, 97, 97, 97),
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
            Icon(icon,size: getFont(80),color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
