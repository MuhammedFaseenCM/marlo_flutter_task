import 'package:flutter/material.dart';
import 'package:marlo_flutter_task/view/mainscreen/widgets/custom_color.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Icon(Icons.search, size: 80.0),
          Text(
            "No results found",
            style: TextStyle(color: kGrey),
          )
        ],
      ),
    );
  }
}
