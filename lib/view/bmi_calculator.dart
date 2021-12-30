import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalkulaator/shared/menu.dart';

class BmiKalkulaator extends StatefulWidget {
  const BmiKalkulaator({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/bmikalkulaator';

  @override
  BmiKalkulaatorState createState() => BmiKalkulaatorState();
}

class BmiKalkulaatorState extends State<BmiKalkulaator> {
  final TextEditingController textHeight = TextEditingController();
  final TextEditingController textWeight = TextEditingController();

  final double fontSize = 18;

  String result = '';
  bool isMetric = true;
  bool isImperial = false;

  double? height; // these are null Null Safety
  double? weight; // these are null
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';
  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    heightMessage = 'Sisesta siia oma pikkus ' +
        ((isMetric) ? 'meetrites! ' : 'tollides! ');
    weightMessage = 'Sisesta siia oma kaal ' + ((isMetric) ? 'kg! ' : 'lbs! ');

    return Scaffold(
      appBar: AppBar(title: Text('BMI Konverter')),
      drawer: MenuDrawer(),
      body: Column(children: [
        ToggleButtons(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('EU', style: TextStyle(fontSize: fontSize)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('US', style: TextStyle(fontSize: fontSize)),
          ),
        ], isSelected: isSelected, onPressed: toggleMeasure),
        TextField(
          controller: textHeight,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: heightMessage),
        ),
        TextField(
          controller: textWeight,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: weightMessage),
        ),
        ElevatedButton(
        child: Text('Arvuta'),
    onPressed: findBMI,
        style: ElevatedButton.styleFrom(
        primary: Colors.purple,

    textStyle: TextStyle(fontSize: fontSize
    )),
    ),
         // child: Text('BMI kalkulaator', style: TextStyle(fontSize: fontSize)),


        Text(result, style: TextStyle(fontSize: fontSize)),
      ]),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }

    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }
void findBMI(){
    double bmi = 0;
    double height = double.tryParse(textHeight.text) ?? 0;
    double weight = double.tryParse(textWeight.text) ?? 0;
    if (isMetric){
      bmi = weight / (height * height);
    }
    else{
      bmi = weight * 703 / (height * height);
    }
    setState(() {
      result = 'Sinu BMI on ' + bmi.toStringAsFixed(2);
    });


}

}
