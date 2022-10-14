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

// TODO BORRAR SI NO SE USA
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  //runApp(const MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShowPerDay(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF69D0F6),
        primaryColor: Colors.lightBlue[800],
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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

  int velocity =  0;
  int minT = 0;
  int maxT = 0;
  String skyState = '';
  int currentTemperature= -1;

  @override
  void initState() {
    _forecastDayModel = [];
    super.initState();
    _getDataUrl();
  }

  void _getDataUrl() async {
    final dataUrl = ApiServiceDay().getForecastAemetString(city: "22039");
    //final forecast = getWeatherForecast();
    final url = await dataUrl;
    print("estamos imprimiendo la url $url");
    final response =await _getData2(url);
    print("estamos imprimiendo la response : $response");



    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getData(url) async {
    print("Data url recibida: $url");
    //ApiServiceDay().getForecastPerDay(url).then((value) {  setState(() {_forecastDayModel: value;});})!;
    _forecastDayModel = await ApiServiceDay().getForecastPerDay(url);
    velocity =  _forecastDayModel?[0].prediccion.dia[0].viento[3].velocidad ?? -2;
    minT = -1;//_forecastDayModel?[0].prediccion.dia[0].temperatura.minima ?? 0;
    maxT = -1;//_forecastDayModel?[0].prediccion.dia[0].temperatura.maxima ?? 0;
    skyState = '';
    currentTemperature= -1;
    print('aquí2');
    print('velocidad $velocity');
    //Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {}));
  }

  Future<List<ForecastDayModel>?> _getData2(url) async {
    print("Data url recibida: $url");
    //ApiServiceDay().getForecastPerDay(url).then((value) {  setState(() {_forecastDayModel: value;});})!;
    final response = await ApiServiceDay().getForecastPerDay(url);
    return response;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          _forecastDayModel == null || _forecastDayModel == []
            ?
          Column(children: <Widget>[
            topBarHome,
            quoteBanner,
            todayBanner(velocity: velocity, minT: minT, maxT: maxT, currentTemperature: currentTemperature, skyState: ''),
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
            // SizedBox(
            //   height: 400,
            //   child: (showWeahterPerDay) ? weatherListPerDay : weatherListPerHour
            // ),
          ]) : CircularProgressIndicator(),
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
