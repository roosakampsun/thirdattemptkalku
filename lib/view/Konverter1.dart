import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulaator/shared/menu.dart';




class Konverter1App extends StatefulWidget {

  static const String routeName = '/konverter';

  @override


 _Konverter1AppState createState() => _Konverter1AppState();
}

class _Konverter1AppState extends State<Konverter1App> {



  final TextStyle labelStyle = TextStyle(
    fontSize: 16.0,
  );

  final TextStyle resultStyle = TextStyle(

    fontSize: 25.0,
    fontWeight: FontWeight.w700,

  );

  final List<String> _m66dud = [
    'Meters',
    'Kilometers', // strings of expected values
    'Miles',
  ];

  late double _value; // lisan muutujad kasutatud late, et hiljem deklareerida muutuja
  String _fromM66dud = 'Meters';
  String _toM66dud = 'Kilometers';
  String _results = "";

  final Map<String, int> _m66dudMap = { // mõõtude list
    'Meters': 0,
    'Kilometers': 1,
    'Miles': 2,

  };
 final dynamic _formulas = { // konvertimise valemid
    '0': [1,0.001, 0.00062],
    '1': [1000, 1, 0.62137],
    '2': [1609.34, 1.62137, 1],

  };


// Scaffold not used nor built, do I need it?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: new AppBar(title: Text('Konverter')),

      body: SingleChildScrollView( // kasutatud parameetrit, mis eksisteerib
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Sisesta number',),
              onChanged: (value) { // kui sisestatakse väärtus, mis muutub
                setState(() { // SetState, mida tagastada
                  _value = double.parse(value);
                });
              },

            ),
            SizedBox(height: 25.0),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Algmõõt',
                        style: labelStyle),
                    DropdownButton(
                      items: _m66dud
                          .map((String value) =>
                          DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                         // _fromM66dud = value;
                          _fromM66dud = value.toString();
                        });
                      },
                      value: _fromM66dud,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Teisendatud',
                        style: labelStyle),
                    DropdownButton(
                      items: _m66dud
                          .map((String value) =>
                          DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                         // _toM66dud = _value as String;
                          _toM66dud = value.toString();
                        });
                      },
                      value: _toM66dud,
                    )
                  ],
                ),
              ],

            ),


            MaterialButton(
              minWidth: double.infinity,
              onPressed: _arvuta,
              child: Text('Arvuta',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            SizedBox(height: 25.0),
            Text(_results,
              style: resultStyle,
              textAlign: TextAlign.center,

            ),
          ],


        ),

      ),
    ),
    ); //SimpleScroll
  }


  void _arvuta() {
    print("Konverteeritud");
    print(_value);
    if (_value != 0 && _fromM66dud.isNotEmpty && _toM66dud.isNotEmpty) {
      int? from = _m66dudMap[_fromM66dud];
      int? to = _m66dudMap[_toM66dud];

      var multiplier = _formulas[from.toString()][to];
      setState(() {
        _results = "$_value $_fromM66dud = ${_value * multiplier} $_toM66dud";
      });
    } else {
      setState(() {
        _results = "Palun sisesta number";
      });
    }
  }

}