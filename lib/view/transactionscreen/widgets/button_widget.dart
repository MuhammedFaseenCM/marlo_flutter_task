import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/constants.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isTscreen;
  final dynamic function;
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.isSelected,
      this.isTscreen = false,
      this.function});

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
      child: isTscreen
          ? Row(
              children: [
                Text(text, style: const TextStyle(color: kBlue)),
                kWidth10,
                InkWell(
                    onTap: function,
                    child: const Icon(
                      Icons.close,
                      color: kBlue,
                    ))
              ],
            )
          : Text(text, style: const TextStyle(color: kBlue)),
    );
  }
}
