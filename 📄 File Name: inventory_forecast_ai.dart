// inventory_forecast_ai.dart
class InventoryForecastAI {
  final Map<String, List<int>> salesHistory;

  InventoryForecastAI({required this.salesHistory});

  Map<String, double> forecastNextWeek() {
    Map<String, double> forecast = {};
    salesHistory.forEach((product, salesList) {
      if (salesList.isNotEmpty) {
        double avg = salesList.reduce((a, b) => a + b) / salesList.length;
        forecast[product] = avg * 1.2; // 20% buffer for growth
      } else {
        forecast[product] = 0.0;
      }
    });
    return forecast;
  }
}
