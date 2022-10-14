import 'package:flutter/material.dart';

import '../values/styles.dart';

class MaxVelocity extends StatelessWidget {
  const MaxVelocity(
      {Key? key,
      required this.velocity,
      required this.minTemperature,
      required this.maxTemperature})
      : super(key: key);
  final int velocity;
  final int minTemperature;
  final int maxTemperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset('assets/icons/ic_cloudy.png',
              width: 32, fit: BoxFit.fill),
          const SizedBox(width: 6),
          Text(
            '$velocity',
            textAlign: TextAlign.right,
            style: bodySBold,
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset('assets/icons/ic_cloudy.png',
              width: 32, fit: BoxFit.fill),
          const SizedBox(width: 6),
          Text(
            '$minTemperature',
            textAlign: TextAlign.right,
            style: bodySBold,
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Image.asset('assets/icons/ic_cloudy.png',
              width: 32, fit: BoxFit.fill),
          const SizedBox(width: 6),
          Text(
            '$maxTemperature',
            textAlign: TextAlign.right,
            style: bodySBold,
          ),
        ]),
      ],
    );
  }
}
