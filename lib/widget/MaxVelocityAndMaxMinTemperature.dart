import 'package:flutter/material.dart';

import '../values/styles.dart';


class MaxVelocity extends StatefulWidget {
  const MaxVelocity({Key? key,required this.velocity, required this.minTemperature, required this.maxTemperature}) : super(key: key);
  final int velocity;
  final int minTemperature;
  final int maxTemperature;

  @override
  State<MaxVelocity> createState() => _MaxVelocityState();
}

class _MaxVelocityState extends State<MaxVelocity> {

  late int velocity;
  late int max;
  late int min;


  @override
  void initState() {

    velocity = widget.velocity;
    max = widget.maxTemperature;
    min = widget.minTemperature;

    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset('assets/icons/ic_cloudy.png', width: 32, fit: BoxFit.fill),
          const SizedBox(width: 6),
          Text(
            '$velocity',
            textAlign: TextAlign.right,
            style: bodySBold,
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset('assets/icons/ic_cloudy.png', width: 32, fit: BoxFit.fill),
          const SizedBox(width: 6),
          Text(
            '$min',
            textAlign: TextAlign.right,
            style: bodySBold,
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset('assets/icons/ic_cloudy.png', width: 32, fit: BoxFit.fill),
          const SizedBox(width: 6),
          Text(
            '$max',
            textAlign: TextAlign.right,
            style: bodySBold,
          ),
        ]),
      ],
    );
  }
}