import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:personal_expenses/presentation/screens/expenses.dart';
import 'AddEntryScreen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _currentDate = DateTime.now();

  // Task for change time
  @override
  Widget build(BuildContext context) {
    void changeMonth(int monthsToAdd) {
      setState(() {
        _currentDate = DateTime(
          _currentDate.year,
          _currentDate.month + monthsToAdd,
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_left),
                  onPressed: () {
                    changeMonth(-1); // change the month to previous
                  },
                ),
                // edite the part of container to show the month picker when press
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final DateTime? picked = await showMonthPicker(
                        context: context,
                        initialDate: _currentDate,
                        // current date
                        firstDate: DateTime(2020),
                        // first year select
                        lastDate: DateTime(2030), // last year maximum
                      );
                      if (picked != null && picked != _currentDate) {
                        setState(() {
                          _currentDate =
                              picked; // update date when select month
                        });
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.black54),
                        const SizedBox(width: 8.0),
                        Text(
                          DateFormat.yMMMM().format(_currentDate),
                          // show month
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_right),
                  onPressed: () {
                    changeMonth(1); // change month to next
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoCard('Income', '\$ 0', Icons.account_balance),
                _buildInfoCard(
                    'Balance', '\$ 200', Icons.account_balance_wallet,
                    isGreen: true),
                _buildInfoCard('Expenses', '\$ 0', Icons.money_off),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Today',
                        style:
                            TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      const Text(
                        'Total \$ 65',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Expenses(),),);
                        },
                        child: const Text(
                          'View all',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ),
                      ),

                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.blueAccent, // Border color
                        width: 1, // Border width
                      ),
                      color: Colors.blue.shade200,
                    ),
                    width: double.infinity,
                    height: 60,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                              'assets/images/logo_app.jpg'),
                        ),
                        SizedBox(width: 2,),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Food'),
                            Text('October 7'),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Center(child: Text('\$10.0'),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const AddEntryScreen(), // افتح واجهة AddEntryScreen
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon,
      {bool isGreen = false}) {
    return Card(
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, size: 24.0, color: Colors.black54),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: isGreen ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              title,
              style: const TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
