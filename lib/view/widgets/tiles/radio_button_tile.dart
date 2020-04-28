import 'package:custom_radio_grouped_button/CustomButtons/CustomCheckBoxGroup.dart';
import 'package:custom_radio_grouped_button/CustomButtons/CustomRadioButton.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {

  final String text; 
  final List<String> opcoes;
  final Function radionButtonValue;
  final Function checkBoxButtonValues;

  CheckBox({this.text, this.opcoes, this.radionButtonValue, this.checkBoxButtonValues});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(this.text, style: TextStyle(color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
                    SizedBox(height: 15,),
      CustomCheckBoxGroup(
        buttonColor: Theme.of(context).canvasColor,
        buttonLables: this.opcoes,
        buttonValuesList: this.opcoes,
        checkBoxButtonValues: checkBoxButtonValues,
        horizontal: false,
        width: 120,
        enableShape: true,
        selectedColor: Theme.of(context).accentColor,
        padding: 5,
      ),
      
    ]);
  }
}

class RadioButtonTileHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      SizedBox(
        height: 10,
      ),
      Text(
        'Horizontal',
        style: TextStyle(fontSize: 20),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Shape Disabled',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomRadioButton(
                  horizontal: true,
                  buttonColor: Theme.of(context).canvasColor,
                  buttonLables: [
                    'Student',
                    'Parent',
                    'Teacher',
                  ],
                  buttonValues: [
                    "STUDENT",
                    "PARENT",
                    "TEACHER",
                  ],
                  radioButtonValue: (value) {
                    print(value);
                  },
                  selectedColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Shape Enabled',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomRadioButton(
                  horizontal: true,
                  enableShape: true,
                  elevation: 0,
                  buttonColor: Theme.of(context).canvasColor,
                  buttonLables: [
                    'Student',
                    'Parent',
                    'Teacher',
                  ],
                  buttonValues: [
                    "STUDENT",
                    "PARENT",
                    "TEACHER",
                  ],
                  radioButtonValue: (value) {
                    print(value);
                  },
                  selectedColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
        ],
      )
    ]));
  }
}

class RadioButtonTileVetical extends StatelessWidget {
  final String text;
  final List<String> options;
  final Color buttonColor;
  final Color selectedColor;
  final Color colorText;
  final Function radionButtonValue;

  RadioButtonTileVetical(
      {this.text,
      this.options,
      this.colorText,
      this.buttonColor,
      this.selectedColor,
      this.radionButtonValue
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                '${this.text}',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              CustomRadioButton(
                enableShape: true,
                buttonColor: Theme.of(context).canvasColor,
                buttonLables: this.options,
                buttonValues: this.options,
                radioButtonValue: radionButtonValue,
                selectedColor: Theme.of(context).accentColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
