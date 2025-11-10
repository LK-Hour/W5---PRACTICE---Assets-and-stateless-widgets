import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Weather Forecast"),
          ),
        ),
        endDrawer: Drawer(),
        body: Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeatherCard(weather: CityWeather.phnomPenh),
              const SizedBox(height: 16.0),
              WeatherCard(weather: CityWeather.paris),
              const SizedBox(height: 16.0),
              WeatherCard(weather: CityWeather.roma),
              const SizedBox(height: 16.0),
              WeatherCard(weather: CityWeather.toulouse),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final CityWeather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: weather.weatherType.gradient,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Decorative gradient circle in bottom-right
              Positioned(
                right: -40.0,
                bottom: -40.0,
                child: Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.15),
                  ),
                ),
              ),

              // Weather content
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 40.0),
                child: Row(
                  children: [
                    // Left side - Weather icon
                    CircleAvatar(
                      radius: 30.0,
                      child: ClipOval(
                        child: Image.asset(
                          weather.weatherType.iconPath,
                          width: 75.0,
                          height: 75.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),

                    // Middle - Weather information
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // City name
                          Text(
                            weather.cityName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4.0),

                          // Min temperature
                          Text(
                            'Min ${weather.minTemp}°C',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.0,
                            ),
                          ),

                          // Max temperatures
                          Text(
                            'Max ${weather.maxTemp}°C',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Right side - Current temperature (large)
                    Text(
                      '${weather.currentTemp}°C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Weather Type Enum
enum WeatherType {
  sunny(
    iconPath: 'assets/sunny.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 255, 10, 10),
        Color.fromARGB(255, 255, 0, 0),
      ],
    ),
  ),
  cloudy(
    iconPath: 'assets/cloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 239, 88, 250),
        Color.fromARGB(255, 162, 28, 171),
      ],
    ),
  ),
  sunnyCloudy(
    iconPath: 'assets/sunnyCloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 21, 217, 21),
        Color.fromARGB(255, 79, 183, 14),
      ],
    ),
  ),
  veryCloudy(
    iconPath: 'assets/veryCloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFf46b45), Color.fromARGB(255, 236, 186, 117)],
    ),
  );

  const WeatherType({required this.iconPath, required this.gradient});

  final String iconPath;
  final LinearGradient gradient;
}

// City Weather Enum
enum CityWeather {
  phnomPenh(
    cityName: 'Phnom Penh',
    minTemp: 10.0,
    maxTemp: 30.0,
    currentTemp: 12.2,
    weatherType: WeatherType.cloudy,
  ),
  paris(
    cityName: 'Paris',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 22.2,
    weatherType: WeatherType.sunnyCloudy,
  ),
  roma(
    cityName: 'Rome',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    weatherType: WeatherType.sunny,
  ),
  toulouse(
    cityName: 'Toulouse',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    weatherType: WeatherType.veryCloudy,
  );

  const CityWeather({
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.weatherType,
  });

  final String cityName;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final WeatherType weatherType;
}
