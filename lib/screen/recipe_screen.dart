import 'package:flutter/material.dart';
import 'package:kalkulaator/controllers/routes.dart';
import 'package:kalkulaator/shared/menu.dart';



class RecipeScreen extends StatefulWidget {
  const RecipeScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/retseptid';
  @override
  RecipeScreenState createState() => RecipeScreenState();

}


class RecipeScreenState extends State<RecipeScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(title: Text('Parimad retseptid ')),
      body: Container(
          decoration: BoxDecoration(

              image: DecorationImage(
                image: AssetImage('assets/food.jpg'),
                fit: BoxFit.cover,
              ))),

    );
  }
}