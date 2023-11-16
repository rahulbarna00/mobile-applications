import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Notes',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}
