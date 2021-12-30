import 'package:flutter/material.dart';
import 'package:kalkulaator/controllers/routes.dart';
import 'package:kalkulaator/shared/menu.dart';



  class FirstScreen extends StatefulWidget {
    const FirstScreen({Key? key, required this.title}) : super(key: key);
    @override
  FirstScreenState createState() => FirstScreenState();
    final String title;
  }


  class FirstScreenState extends State<FirstScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(title: Text('Kalkulaator just Sinule ')),
      body: Container(
          decoration: BoxDecoration(

              image: DecorationImage(
        image: AssetImage('assets/arvuti.jpg'),
        fit: BoxFit.cover,
      ))),

    );
  }
}
