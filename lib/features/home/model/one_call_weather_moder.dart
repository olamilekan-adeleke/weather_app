import 'dart:convert';

class WeatherModel {
  WeatherModel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
  });

  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final Current current;
  final List<Minutely>? minutely;
  final List<Current>? hourly;
  final List<Daily>? daily;

  factory WeatherModel.fromJson(String str) =>
      WeatherModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromMap(Map<String, dynamic> json) {
    return WeatherModel(
      lat: json["lat"].toDouble(),
      lon: json["lon"].toDouble(),
      timezone: json["timezone"],
      timezoneOffset: json["timezone_offset"],
      current: Current.fromMap(json["current"]),
      minutely: json["minutely"] != null
          ? List<Minutely>.from(
              json["minutely"].map((x) => Minutely.fromMap(x)))
          : null,
      hourly: json["hourly"] != null
          ? List<Current>.from(json["hourly"].map((x) => Current.fromMap(x)))
          : null,
      daily: json["daily"] != null
          ? List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x)))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "lat": lat,
      "lon": lon,
      "timezone": timezone,
      "timezone_offset": timezoneOffset,
      "current": current.toMap(),
      "minutely": List<dynamic>.from(minutely!.map((x) => x.toMap())),
      "hourly": List<dynamic>.from(hourly!.map((x) => x.toMap())),
      "daily": List<dynamic>.from(daily!.map((x) => x.toMap())),
    };
  }
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
    required this.rain,
  });

  final int? dt;
  final int? sunrise;
  final int? sunset;
  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<Weather>? weather;
  final double? pop;
  final Rain? rain;

  factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Current.fromMap(Map<String, dynamic> json) {
    return Current(
      dt: json["dt"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      temp: json["temp"].toDouble(),
      feelsLike: json["feels_like"].toDouble(),
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"].toDouble(),
      uvi: json["uvi"].toDouble(),
      clouds: json["clouds"],
      visibility: json["visibility"],
      windSpeed: json["wind_speed"].toDouble(),
      windDeg: json["wind_deg"],
      windGust: json["wind_gust"].toDouble(),
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
      pop: (json["pop"] ?? 0).toDouble(),
      rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
    );
  }

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather!.map((x) => x.toMap())),
        "pop": pop,
        "rain": rain?.toMap(),
      };
}

class Rain {
  Rain({
    required this.the1H,
  });

  final double? the1H;

  factory Rain.fromJson(String str) => Rain.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rain.fromMap(Map<String, dynamic> json) {
    return Rain(
      the1H: json["1h"].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "1h": the1H,
    };
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final int? id;
  final Main? main;
  final Description? description;
  final String? icon;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) {
    return Weather(
      id: json["id"],
      main: mainValues.map[json["main"]],
      description: descriptionValues.map[json["description"]],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": mainValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": icon,
      };
}

enum Description {
  OVERCAST_CLOUDS,
  LIGHT_RAIN,
  CLEAR_SKY,
  MODERATE_RAIN,
  SCATTERED_CLOUDS,
  BROKEN_CLOUDS,
  FEW_CLOUDS
}

final descriptionValues = EnumValues({
  "broken clouds": Description.BROKEN_CLOUDS,
  "clear sky": Description.CLEAR_SKY,
  "few clouds": Description.FEW_CLOUDS,
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN,
  "overcast clouds": Description.OVERCAST_CLOUDS,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Main { CLOUDS, RAIN, CLEAR }

final mainValues =
    EnumValues({"Clear": Main.CLEAR, "Clouds": Main.CLOUDS, "Rain": Main.RAIN});

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    // required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  final double? moonPhase;
  final Temp? temp;
  // final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  final double? dewPoint;
  final double? windSpeed;
  final int? windDeg;
  final double? windGust;
  final List<Weather>? weather;
  final int? clouds;
  final double? pop;
  final double? rain;
  final double? uvi;

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Daily.fromMap(Map<String, dynamic> json) {
    return Daily(
      dt: json["dt"],
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      moonrise: json["moonrise"],
      moonset: json["moonset"],
      moonPhase: json["moon_phase"].toDouble(),
      temp: json["temp"] !=null ? Temp.fromMap(json["temp"]) : null,
      // feelsLike: FeelsLike.fromMap(json["feels_like"]),
      pressure: json["pressure"],
      humidity: json["humidity"],
      dewPoint: json["dew_point"].toDouble(),
      windSpeed: json["wind_speed"].toDouble(),
      windDeg: json["wind_deg"],
      windGust: json["wind_gust"].toDouble(),
      weather:
          List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
      clouds: json["clouds"],
      pop: json["pop"].toDouble(),
      rain: (json["rain"] ?? 0).toDouble(),
      uvi: json["uvi"].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "dt": dt,
      "sunrise": sunrise,
      "sunset": sunset,
      "moonrise": moonrise,
      "moonset": moonset,
      "moon_phase": moonPhase,
      "temp": temp?.toMap(),
      // "feels_like": feelsLike?.toMap(),
      "pressure": pressure,
      "humidity": humidity,
      "dew_point": dewPoint,
      "wind_speed": windSpeed,
      "wind_deg": windDeg,
      "wind_gust": windGust,
      "weather": List<dynamic>.from(weather!.map((x) => x.toMap())),
      "clouds": clouds,
      "pop": pop,
      "rain": rain,
      "uvi": uvi,
    };
  }
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double day;
  final double night;
  final double eve;
  final double morn;

  factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromMap(Map<String, dynamic> json) {
    return FeelsLike(
      day: json["day"].toDouble(),
      night: json["night"].toDouble(),
      eve: json["eve"].toDouble(),
      morn: json["morn"].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "day": day,
      "night": night,
      "eve": eve,
      "morn": morn,
    };
  }
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Temp.fromMap(Map<String, dynamic> json) {
    return Temp(
      day: json["day"].toDouble(),
      min: json["min"].toDouble(),
      max: json["max"].toDouble(),
      night: json["night"].toDouble(),
      eve: json["eve"].toDouble(),
      morn: json["morn"].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "day": day,
      "min": min,
      "max": max,
      "night": night,
      "eve": eve,
      "morn": morn,
    };
  }
}

class Minutely {
  Minutely({
    required this.dt,
    required this.precipitation,
  });

  final int dt;
  final int precipitation;

  factory Minutely.fromJson(String str) => Minutely.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Minutely.fromMap(Map<String, dynamic> json) {
    return Minutely(
      dt: json["dt"],
      precipitation: json["precipitation"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "dt": dt,
      "precipitation": precipitation,
    };
  }
}

class EnumValues<T> {
  final Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    Map<T, String> _reverseMap;

    _reverseMap = (reverseMap ?? map.map((k, v) => MapEntry(v, k)));

    return _reverseMap;
  }
}
