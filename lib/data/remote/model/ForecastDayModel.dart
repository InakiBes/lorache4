// JSON Model
import 'dart:convert';

List<ForecastDayModel> forecastPerDayModelFromJson(String str) =>
    List<ForecastDayModel>.from(json.decode(str).map((x) =>
            ForecastDayModel.fromJson(x)));

String forecastPerDayModelToJson(List<ForecastDayModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ForecastDayModel {
  ForecastDayModel({
    required this.origen,
    //  required this.elaborado,
    required this.nombre,
    required this.provincia,
    required this.prediccion,
    required this.id,
    // required this.version,
  });

   Origen origen;
//  DateTime elaborado;
  String nombre;
  String provincia;

  Prediccion prediccion;
  int id;
//   String version;

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) => ForecastDayModel(
        origen: Origen.fromJson(json["origen"]),
        // elaborado: DateTime.parse(json["elaborado"]),
        nombre: json["nombre"],
        provincia: json["provincia"],
        prediccion: Prediccion.fromJson(json["prediccion"]),
        id: json["id"],
//         version: json["version"],
      );

  Map<String, dynamic> toJson() => {
         "origen": origen.toJson(),
        // "elaborado": elaborado.toIso8601String(),
        "nombre": nombre,
        "provincia": provincia,
        "prediccion": prediccion.toJson(),
        "id": id,
       // "version": version,
      };
}

class Origen {
  Origen({
    required this.productor,
    // required this.web,
    // required this.enlace,
    // required this.language,
    // required this.copyright,
    // required this.notaLegal,
  });

  String productor;
  // String web;
  // String enlace;
  // String language;
  // String copyright;
  // String notaLegal;

  factory Origen.fromJson(Map<String, dynamic> json) => Origen(
        productor: json["productor"],
        // web: json["web"],
        // enlace: json["enlace"],
        // language: json["language"],
        // copyright: json["copyright"],
        // notaLegal: json["notaLegal"],
      );

  Map<String, dynamic> toJson() => {
        "productor": productor,
        // "web": web,
        // "enlace": enlace,
        // "language": language,
        // "copyright": copyright,
        // "notaLegal": notaLegal,
      };
}

class Prediccion {
  Prediccion({
    required this.dia,
  });

  List<Dia> dia;

  factory Prediccion.fromJson(Map<String, dynamic> json) =>
      Prediccion(dia: List<Dia>.from(json["dia"].map((x) =>
          Dia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dia": List<dynamic>.from(dia.map((x) => x.toJson())),
      };
}

class Dia {
  Dia({
    required this.probPrecipitacion,
    required this.cotaNieveProv,
    required this.estadoCielo,
    required this.viento,
    required this.rachaMax,
    required this.temperatura,
    required this.sensTermica,
    required this.humedadRelativa,
    this.uvMax,
    required this.fecha,
  });

  List<ProbPrecipitacion> probPrecipitacion;
  List<CotaNieveProv> cotaNieveProv;
  List<EstadoCielo> estadoCielo;
  List<Viento> viento;
  List<CotaNieveProv> rachaMax;
  HumedadRelativa temperatura;
  HumedadRelativa sensTermica;
  HumedadRelativa humedadRelativa;
  int? uvMax;
  String fecha;

  factory Dia.fromJson(Map<String, dynamic> json) => Dia(
        probPrecipitacion: List<ProbPrecipitacion>.from(
            json["probPrecipitacion"]
                .map((x) => ProbPrecipitacion.fromJson(x))),
        cotaNieveProv: List<CotaNieveProv>.from(
            json["cotaNieveProv"].map((x) => CotaNieveProv.fromJson(x))),
        estadoCielo: List<EstadoCielo>.from(
            json["estadoCielo"].map((x) => EstadoCielo.fromJson(x))),
        viento:
            List<Viento>.from(json["viento"].map((x) => Viento.fromJson(x))),
        rachaMax: List<CotaNieveProv>.from(
            json["rachaMax"].map((x) => CotaNieveProv.fromJson(x))),
        temperatura: HumedadRelativa.fromJson(json["temperatura"]),
        sensTermica: HumedadRelativa.fromJson(json["sensTermica"]),
        humedadRelativa: HumedadRelativa.fromJson(json["humedadRelativa"]),
        uvMax: json["uvMax"] == null ? null : json["uvMax"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "probPrecipitacion": List<dynamic>.from( probPrecipitacion.map((x) => x.toJson())  ),
        "cotaNieveProv":
            List<dynamic>.from(cotaNieveProv.map((x) => x.toJson())),
        "estadoCielo": List<dynamic>.from(estadoCielo.map((x) => x.toJson())),
        "viento": List<dynamic>.from(viento.map((x) => x.toJson())),
        "rachaMax": List<dynamic>.from(rachaMax.map((x) => x.toJson())),
        "temperatura": temperatura.toJson(),
        "sensTermica": sensTermica.toJson(),
        "humedadRelativa": humedadRelativa.toJson(),
        "uvMax": uvMax == null ? null : uvMax,
        "fecha": fecha,
      };
}

class CotaNieveProv {
  CotaNieveProv({
    required this.value,
    this.periodo,
  });

  String value;
  String? periodo;

  factory CotaNieveProv.fromJson(Map<String, dynamic> json) => CotaNieveProv(
        value: json["value"],
        periodo: json["periodo"] == null ? null : json["periodo"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "periodo": periodo == null ? null : periodo,
      };
}

class EstadoCielo {
  EstadoCielo({
    required this.value,
    this.periodo,
    required this.descripcion,
  });

  String value;
  String? periodo;
  String descripcion;

  factory EstadoCielo.fromJson(Map<String, dynamic> json) => EstadoCielo(
        value: json["value"],
        periodo: json["periodo"] == null ? null : json["periodo"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "periodo": periodo == null ? null : periodo,
        "descripcion": descripcion,
      };
}

class HumedadRelativa {
  HumedadRelativa({
    required this.maxima,
    required this.minima,
    required this.dato,
  });

  int maxima;
  int minima;
  List<Dato> dato;

  factory HumedadRelativa.fromJson(Map<String, dynamic> json) =>
      HumedadRelativa(
        maxima: json["maxima"],
        minima: json["minima"],
        dato: List<Dato>.from(json["dato"].map((x) => Dato.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "maxima": maxima,
        "minima": minima,
        "dato": List<dynamic>.from(dato.map((x) => x.toJson())),
      };
}

class Dato {
  Dato({
    required this.value,
    required this.hora,
  });

  int value;
  int hora;

  factory Dato.fromJson(Map<String, dynamic> json) => Dato(
        value: json["value"],
        hora: json["hora"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "hora": hora,
      };
}

class ProbPrecipitacion {
  ProbPrecipitacion({
    required this.value,
    this.periodo,
  });

  int value;
  String? periodo;

  factory ProbPrecipitacion.fromJson(Map<String, dynamic> json) =>
      ProbPrecipitacion(
        value: json["value"],
        periodo: json["periodo"] == null ? null : json["periodo"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "periodo": periodo == null ? null : periodo,
      };
}

class Viento {
  Viento({
    required this.direccion,
    required this.velocidad,
    this.periodo,
  });

  String direccion;
  int velocidad;
  String? periodo;

  factory Viento.fromJson(Map<String, dynamic> json) => Viento(
        direccion: json["direccion"],
        velocidad: json["velocidad"],
        periodo: json["periodo"] == null ? null : json["periodo"],
      );

  Map<String, dynamic> toJson() => {
        "direccion": direccion,
        "velocidad": velocidad,
        "periodo": periodo == null ? null : periodo,
      };
}
