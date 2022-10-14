
import 'package:flutter/material.dart';

import '../values/styles.dart';


class CurrentIconAndTemperature extends StatefulWidget {
  const CurrentIconAndTemperature({Key? key,required this.currentTemperature, required this.skyState}) : super(key: key);
  final String skyState;
  final int currentTemperature;

  @override
  State<CurrentIconAndTemperature> createState() => _CurrentIconAndTemperatureState();
}

class _CurrentIconAndTemperatureState extends State<CurrentIconAndTemperature> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Image.asset('assets/icons/ic_cloudy.png', width: 120, fit: BoxFit.fill),

      Text(
        '${widget.currentTemperature}',
        textAlign: TextAlign.right,
        style: biggerText,
      ),
    ]);
  }
}

