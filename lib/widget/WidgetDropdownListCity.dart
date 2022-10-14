import 'package:flutter/material.dart';

import '../values/app_constants.dart';

class WidgetDropdownListCity extends StatefulWidget {
  const WidgetDropdownListCity({Key? key}) : super(key: key);

  @override
  State<WidgetDropdownListCity> createState() => _WidgetDropdownListCityState();
}

class _WidgetDropdownListCityState extends State<WidgetDropdownListCity> {
  final dynamic items = ["Item 1","Item 2","Item 3"];
  String dropdownValue = "Item 1";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: DropdownButton<String>(
            value: dropdownValue,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            }),
      ),
    );
  }
}
