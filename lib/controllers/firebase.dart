import 'package:cloud_firestore/cloud_firestore.dart';

class SavedIdeas {
  CollectionReference ideaToDatabase =
  FirebaseFirestore.instance.collection('lemmikud');

  Future <void> sendIdeaToDatabase(String idea) async {
    ideaToDatabase.add({'activity': idea});
  }
}