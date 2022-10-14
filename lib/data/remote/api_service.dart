import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../values/app_constants.dart';
import 'model/AemetResponseModel.dart';
import 'model/ForecastDayModel.dart';

 class ApiServiceDay{
   Future<List<ForecastDayModel>?> getForecastPerDay(String dataUrl) async {
     try {
       print("Pasa por aquí");
       print('$dataUrl');
       var url = Uri.parse(/*ApiConstants.urlForecastDay*/ dataUrl);

       // final Map<String, String> httpHeaders = {
       //   HttpHeaders.contentTypeHeader: "application/json",
       //   "Connection": "Keep-Alive",
       //   "Keep-Alive": "timeout=5, max=1000"
       // };

       var response = await http.get(url/*, headers: httpHeaders*/);
       print("Pasa por aquí2");
       print('${response.statusCode}');
       print('${response.body}');
       if (response.statusCode == 200) {
         // TODO añadir la gestión de "Data Expired"
         List<ForecastDayModel> _model = forecastPerDayModelFromJson(response.body);
         return _model;
       }
     } catch (e) {
       log("Api Servide error: " + e.toString() + "--> ¿HAS REFRESCADO LA 1ª LLAMADA?");
     }
   }

   Future<String> getForecastAemetString({required String city}) async {
     String urlPerDay =
         "https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/diaria/$city?api_key=$apiKey";
     // "https://opendata.aemet.es/opendata//api/prediccion/especifica/municipio/horaria/22039?api_key=eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpYmVzQHJlbGlnYWRhLmNvbSIsImp0aSI6IjgzYmQ1ZjQ5LTQyZWItNDMxOS05OGYzLWZhZmJhMGVlZGIyYSIsImlzcyI6IkFFTUVUIiwiaWF0IjoxNjUzMDI0MDU1LCJ1c2VySWQiOiI4M2JkNWY0OS00MmViLTQzMTktOThmMy1mYWZiYTBlZWRiMmEiLCJyb2xlIjoiIn0.EifQAODrRe2KsCGlFMCGNXpdKzTVwOmkrhlGvOPIOp8";

     final response = await http.get(Uri.parse(urlPerDay));

     if (response.statusCode == 200) {
       // If the server did return a 200 OK response,
       // then parse the JSON.
       AemetResponse aemetResponse = AemetResponse.fromJson(jsonDecode(response.body));

       return aemetResponse.data;
     } else {
       // If the server did not return a 200 OK response,
       // then throw an exception.
       throw Exception('Failed to load album');
     }
   }
 }


