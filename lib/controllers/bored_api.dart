import 'dart:convert';
import 'package:http/http.dart' as http;

//model
class Bored {
  final String newIdea;

  Bored({required this.newIdea});

  factory Bored.fromJson(Map<String, dynamic> json) {
    return Bored(
        newIdea: json['activity']
    );
  }
}


Future<Bored> getNewIdea() async {
  final ideaReply = await http.get(Uri.parse('https://www.boredapi.com/api/activity?participants=1'));
  if (ideaReply.statusCode == 200){
    return Bored.fromJson(jsonDecode(ideaReply.body));
  }
  else {
    throw Exception('Unable to load idea');
  }
}
