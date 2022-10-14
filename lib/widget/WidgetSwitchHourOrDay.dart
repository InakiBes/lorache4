import 'package:flutter/material.dart';
import 'package:lorache/home.dart';
import 'package:lorache/main.dart';
import '../values/styles.dart';
import 'package:provider/provider.dart';

/// stateful widget that the main application instantiates
class WidgetSwitchHourOrDay extends StatefulWidget {
  const WidgetSwitchHourOrDay({Key? key}) : super(key: key);

  @override
  State<WidgetSwitchHourOrDay> createState() => _WidgetSwitchHourOrDayState();
}

/// private State class that goes with WidgetSwitchHourOrDay
class _WidgetSwitchHourOrDayState extends State<WidgetSwitchHourOrDay> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Per diyas',
            style: isSwitched == false ? bodySBold : bodyS,
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              var counter = context.read<ShowPerDay>();
              counter.showPerDay(!value);
              setState(() {
                isSwitched = value;
              });
            },
          ),
          Text(
            'Per oras',
            style: isSwitched == true ? bodySBold : bodyS,
          )
        ],
      ),
    );
  }
}
