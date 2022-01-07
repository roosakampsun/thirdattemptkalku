import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);
  static const String routeName = '/favourites';
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  

  @override
  Widget build(BuildContext context) {
    var controller;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: FutureBuilder<List<String>?>(
                future: controller.getStringList("activity"),
                builder: (BuildContext context, AsyncSnapshot<List<String>?> snapshot) {
                  List<Widget> rows = [];
                  if (snapshot.hasData) {
                    int counter = 1;
                    rows = snapshot.data!.map((activity) {
                      String text = counter.toString() + ". " + activity;
                      counter++;
                      return Text(text);
                    }).toList();
                  }

                  return Column(
                    children: rows,
                  );
                },
              )),
        ),
      ),
    );
  }
}