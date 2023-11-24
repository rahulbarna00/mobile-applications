import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_quadb_tech/pages/DetailsPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> searchResults = [];
  bool isLoading = false;

  Future<void> searchShows(String searchTerm) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://api.tvmaze.com/search/shows?q=$searchTerm'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          searchResults = List<Map<String, dynamic>>.from(responseData);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to search shows');
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white, // Set the background color to white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          String searchTerm = _searchController.text;
                          if (searchTerm.isNotEmpty) {
                            searchShows(searchTerm);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          var show = searchResults[index]['show'];

                          return Card(
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.network(
                                show['image']['medium'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(show['name']),
                              subtitle: Text(
                                _removeHtmlTags(show['summary']),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(movie: show),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _removeHtmlTags(String htmlString) {
    // Remove HTML tags from the summary
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _searchController.dispose();
    super.dispose();
  }
}
