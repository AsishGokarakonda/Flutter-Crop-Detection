class Weather {
  var cityName;
  var latitude;
  var longitude;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var gust;
  var wind_dir;
  var pressure;
  var uv;
  var last_update;
  var pricipe;
  var date;
  var time;

  Weather({
    this.cityName,
    this.latitude,
    this.longitude,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.gust,
    required this.wind_dir,
    required this.pressure,
    required this.uv,
    required this.last_update,
    required this.pricipe,
    this.date,
    this.time,
  });

  Weather.fromJson(Map<String, dynamic> json, String type ) {
    if (json['location'] != null && json['location'].containsKey('name')) {
      cityName = json['location']['name'];
    }
    if (json['location'] != null && json['location'].containsKey('lat')) {
      latitude = json['location']['lat'];
    }
    if (json['location'] != null && json['location'].containsKey('lon')) {
      longitude = json['location']['lon'];
    }
    var tempjson;
    if(type == 'current'){
      tempjson = json['current'];
    date = json['location']['localtime'];
    }
    else{
      tempjson=json;
      time=json['time'];
    }
    icon = tempjson['condition']['icon'];
    condition = tempjson['condition']['text'];
    temp = tempjson['temp_c'];
    wind = tempjson['wind_kph'];
    humidity = tempjson['humidity'];
    gust = tempjson['gust_kph'];
    wind_dir = tempjson['wind_dir'];
    pressure = tempjson['pressure_mb'];
    uv = tempjson['uv'];
    last_update = tempjson['last_updated'];
    pricipe = tempjson['precip_mm'];
  }
}
