import 'package:flutter/material.dart';

import '../values/dimen.dart';
import '../values/styles.dart';

Widget quoteBanner = Padding(
  padding: const EdgeInsets.fromLTRB(marginL, 0.0, marginL, 0.0),
  child:
  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Expanded(
          flex: 8,
          child:   Text(
            "O zielo a zerpetas, \nl\'agua a pozetas",
            style: bodyXLBold,
          ),
        ),
        Image.asset('assets/icons/ic_arrow_right.png')
      ]
  ),
);
