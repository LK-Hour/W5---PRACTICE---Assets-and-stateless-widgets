import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Weather Forecast"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final city in CityWeather.values) WeatherCard(weather: city),
          ],
        ),
      ),
    );
  }
}

// Weather Type Enum with better asset handling and fallbacks
enum WeatherType {
  sunny(
    iconPath: 'assets/sunny.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF667eea), Color(0xFF764ba2)],
    ),
  ),
  cloudy(
    iconPath: 'assets/cloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF4ca1af), Color(0xFF2c3e50)],
    ),
  ),
  sunnyCloudy(
    iconPath: 'assets/sunnyCloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFf46b45), Color(0xFFeea849)],
    ),
  ),
  veryCloudy(
    iconPath: 'assets/veryCloudy.png',
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF606c88), Color(0xFF3f4c6b)],
    ),
  );

  const WeatherType({required this.iconPath, required this.gradient});

  final String iconPath;
  final LinearGradient gradient;

  // Helper to safely load image
  Widget getIconWidget({double size = 35}) {
    return Image.asset(
      iconPath,
      width: size,
      height: size,
      color: Colors.white,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.cloud, size: size, color: Colors.white);
      },
    );
  }
}

// City Weather Enum - now using a list for easier management
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

  // Formatted temperature display
  String get currentTempDisplay => '${currentTemp.toStringAsFixed(1)}°C';
  String get minTempDisplay => 'Min ${minTemp.toStringAsFixed(1)}°C';
  String get maxTempDisplay => 'Max ${maxTemp.toStringAsFixed(1)}°C';
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
        child: Stack(
          children: [
            // Decorative gradient circle in bottom-right
            Positioned(
              right: -30.0,
              bottom: -30.0,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),

            // Weather content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  // Left side - Weather icon
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: weather.weatherType.getIconWidget(size: 35),
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
                          weather.minTempDisplay,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14.0,
                          ),
                        ),

                        // Max temperature
                        Text(
                          weather.maxTempDisplay,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Right side - Current temperature (large)
                  Text(
                    weather.currentTempDisplay,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
