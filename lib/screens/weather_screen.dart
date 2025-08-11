import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // For date formatting

// A simple class to hold the data for a single day's forecast
class DailyForecast {
  final DateTime date;
  final String weatherCondition;
  final IconData weatherIcon;
  final double maxTemp;
  final double minTemp;

  DailyForecast({
    required this.date,
    required this.weatherCondition,
    required this.weatherIcon,
    required this.maxTemp,
    required this.minTemp,
  });
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // A list to hold our 3-day forecast
  List<DailyForecast> _forecasts = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  // Fetches the 3-day forecast from the Open-Meteo API
  Future<void> _fetchWeather() async {
    // UPDATED: Requesting daily data for the next 3 days
    final url = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=12.97&longitude=77.59&daily=weathercode,temperature_2m_max,temperature_2m_min&forecast_days=3');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['daily'];

        // Clear previous forecast data
        final List<DailyForecast> fetchedForecasts = [];

        for (int i = 0; i < data['time'].length; i++) {
          final weatherCode = data['weathercode'][i];
          fetchedForecasts.add(
            DailyForecast(
              date: DateTime.parse(data['time'][i]),
              weatherCondition: _getWeatherCondition(weatherCode),
              weatherIcon: _getWeatherIcon(weatherCode),
              maxTemp: data['temperature_2m_max'][i],
              minTemp: data['temperature_2m_min'][i],
            ),
          );
        }

        setState(() {
          _forecasts = fetchedForecasts;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Could not fetch weather data.';
        _isLoading = false;
      });
    }
  }

  // Helper functions to interpret the weather code from the API
  String _getWeatherCondition(int code) {
    // (This function can be expanded for more detail)
    switch (code) {
      case 0:
        return 'Clear Sky';
      case 1:
      case 2:
      case 3:
        return 'Cloudy';
      case 45:
      case 48:
        return 'Fog';
      case 61:
      case 63:
      case 65:
        return 'Rain';
      case 80:
      case 81:
      case 82:
        return 'Showers';
      case 95:
      case 96:
      case 99:
        return 'Thunderstorm';
      default:
        return 'Cloudy';
    }
  }

  IconData _getWeatherIcon(int code) {
    switch (code) {
      case 0:
        return Icons.wb_sunny;
      case 1:
      case 2:
      case 3:
        return Icons.cloud;
      case 45:
      case 48:
        return Icons.foggy;
      case 61:
      case 63:
      case 65:
        return Icons.water_drop;
      case 80:
      case 81:
      case 82:
        return Icons.shower;
      case 95:
      case 96:
      case 99:
        return Icons.thunderstorm;
      default:
        return Icons.cloud_outlined;
    }
  }

  // Helper to get the day's name (Today, Tomorrow, or Weekday)
  String _getDayName(DateTime date, int index) {
    if (index == 0) return 'Today';
    if (index == 1) return 'Tomorrow';
    return DateFormat('EEEE').format(date); // e.g., "Wednesday"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3-Day Forecast'),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A192F), Color(0xFF172A46), Color(0xFF304878)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : _errorMessage != null
                  ? Text(_errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 16))
                  : _buildForecastView(),
        ),
      ),
    );
  }

  // The main UI widget for displaying the 3-day forecast
  Widget _buildForecastView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Bengaluru',
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w300, letterSpacing: 2),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_forecasts.length, (index) {
            return _buildForecastCard(
              dayName: _getDayName(_forecasts[index].date, index),
              forecast: _forecasts[index],
            );
          }),
        ),
      ],
    );
  }

  // A card widget for a single day's forecast
  Widget _buildForecastCard(
      {required String dayName, required DailyForecast forecast}) {
    return Column(
      children: [
        Text(
          dayName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Icon(forecast.weatherIcon, size: 44, color: Colors.lightBlueAccent),
        const SizedBox(height: 12),
        Text(
          forecast.weatherCondition,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 20),
        Text(
          '${forecast.maxTemp.round()}°',
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        Text(
          '${forecast.minTemp.round()}°',
          style: const TextStyle(fontSize: 18, color: Colors.white54),
        ),
      ],
    );
  }
}
