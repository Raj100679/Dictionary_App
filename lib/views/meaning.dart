import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchquery;

  var partOfSpeech;
  var meaning;

  Search({required this.searchquery});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool loading = false;
  @override
  getSearchedMeaning(String searchquery) async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.dictionaryapi.dev/api/v2/entries/en/$searchquery"));
      // Map<String, dynamic> jsonData = jsonDecode(response.body);
      // print(jsonData[0]['meanings'][0]["definitions"][0]["definition"]);
      var jsonData = jsonDecode(response.body.toString());
      // print(jsonData[0]['meanings'][0]["definitions"][0]["definition"][0]);

      widget.partOfSpeech = jsonData[0]['meanings'][0]["partOfSpeech"];
      widget.meaning =
          jsonData[0]['meanings'][0]["definitions"][0]["definition"];
      print(widget.meaning);
    } catch (e) {
      searchquery = searchquery == "" ? "No Word Recieved" : searchquery;
      widget.partOfSpeech = "NA";
      widget.meaning = "NA";
      print("HI");
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loading = true;
    getSearchedMeaning(widget.searchquery);
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    double c = MediaQuery.of(context).size.width * .8;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "My",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Dictionary",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        // Sized
      ),
      body: loading
          ? Center(
              child: Container(
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    widget.searchquery,
                    style: const TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Part Of Speech: ",
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        widget.partOfSpeech,
                        style: const TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    "Meaning: ",
                    style: TextStyle(fontSize: 22.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    widget.meaning,
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
