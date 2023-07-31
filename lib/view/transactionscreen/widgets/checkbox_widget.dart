import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final String countryCode;
  final String moneyType;
  final String flag;
  const CheckBoxWidget(
      {super.key, required this.countryCode, required this.moneyType, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        Expanded(
          child: ListTile(
            leading:  CircleAvatar(
              radius: 20.0,
              child: Image.asset(flag),
            ),
            title: Text(
              countryCode,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(moneyType),
          ),
        )
      ],
    );
  }
}
