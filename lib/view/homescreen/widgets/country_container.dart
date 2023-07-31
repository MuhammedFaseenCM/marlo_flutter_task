import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/constants.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';

class CountryContainer extends StatelessWidget {
  final String image;
  final String amount;
  final String currency;
  const CountryContainer({super.key, required this.image, required this.amount, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.all(10.0),
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
          color: kWhite, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.0,
            child: Image.asset(image),
          ),
          kHeight20,
           Text(
            amount,
            style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
           Text(
           currency,
            style: const TextStyle(color: Color.fromARGB(255, 168, 166, 166)),
          )
        ],
      ),
    );
  }
}
