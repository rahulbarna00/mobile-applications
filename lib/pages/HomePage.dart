import 'package:flutter/material.dart';
import 'package:my_notes_app/utils/SearchBar.dart';
import '../utils/AppBar.dart';
import '../utils/NotesView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            CustomSearchBar(),
            Expanded(child: NotesView()),
          ],
        ),
      ),
    );
  }
}
