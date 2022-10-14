import 'package:flutter/material.dart';
import 'package:lorache/utils/shared_prefs.dart';

import 'package:lorache/widget/WidgetSelectCity.dart';
import 'package:lorache/widget/WidgetSwitchHourOrDay.dart';
import 'package:lorache/widget/WidgetTodayWeather.dart';
import 'package:lorache/widget/WidgetWeatherListPerDay.dart';
import 'package:lorache/widget/WidgetWeatherListPerHour.dart';
import 'package:provider/provider.dart';
import 'data/remote/api_service.dart';
import 'data/remote/model/ForecastDayModel.dart';
import 'widget/WidgetBars.dart';
import 'widget/WidgetQuote.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var showWeahterPerDay = false;
  SharedPrefs sharedPrefs = SharedPrefs();
  late List<ForecastDayModel>? _forecastDayModel;
  late int velocity;
  late int minT;
  late int maxT;
  late String skyState;
  late int currentTemperature;

  @override
  void initState() {
    _forecastDayModel = [];
    velocity = 0;
    minT = 0;
    maxT = 0;
    skyState = '';
    currentTemperature = -1;
    _getDataUrl().then((value) {
      setState(() {});
    });
    super.initState();
  }

  Future<void> _getDataUrl() async {
    final dataUrl = ApiServiceDay().getForecastAemetString(city: "22039");
    final url = await dataUrl;
    final response = await _getData2(url);
    _forecastDayModel = response;
    velocity =
        _forecastDayModel?[0].prediccion.dia[0].viento[2].velocidad ?? -2;

    minT = _forecastDayModel?[0].prediccion.dia[0].temperatura.minima ?? 0;
    maxT = _forecastDayModel?[0].prediccion.dia[0].temperatura.maxima ?? 0;
    skyState = '';
    currentTemperature = -1;
  }

  Future<List<ForecastDayModel>?> _getData2(url) async {
    final response = await ApiServiceDay().getForecastPerDay(url);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    print("creamos el arbol de datos");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _forecastDayModel != null || _forecastDayModel != []
              ? Column(children: <Widget>[
                  topBarHome,
                  quoteBanner,
                  todayBanner(
                      velocity: velocity,
                      minT: minT,
                      maxT: maxT,
                      currentTemperature: currentTemperature,
                      skyState: ''),
                  const SizedBox(height: 20.0),
                  selectCity(sharedPrefs.city),
                  const WidgetSwitchHourOrDay(),
                  Consumer<ShowPerDay>(
                    builder: (context, showPerDay, child) => SizedBox(
                        height: 400,
                        child: (showPerDay.show)
                            ? weatherListPerDay
                            : weatherListPerHour),
                  ),
                  SizedBox(
                      height: 400,
                      child: (showWeahterPerDay)
                          ? weatherListPerDay
                          : weatherListPerHour),
                ])
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class ShowPerDay with ChangeNotifier {
  bool show = true;

  void showPerDay(bool show) {
    this.show = show;
    notifyListeners();
  }
}
