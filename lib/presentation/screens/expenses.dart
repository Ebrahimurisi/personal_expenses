import 'package:flutter/material.dart';



class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final control=ExpensesItem();
  String _selectedTime = 'Filter'; // Default value for the time dropdown
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back))],
        title: Text("All expenses"),
        leading: IconButton(
          icon: Icon(Icons.filter_list), // Use the filter icon from Material Icons
          onPressed: () {
            // Show the dropdown menu using a popup menu
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(0, 50, 0, 0), // Position the menu
              items:const [
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
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(control.items[index].avatar),

                ),
                title: Text(control.items[index].title),
                subtitle: Text(control.items[index].subtitle),
                trailing: Text(control.items[index].cost),
              ),
            );


          }),
    );

  }


}


class ExpensesList{

  String title,subtitle,cost,avatar;

  ExpensesList(this.title, this.subtitle, this.cost, this.avatar);
}
class ExpensesItem{
  List<ExpensesList> items=[
    ExpensesList('food', 'octobar 2024 4', '\$ 10.0', 'https://media.istockphoto.com/id/167288271/photo/serious-young-woman-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=9ji0oEfhSexSpqRbrqiZT6Wubkbzcyn_yEHOedZ7ijw='),
    ExpensesList('food', 'octobar 2024 4', '\$ 10.0', 'https://media.istockphoto.com/id/167288271/photo/serious-young-woman-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=9ji0oEfhSexSpqRbrqiZT6Wubkbzcyn_yEHOedZ7ijw='),
    ExpensesList('food', 'octobar 2024 4', '\$ 10.0', 'https://media.istockphoto.com/id/167288271/photo/serious-young-woman-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=9ji0oEfhSexSpqRbrqiZT6Wubkbzcyn_yEHOedZ7ijw='),
  ];
}