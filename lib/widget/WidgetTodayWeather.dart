import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lorache/widget/CurrentIconAndTemperature.dart';

import '../values/dimen.dart';
import '../values/styles.dart';
import 'MaxVelocityAndMaxMinTemperature.dart';

Widget todayBanner({required int velocity, required int minT,required int maxT,required String skyState,required int currentTemperature}) {
  print('aquí2 $velocity $minT $maxT $currentTemperature');
  return Padding(
      padding: const EdgeInsets.fromLTRB(marginL, marginL, marginL, 0.0),
      child: Column(
        children: [
          CurrentIconAndTemperature(currentTemperature: currentTemperature, skyState: skyState),
          const SizedBox(height: 24),
          MaxVelocity(velocity: velocity, minTemperature: minT, maxTemperature: maxT)
        ],
      ));
}


  Widget maxVelocityAndMaxMinTemperature = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Image.asset('assets/icons/ic_cloudy.png', width: 32, fit: BoxFit.fill),
        const SizedBox(width: 6),
        const Text(
          '12 km/h',
          textAlign: TextAlign.right,
          style: bodySBold,
        ),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Image.asset('assets/icons/ic_cloudy.png', width: 32, fit: BoxFit.fill),
        const SizedBox(width: 6),
        const Text(
          '27º',
          textAlign: TextAlign.right,
          style: bodySBold,
        ),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Image.asset('assets/icons/ic_cloudy.png', width: 32, fit: BoxFit.fill),
        const SizedBox(width: 6),
        const Text(
          '27º',
          textAlign: TextAlign.right,
          style: bodySBold,
        ),
      ]),
    ],
  );



