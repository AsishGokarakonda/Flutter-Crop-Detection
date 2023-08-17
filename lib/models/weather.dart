class Weather {
  var cityName;
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

  
Weather(
  {
    required this.cityName, 
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
  }
);

Weather.fromJson( Map<String, dynamic> json){
  cityName=json['location']['name'];
  icon=json['current']['condition']['icon'];
  condition=json['current']['condition']['text'];
  temp=json['current']['temp_c'];
  wind=json['current']['wind_kph'];
  humidity=json['current']['humidity'];
  gust=json['current']['gust_kph'];
  wind_dir=json['current']['wind_dir'];
  pressure=json['current']['pressure_mb'];
  uv=json['current']['uv'];
  last_update=json['current']['last_updated'];
  pricipe=json['current']['precip_mm'];
}
}