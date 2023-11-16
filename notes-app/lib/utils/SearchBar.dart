import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    Brightness systemBrightness = MediaQuery.of(context).platformBrightness;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: systemBrightness == Brightness.light ? Colors.white : Colors.white70,
          borderRadius: BorderRadius.circular(28.0), // Set border radius for curvature
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4), // Set shadow color
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 2), // Adjust the offset to control shadow position
            ),
          ],
        ),
        child: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              color: Colors.black87
            ),
            prefixIcon: Icon(Icons.search, color: Colors.black),
            border: InputBorder.none, // Remove the default border
          ),
          onChanged: (value) {
            // Perform search functionality based on the entered text
            // You can filter a list, make an API call, etc.
            print('Search query: $value');
          },
        ),
      ),
    );
  }
}
