import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  String _selectedTime = 'Today'; // Default value for the time dropdown
  String _selectedType = 'Expenses'; // Default value for the type dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown Menus Row for Time and Expense Type Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _selectedTime,
                  items: <String>['Today', 'Last 7 Days', 'Last 30 Days', 'Last 365 Days', 'Since Starting']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedTime = newValue!;
                    });
                  },
                ),
                DropdownButton<String>(
                  value: _selectedType,
                  items: <String>['Expenses', 'Income'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedType = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Line Chart Section
            const Text(
              'Expense Trends',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return const Text('Jan');
                              case 2:
                                return const Text('Feb');
                              case 4:
                                return const Text('Mar');
                              case 6:
                                return const Text('Apr');
                              case 8:
                                return const Text('May');
                              case 10:
                                return const Text('Jun');
                              default:
                                return const Text('');
                            }
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(value.toInt().toString());
                          },
                          reservedSize: 40, // Space for left labels
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 50),
                          const FlSpot(2, 100),
                          const FlSpot(4, 75),
                          const FlSpot(6, 150),
                          const FlSpot(8, 200),
                          const FlSpot(10, 180),
                        ],
                        isCurved: true,
                        barWidth: 4,
                        color: Colors.blueAccent, // Using single color instead of colors array
                        belowBarData: BarAreaData(
                          show: true,
                          color: Colors.blue.withOpacity(0.3), // Updated color usage for belowBarData
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Additional Info or Summary Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard('Total Expenses', '\$5000'),
                  _buildSummaryCard('Total Income', '\$8000'),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
    );
  }

  // Method to build a summary card for displaying total values
  Widget _buildSummaryCard(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
