import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulaator/screen/favourites.dart';
import 'package:kalkulaator/screen/first_screen.dart';
import 'package:kalkulaator/screen/bored_screen.dart';
import 'package:kalkulaator/view/Kalkulaator2.dart';
import 'package:kalkulaator/view/Konverter1.dart';


import 'package:kalkulaator/controllers/routes.dart';
import 'package:kalkulaator/view/bmi_calculator.dart';


void main()  {
  //WidgetsFlutterBinding.ensureInitialized();
  //await FirebaseCoreApi.init();
  //await Firebase.initializeApp(); // siit tuleb alati global package kaasa
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //Muutumatu osa!!

  static const Color primaryColor = Color(0xFF69F0AE);

@override
  Widget build(BuildContext context) {
         return MaterialApp(
           home: FirstScreen(title: 'FirstScreen',),
         theme: ThemeData(
             appBarTheme: AppBarTheme(
               color: primaryColor,
             ),
           primaryColor: primaryColor
         ),
         routes: {
             routes.kalkulaator:(context) => Kalkulaator2(),
           routes.konverter:(context) => Konverter1App(),
           routes.bmikalkulaator:(context) => BmiKalkulaator(),
           routes.igavusepeletaja:(context) => RecipeScreen(),
           routes.favourites:(context) => FavouritesPage(),


         }


         );


  }

 }
