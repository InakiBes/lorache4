import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../values/app_constants.dart';
import '../values/colors.dart';
import '../values/styles.dart';

Widget weatherListPerDay = ListView.separated(
  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  padding: const EdgeInsets.all(8),
  itemCount: getWeatherDays().length,
  itemBuilder: (BuildContext context, int index) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: extraLightBlue,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 45,
                        width: 20,
                      ),
                      SizedBox(
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              getWeatherDays()[index].nameDay.toString(),
                              style: bodyMDarkGray,
                            ),
                            Text(getWeatherDays()[index].monthDay.toString(),
                                style: bodyXXSGray),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: getTemperatureColor(
                                      getWeatherDays()[index]
                                          .minTemperature
                                          .toInt())),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${getWeatherDays()[index].minTemperature}º",
                                  style: bodyXSDarkGray,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            width: 50,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: getTemperatureColor(
                                      getWeatherDays()[index]
                                          .maxTemperature
                                          .toInt())),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${getWeatherDays()[index].maxTemperature}º",
                                  style: bodyXSDarkGray,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          width: 35, child: Image.asset("assets/icons/ic_cloudy.png")),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          width: 20,
                          child: Image.asset("assets/icons/ic_arrow_right.png")),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);

Color getTemperatureColor(int t) {
  var temperatureColor = hot;

  if (t > 25) {
    temperatureColor = hot;
  } else if (25 >= t && t > 15) {
    temperatureColor = warm;
  } else if (15 >= t && t > 5) {
    temperatureColor = temperate;
  } else {
    temperatureColor = cold;
  }

  return temperatureColor;
}

class WeatherDay {
  String nameDay;
  String monthDay;
  int minTemperature;
  int maxTemperature;

  WeatherDay(
      {required this.nameDay,
      required this.monthDay,
      required this.minTemperature,
      required this.maxTemperature});
}

List<WeatherDay> getWeatherDays() {
  List<WeatherDay> weatherDays = [
    WeatherDay(
        nameDay: "Güei",
        monthDay: "20 mayo",
        minTemperature: -1,
        maxTemperature: 26),
    WeatherDay(
        nameDay: "Maitín",
        monthDay: "21 mayo",
        minTemperature: 8,
        maxTemperature: 24),
    WeatherDay(
        nameDay: "Chueus",
        monthDay: "22 mayo",
        minTemperature: 16,
        maxTemperature: 24),
    WeatherDay(
        nameDay: "Vienres",
        monthDay: "23 mayo",
        minTemperature: 26,
        maxTemperature: 27),
    WeatherDay(
        nameDay: "Sabado",
        monthDay: "24 mayo",
        minTemperature: -2,
        maxTemperature: 28),
    WeatherDay(
        nameDay: "Dominche",
        monthDay: "25 mayo",
        minTemperature: 10,
        maxTemperature: 29),
    WeatherDay(
        nameDay: "Luns",
        monthDay: "26 mayo",
        minTemperature: 8,
        maxTemperature: 29),
  ];
  return weatherDays;
}
// class WeatherDay{
//   String nameDay = "";
//   String monthDay = "";
//   int minTemperature = 0;
//   int maxTemperature = 0;
//
//   WeatherDay(String s, String t, int i, int j);
// }

// getWeatherDays(): List<WeatherDay>{
//   List<WeatherDay> weatherDays = [
//     WeatherDay(nameDay: "Güei", monthDay: "20 mayo", minTemperature: 10, maxTemperature: 26),
//     WeatherDay(nameDay: "Maitín", monthDay: "21 mayo", minTemperature: 8, maxTemperature: 24),
//     WeatherDay(nameDay: "Chueus", monthDay: "22 mayo", minTemperature: 8, maxTemperature: 24),
//     WeatherDay(nameDay: "Vienres", monthDay: "23 mayo", minTemperature: 9, maxTemperature: 27),
//     WeatherDay(nameDay: "Sabado", monthDay: "24 mayo", minTemperature: 8, maxTemperature: 28),
//     WeatherDay(nameDay: "Dominche", monthDay: "25 mayo", minTemperature: 10, maxTemperature: 29),
//     WeatherDay(nameDay: "Luns", monthDay: "26 mayo", minTemperature: 8, maxTemperature: 29),
//   ];
//   return weatherDays;
// List<WeatherDay> weatherDays = <WeatherDay>[
//   WeatherDay("Güei", "20 mayo", 10, 28),
//   WeatherDay("Maitín", "21 mayo", 9, 26),
//   WeatherDay("Chueus", "22 mayo", 12, 30),
//   WeatherDay("Vienres", "23 mayo", 14, 29),
//   WeatherDay("Sabado", "24 mayo", 12, 31),
//   WeatherDay("Dominche", "25 mayo", 8, 28),
//   WeatherDay("Luns", "26 mayo", 11, 29),
// ];
//
// }

getItems() {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'A',
    'B',
    'C',
    'D',
    'A',
    'B',
    'C',
    'D'
  ];
  return entries;
}
