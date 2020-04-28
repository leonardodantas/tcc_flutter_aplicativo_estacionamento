import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InputTile extends StatelessWidget {
  
  final TextInputType inputType;
  final bool obscuredText;
  final String labelText;
  final Function onChange;
  final String Function() validation;
  final mask;

  InputTile(
      {this.inputType,
      this.obscuredText,
      this.labelText,
      this.onChange,
      this.validation,
      this.mask
      });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${this.labelText}",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          Observer(builder: (_){
            return TextFormField(
              inputFormatters: this.mask != null ? [this.mask] : null,
              onChanged: onChange,
              obscureText: this.obscuredText,
              keyboardType: this.inputType,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                fillColor: Colors.blue,
                errorText: this.validation == null ? null : this.validation(),
                errorStyle: TextStyle(fontSize: 12)
              ));
          })
        ]);
  }
}
