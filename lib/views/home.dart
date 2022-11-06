import 'package:dictionary/views/meaning.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  TextEditingController searchController = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
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
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color(0xfff5f8fd),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "Search Meaning of word",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Search(
                                    searchquery: searchController.text,
                                  ))));
                    },
                    child: Container(
                      child: Icon(Icons.search),
                    ),
                  ),
                  // )
                ],
              ),
            ),
          ],
        ));
  }
}
