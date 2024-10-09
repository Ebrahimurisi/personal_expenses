import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:personal_expenses/presentation/screens/expenses.dart';
import 'AddEntryScreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _currentDate = DateTime.now();

  // Task for change time
  @override
  Widget build(BuildContext context) {
    void _changeMonth(int monthsToAdd) {
      setState(() {
        _currentDate = DateTime(
          _currentDate.year,
          _currentDate.month + monthsToAdd,
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    _changeMonth(-1); // change the month to previous
                  },
                ),
                // edite the part of container to show the month picker when press
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.red[200],
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
                    _changeMonth(1); // change month to next
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
                      Spacer(),
                      Text(
                        'Total \$ 65',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Expenses(),),);;
                        },
                        child: const Text(
                          'View all',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ),
                      ),

                    ],
                  ),

                 ListTile(
                   tileColor: Colors.blueAccent,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15)
                   ),
                   leading: CircleAvatar(
                     backgroundImage: NetworkImage("https://media.istockphoto.com/id/167288271/photo/serious-young-woman-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=9ji0oEfhSexSpqRbrqiZT6Wubkbzcyn_yEHOedZ7ijw="),

                   ),
                   title: Text("Rahf alruhmi"),
                   subtitle: Text("Octobar 2023 4"),
                   trailing: Text("cost \$ 233 "),
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
                  AddEntryScreen(), // افتح واجهة AddEntryScreen
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon,
      {bool isGreen = false}) {
    return Card(
      child: Container(
        width: 100,
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, size: 24.0, color: Colors.black54),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: isGreen ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              title,
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
