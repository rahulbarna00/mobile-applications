import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> movie;

  DetailsPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                movie['image']['original'],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                movie['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                _removeHtmlTags(movie['summary']),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              // Create a text field for each key-value pair
              _buildKeyValueFields(movie),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeyValueFields(Map<String, dynamic> data) {
    List<Widget> widgets = [];

    data.forEach((key, value) {
      if (key != 'image' && key != 'name' && key != 'summary') {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  key,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                // Check if the value is a nested map
                if (value is Map<String, dynamic>)
                  _buildKeyValueFields(value) // Recursively build fields for nested map
                else
                  TextField(
                    controller: TextEditingController(text: value.toString()),
                    readOnly: true,
                    maxLines: null, // Allow multiple lines for longer content
                  ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        );
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  String _removeHtmlTags(String htmlString) {
    // Remove HTML tags from the summary
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}

