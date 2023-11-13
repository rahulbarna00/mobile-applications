import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Notes',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        IconButton(
          onPressed: () {},
          padding: const EdgeInsets.all(0),
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25)),
            child: const Icon(
              Icons.sunny,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
