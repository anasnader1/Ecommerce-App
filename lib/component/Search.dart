import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

class Search extends SearchDelegate<String> {
  List quotes = [];
  String author = "";
  String result = "";

  Search({
    required this.author,
  });

  Future<List<dynamic>> getPost() async {
    final response = await http.get(Uri.https('type.fit', 'api/quotes'));
    return postFromJson(response.body);
  }

  List<dynamic> postFromJson(String str) {
    List<dynamic> jsonData = json.decode(str);
    quotes = jsonData.toList();
    print("shet");
    return jsonData;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, result);
        print("tangina");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestions = quotes.where((quotes) {
      return quotes.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
          onTap: () {
            result = suggestions.elementAt(index);
            close(context, result);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = quotes.where((quotes) {
      return quotes.toLowerCase().contains(query.toLowerCase());
    });

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            suggestions.elementAt(index),
          ),
          onTap: () {
            query = suggestions.elementAt(index);
          },
        );
      },
    );
  }
}
class QuoteModel {
  String? text;
  String? author;

  QuoteModel({required this.text, required this.author});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['author'] = this.author;
    return data;
  }
}
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class Quote {
  final String author;
  final String text;

  Quote({required this.author, required this.text});
}

class _ListPageState extends State<ListPage> {
  Future<List<dynamic>> getPost() async {
    final response = await http.get(Uri.https('type.fit', 'api/quotes'));
    return postFromJson(response.body);
  }

  List<dynamic> postFromJson(String str) {
    List<dynamic> jsonData = json.decode(str);
    List quotes = jsonData.toList();
    print(quotes[0]);
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff171717),
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final result = await showSearch<String>(
                  context: context,
                  delegate: Search(author: ""),
                );

                print(result);
              },
            )
          ],
        ),
        body: Container(
          color: Color(0xff171717),
          child: FutureBuilder(
            future: getPost(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  print(snapshot);
                  return ErrorWidget(snapshot);
                }
                return ListView.separated(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    var model = snapshot.data![index];
                    return ListTile(
                      leading: Icon(Icons.format_quote),
                      title: Text(
                        model["text"].toString(),
                      ),
                      subtitle: Text(
                        model["author"].toString(),
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                );
              } else
                return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
