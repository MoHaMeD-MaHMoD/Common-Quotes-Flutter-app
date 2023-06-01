// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotes/widget/cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class BestQuotes {
  String title;
  String auther;
  BestQuotes({required this.title, required this.auther});
}

class _QuotesState extends State<Quotes> {
  List AllQuotes = [
    BestQuotes(title: "الهم اشتكا منينا ", auther: "beaky"),
    BestQuotes(title: "الهم اشتكا منينا ", auther: "54"),
    BestQuotes(title: "الهمsdf اشتكا منينا ", auther: "beasdfky"),
    BestQuotes(title: "sdf اشتكا منينا ", auther: "beasdfky"),
    BestQuotes(title: "الهم اشتكا منينا ", auther: "beaky"),
    BestQuotes(title: "الهم اشتكا منينا ", auther: "54"),
    BestQuotes(title: "الهمsdf اشتكا منينا ", auther: "beasdfky"),
    BestQuotes(title: "sdf اشتكا منينا ", auther: "beasdfky"),
  ];

  addQuotes() {}
  deleteQuotes(BestQuotes item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromRGBO(115, 0, 62, 0.8),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(115, 0, 62, 0.8),
        title: Text(
          "Best Quotes",
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: AllQuotes.map(
                  (item) => CardWidget(item: item, deleteQuotes: deleteQuotes))
              .toList(),
        ),
      ),
    );
  }
}



/*
Card(
            color: Color.fromRGBO(230, 0, 125, 0.8),
            margin: EdgeInsets.all(11),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: Container(
              padding: EdgeInsets.all(11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("رايق  ",
                      style: TextStyle(fontSize: 33, color: Colors.white),
                      textDirection: TextDirection.rtl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        iconSize: 27,
                        color: Color.fromARGB(255, 255, 217, 217),
                      ),
                      Text("ali 7assan",
                          style: TextStyle(fontSize: 19, color: Colors.white),
                          textDirection: TextDirection.rtl),
                    ],
                  ),
                ],
              ),
            ),
          ),
*/