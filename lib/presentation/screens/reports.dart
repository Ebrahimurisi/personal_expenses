import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsPage extends StatefulWidget {
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
        title: Text('My Expenses'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
            SizedBox(height: 16),

            // Line Chart Section
            Text(
              'Expense Trends',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return Text('Jan');
                              case 2:
                                return Text('Feb');
                              case 4:
                                return Text('Mar');
                              case 6:
                                return Text('Apr');
                              case 8:
                                return Text('May');
                              case 10:
                                return Text('Jun');
                              default:
                                return Text('');
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
                          FlSpot(0, 50),
                          FlSpot(2, 100),
                          FlSpot(4, 75),
                          FlSpot(6, 150),
                          FlSpot(8, 200),
                          FlSpot(10, 180),
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
            SizedBox(height: 16),

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
                    offset: Offset(0, 3),
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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
