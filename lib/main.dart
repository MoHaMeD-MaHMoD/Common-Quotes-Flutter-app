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
      debugShowCheckedModeBanner: false,
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
  final titleController = TextEditingController();
  final autherController = TextEditingController();

  List AllQuotes = [
    BestQuotes(
        title: "لا يهم كم أنت بطيئ طالما أنك لن تتوقف", auther: "ُالبيكي"),
    BestQuotes(title: "أنت نتاج قراراتك وليس ظروفك", auther: "ستيفن كوفي"),
    BestQuotes(
        title: "التاريخ ما هو إلا خرافة يتم الاتفاق عليها",
        auther: "نابليون بونابرت"),
    BestQuotes(title: "ما تزرعه الان فستحصده لاحقا", auther: "لولي داسكال"),
    BestQuotes(title: "البداية هي أهمّ جزء في أيّ عمل.", auther: "أفلاطون"),
    BestQuotes(
        title: "عندما يكون لديك الشجاعة لمتابعة أحلامك فقد تحققها",
        auther: "والت ديزني"),
    BestQuotes(
        title:
            "من العسير على نفسي أن أتصور الجمال غير مقترن بالفضيلة، الجمال الحق والفضيلة الحقة شيئ واحد ",
        auther: "توفيق الحكيم"),
  ];

  addQuotes() {
    setState(() {
      AllQuotes.add(BestQuotes(
          title: titleController.text, auther: autherController.text));
    });
  }

  deleteQuotes(BestQuotes item) {
    setState(() {
      AllQuotes.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: titleController,
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(0, 125, 230, 0.8)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromRGBO(0, 125, 230, 0.8)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Write Your Qoutes ",
                          ),
                        ),
                        TextField(
                          maxLength: 20,
                          controller: autherController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(0, 125, 230, 0.8)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromRGBO(0, 125, 230, 0.8)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Who Say It ?",
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              addQuotes();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Color.fromRGBO(230, 105, 0, 0.8)),
                            ))
                      ]),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Color.fromRGBO(125, 230, 0, 0.8),
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
