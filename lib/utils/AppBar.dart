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
          padding: EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0, bottom: 18.0),
          child: Text(
            'Notes',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
