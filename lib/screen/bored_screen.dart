import 'package:flutter/material.dart';
import 'package:kalkulaator/controllers/bored_api.dart';
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

class RecipeScreenState extends State<RecipeScreen> {
  late Future<Bored> futureIdea;

  @override
  void initState() {
    super.initState();
    futureIdea = getNewIdea();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(title: Text('Parim igavuse peletaja ')),
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bored.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: FutureBuilder<Bored>(
                    future: futureIdea,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data!.newIdea,
                          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white.withOpacity(0.8)),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureIdea = getNewIdea();
                      });
                    },
                    child: Text('Lae uus idee')),

              ],
            ),
          ],
        ),
      ),
    );
  }
}