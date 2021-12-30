import 'package:flutter/material.dart';
import 'package:kalkulaator/screen/first_screen.dart';
import 'package:kalkulaator/view/Kalkulaator2.dart';
import 'package:kalkulaator/view/Konverter1.dart';
import 'package:kalkulaator/controllers/routes.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: MenuDrawer(),
      appBar: AppBar(title: Text('Kalkulaator just Sinule ')),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
        image: AssetImage('assets/arvuti.jpg'),
        fit: BoxFit.cover,
      ))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text('Kalkulaatorid'),
            ),
            ListTile(
              title: const Text('Kalkulaator'),
              onTap: () {
                Navigator.pushReplacementNamed(context, routes.kalkulaator);
              },
            ),
            ListTile(
              title: const Text('Km Konverter'),
              onTap: () {
                Navigator.pushReplacementNamed(context, routes.konverter);
              },
            ),
            ListTile(
              title: const Text('Bmi Kalkulaator'),
              onTap: () {
                Navigator.pushReplacementNamed(context, routes.bmikalkulaator);
              },
            ),
          ],
        ),
      ),
    );
  }
}
