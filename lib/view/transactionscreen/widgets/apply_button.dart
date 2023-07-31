import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';

class ApplyCancelButton extends StatelessWidget {
  
  final bool apply;
  const ApplyCancelButton(
      {super.key, required this.apply});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: apply ? kBlue : kBlue.withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            apply ? "Apply" : "Cancel",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: apply ? kWhite : kBlue),
          ),
        ),
      ),
    );
  }
}
