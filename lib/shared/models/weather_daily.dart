// To parse this JSON data, do
//
//     final weatherDailyModel = weatherDailyModelFromJson(jsonString);

import 'dart:convert';

WeatherDailyModel weatherDailyModelFromJson(String str) =>
    WeatherDailyModel.fromJson(json.decode(str));

String weatherDailyModelToJson(WeatherDailyModel data) =>
    json.encode(data.toJson());

class WeatherDailyModel {
  WeatherDailyModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.daily,
  });

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  List<Daily>? daily;

  factory WeatherDailyModel.fromJson(Map<String, dynamic> json) =>
      WeatherDailyModel(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "daily": List<dynamic>.from(daily!.map((x) => x.toJson())),
      };
}

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
    this.snow,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  double? pop;
  var uvi;
  double? snow;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"].toDouble(),
        temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
        feelsLike: json["feels_like"] == null
            ? null
            : FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"].toDouble(),
        uvi: json["uvi"],
        snow: json["snow"] == null ? null : json["snow"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp?.toJson(),
        "feels_like": feelsLike?.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
        "snow": snow == null ? null : snow,
      };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? night;
  double? eve;
  double? morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"] == null ? null : json["day"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"] == null ? null : json["day"].toDouble(),
        min: json["min"] == null ? null : json["min"].toDouble(),
        max: json["max"] == null ? null : json["max"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  String? main;
  String? description;
  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
