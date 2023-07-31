import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/controller/provider/home_provider.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  const ButtonWidget({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(82, 64, 195, 255) : kWhite,
          borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        text,
        style: const TextStyle(color: kBlue),
      ),
    );
  }
}
