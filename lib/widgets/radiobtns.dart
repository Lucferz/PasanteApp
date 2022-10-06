import 'package:flutter/material.dart';

enum DatosDelRadio{Personal, Empresa}
/*Este enum es el que se va a utilizar, no declarar otro, o dara error*/

class RadioBtns extends StatelessWidget {
  DatosDelRadio? selectedDataRadio;
  String title;
  DatosDelRadio value;
  Function(DatosDelRadio?)? onChanged;
  var fontSize;
  RadioBtns({
    Key? key,
    required this.title,
    required this.value,
    required this.selectedDataRadio,  
    required this.onChanged,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<DatosDelRadio>(
        title: Text(this.title, style: TextStyle(fontSize: this.fontSize)),
        value: this.value,
        groupValue: this.selectedDataRadio,
        contentPadding: EdgeInsets.all(0.0),
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onChanged: onChanged,
        
      ),
    );
  }
}