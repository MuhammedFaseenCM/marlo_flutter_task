import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  final String text;
  const DefaultScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child:  Center(
        child: Column(
          children: [
         const   Icon(
              Icons.chat_bubble,
              size: 20.0,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
