import 'package:flutter/material.dart';

Widget topBarHome = Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
  child:
  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[ //child:
        Image.asset('assets/images/flag_corner_left.png'),
        Image.asset('assets/icons/ic_settings.png'), // Back image
      ]
  ),
);


