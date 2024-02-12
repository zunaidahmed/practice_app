class Temperatures {

  String? city;
  int? temperature;
  String? condition;
  int? humidity;
  double? windSpeed;

  Temperatures({
    this.city,
    this.temperature,
    this.condition,
    this.humidity,
    this.windSpeed,
  });

  Temperatures.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    temperature =  json['temperature'];
    condition = json['condition'];
    humidity = json['humidity'];
    windSpeed = json['windSpeed'];
    
  }
}


