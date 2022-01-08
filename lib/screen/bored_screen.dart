import 'package:flutter/material.dart';
import 'package:kalkulaator/controllers/bored_api.dart';
import 'package:kalkulaator/shared/menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  CollectionReference ideaToDatabase =
      FirebaseFirestore.instance.collection('lemmikud');

  @override
  void initState() {
    super.initState();
    futureIdea = getNewIdea();
  }

  Future<void> sendIdeaToDatabase(idea) async {
    await ideaToDatabase.add({'activity': idea});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(title: Text('Parim igavuse peletaja ')),
      body: FutureBuilder<Bored>(
        future: futureIdea,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
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
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data!.newIdea,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white.withOpacity(0.8)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              futureIdea = getNewIdea();
                            });
                          },
                          child: Text('Lae uus idee'),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              sendIdeaToDatabase(snapshot.data!.newIdea);
                            },
                            child: Text('Salvesta idee')),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
