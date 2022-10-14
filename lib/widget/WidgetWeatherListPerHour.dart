import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../values/app_constants.dart';
import '../values/colors.dart';
import '../values/styles.dart';

Widget weatherListPerHour = ListView.separated(
  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  padding: const EdgeInsets.all(8),
  itemCount: getWeatherPerHour().length,
  itemBuilder: (BuildContext context, int index) {
    return Center(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: extraLightBlue,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 5, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                      width: 20,
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        "${getWeatherPerHour()[index].nameDay} ${getWeatherPerHour()[index].hourDay} o",
                        style: bodyMDarkGray,
                      ),
                    ),
                  ],
                ),
              ]),
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text("${getWeatherPerHour()[index].temperature}º",
                          style: bodyMDarkGray),
                    ),
                    SizedBox(
                        width: 35,
                        child: Image.asset("assets/icons/ic_cloudy.png")),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);

class WeatherHour {
  String nameDay;
  String hourDay;
  int temperature;

  WeatherHour(
      {required this.nameDay,
      required this.hourDay,
      required this.temperature});
}

List<WeatherHour> getWeatherPerHour() {
  List<WeatherHour> weatherHour = [
    WeatherHour(nameDay: "Güei", hourDay: "8.00", temperature: 10),
    WeatherHour(nameDay: "Güei", hourDay: "9.00", temperature: 12),
    WeatherHour(nameDay: "Güei", hourDay: "10.00", temperature: 14),
    WeatherHour(nameDay: "Güei", hourDay: "11.00", temperature: 18),
    WeatherHour(nameDay: "Güei", hourDay: "12.00", temperature: 20),
    WeatherHour(nameDay: "Güei", hourDay: "13.00", temperature: 28),
    WeatherHour(nameDay: "Güei", hourDay: "14.00", temperature: 30),
  ];
  return weatherHour;
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
