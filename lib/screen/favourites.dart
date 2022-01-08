import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalkulaator/shared/menu.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);
  static const String routeName = '/favourites';

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final Future<QuerySnapshot> ideas =
  FirebaseFirestore.instance.collection('lemmikud').get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text('Lemmikud ideed'),
      ),
      body: Container(
        child: Stack(
          children: [

            Container(
              child: FutureBuilder<QuerySnapshot>(
                future: ideas,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading');
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                '${data.docs[index]['activity']}',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor: Colors.white.withOpacity(0.8)),

                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}