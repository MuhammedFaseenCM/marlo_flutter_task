import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';

class AmountContainer extends StatelessWidget {
  final String text;
  final num amount;
  const AmountContainer({super.key, required this.text, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: kprimary, borderRadius: BorderRadius.circular(10.0)),
      width: MediaQuery.sizeOf(context).width / 2.5,
      height: 50.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 10.0),
          ),
          Text(amount.toString(), style: const TextStyle(fontSize: 10.0))
        ],
      ),
    );
  }
}
