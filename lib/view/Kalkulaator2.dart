import 'package:flutter/material.dart';
import 'package:kalkulaator/shared/menu.dart';


class Kalkulaator2 extends StatefulWidget {
  const Kalkulaator2({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/kalkulaator';

  State<StatefulWidget> createState() => Kalkulaator2State();
}

class Kalkulaator2State extends State<Kalkulaator2> {
  late Future<Kalkulaator2> Kalkulaator2Future;

  //tegevused rakenduses, extends state class

  String output = "0"; // muutuja klass, et saada teksti infot kätte
  String _output = "0"; // muutuja output väärtus
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    // saab testida print käskulusega, kas nupp töötab

    if (buttonText == "C") {
      _output = "0"; // muutuja klass, et saada teksti infot kätte
      double num1 = 0.0;
      double num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);

      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Komaga arv, paranda numbrit!");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      // if (operand == "^"){
      // _output = (num1 ^ num2).toString();
      //}

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget looButton(String buttonText) {
    //step 2, oluline kasutada korduvalt Expanded ruumi, et mitte korrutada sama ja hoiab koodi optimaalsena
    //saan seda widgetit kutsuda korduvalt ning kasutada, sisu on sama mitme nupuga
    return new Expanded(
      child: new TextButton(
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => buttonPressed(buttonText), //lisan ülesande hiljem
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text('Kalkulaator')),
        drawer: MenuDrawer(),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
              child: new Text(output,
                  style: new TextStyle(
                      fontSize: 48.0, fontWeight: FontWeight.bold)),
            ),
            new Expanded(
              child: new Divider(),
            ),
            new Column(children: [
              new Row(children: [
                looButton("7"),
                looButton("8"),
                looButton("9"),
                looButton("/")
              ]),

              new Row(children: [
                looButton("4"),
                looButton("5"),
                looButton("6"),
                looButton("x"),
              ]), // c
              new Row(children: [
                looButton("1"),
                looButton("2"),
                looButton("3"),
                looButton("-")
              ]), // c
              new Row(children: [
                looButton("."),
                looButton("0"),
                looButton("00"),
                looButton("+")
              ]), // c
              new Row(children: [
                looButton("C"),
                looButton("^"),
                looButton("="),
              ]), // children kinni
            ])
          ],
        )));
    // throw UnimplementedError();
  }
}
