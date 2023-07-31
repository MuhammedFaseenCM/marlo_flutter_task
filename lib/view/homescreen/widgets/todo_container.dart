import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';

class ToDoContainer extends StatelessWidget {
  final List<Color> colors;
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  const ToDoContainer(
      {super.key,
      required this.colors,
      required this.text,
      required this.bgColor,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 130.0,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            radius: 25.0,
            child: Icon(
              icon,
              color: iconColor,
              size: 30.0,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
