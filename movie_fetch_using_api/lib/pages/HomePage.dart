import 'package:flutter/material.dart';
import 'package:flutter_quadb_tech/pages/DetailsPage.dart';
import 'package:flutter_quadb_tech/pages/SearchPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> movies = [];
  bool isLoading = true; // Track whether data is loading or not
  bool isSearchVisible = false; // Track whether search content is visible

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.tvmaze.com/search/shows?q=all'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          movies = List<Map<String, dynamic>>.from(responseData);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Movies')), // Set the title of the AppBar
      ),
      body: Stack(
        children: [
          // Content above the bottom navigation bar
          Visibility(
            visible: !isSearchVisible,
            child: isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                var movie = movies[index]['show'];

                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                      movie['image']['medium'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(movie['name']),
                    subtitle: Text(
                      _removeHtmlTags(movie['summary']),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(movie: movie),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // Search Page Content
          Visibility(
            visible: isSearchVisible,
            child: SearchPage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          )
        ],
        onTap: (index) {
          setState(() {
            isSearchVisible = index == 1;
          });
        },
        selectedItemColor: Colors.black, // Set the selected item color to white
        unselectedItemColor: Colors.black, // Set the unselected item color to grey
      ),
    );
  }

  String _removeHtmlTags(String htmlString) {
    // Remove HTML tags from the summary
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }
}
