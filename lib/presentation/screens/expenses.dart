import 'package:flutter/material.dart';
import 'package:personal_expenses/presentation/screens/AddEntryScreen.dart';


class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final control = ExpensesItem();
  String _selectedTime = 'Filter'; // Default value for the time dropdown
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back))
        ],
        title: const Text("All expenses"),
        leading: IconButton(
          icon: const Icon(Icons.filter_list),
          // Use the filter icon from Material Icons
          onPressed: () {
            // Show the dropdown menu using a popup menu
            showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(0, 50, 0, 0),
              // Position the menu
              items: const [
                PopupMenuItem<String>(
                  value: 'Today',
                  child: Text('Today'),
                ),
                PopupMenuItem<String>(
                  value: 'Last 7 Days',
                  child: Text('Last 7 Days'),
                ),
                PopupMenuItem<String>(
                  value: 'Last 30 Days',
                  child: Text('Last 30 Days'),
                ),
                PopupMenuItem<String>(
                  value: 'Last 365 Days',
                  child: Text('Last 365 Days'),
                ),
                PopupMenuItem<String>(
                  value: 'Since Starting',
                  child: Text('Since Starting'),
                ),
              ],
            ).then((newValue) {
              // Handle menu item selection
              if (newValue != null) {
                setState(() {
                  _selectedTime = newValue;
                });
              }
            });
          },
        ),


      ),

      body: ListView.builder(
          itemCount: control.items.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            'assets/images/logo_app.jpg'),
                      ),
                      const SizedBox(width: 2,),
                      const Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Food'),
                          Text('October 7'),
                        ],
                      ),
                      const Spacer(),
                      const Center(child: Text('\$10.0')),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddEntryScreen(),),);
                          }, icon: const Icon(Icons.update))
                        ],
                      )
                    ],
                  ),
                )
            );
          }),
    );
  }


}


class ExpensesList {

  String title, subtitle, cost, avatar;

  ExpensesList(this.title, this.subtitle, this.cost, this.avatar);
}

class ExpensesItem {
  List<ExpensesList> items = [
    ExpensesList('food', 'octobar 2024 4', '\$ 10.0',
        'https://media.istockphoto.com/id/167288271/photo/serious-young-woman-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=9ji0oEfhSexSpqRbrqiZT6Wubkbzcyn_yEHOedZ7ijw='),
    ExpensesList('food', 'octobar 2024 4', '\$ 10.0',
        'https://media.istockphoto.com/id/167288271/photo/serious-young-woman-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=9ji0oEfhSexSpqRbrqiZT6Wubkbzcyn_yEHOedZ7ijw='),
    ExpensesList('food', 'octobar 2024 4', '\$ 10.0',
        'https://media.istockphoto.com/id/167288271/photo/serious-young-woman-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=9ji0oEfhSexSpqRbrqiZT6Wubkbzcyn_yEHOedZ7ijw='),
  ];
}
