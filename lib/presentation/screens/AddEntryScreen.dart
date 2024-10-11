import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/data/model/models.dart';
import 'package:personal_expenses/domain/expense_provider.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/theme_provider.dart'; // Import the ThemeProvider
import '../../data/repository/expensesRepository.dart';

class AddEntryScreen extends StatefulWidget {
  @override
  _AddEntryScreenState createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedCategory = 'Donations and Gifts'; // Default category
  String _selectedPaymentMethod = 'Cash'; // Default payment method

  // Controllers to capture user input for amount and notes
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  // Mock userId (this can be replaced with the actual userId)
  int userId = 1;

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // Access the ThemeProvider

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Financial Entry'),
        centerTitle: true,
        actions: [
          // Theme toggle switch in the AppBar
          Switch(
            value: themeProvider.isLightTheme,
            onChanged: (value) {
              themeProvider.toggleTheme(value); // Call to change theme
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ExpenseController>(
          builder: (BuildContext context, ExpenseController p, Widget? child) {
            return Stack(
              children: [
                if (p.isLoading) CircularProgressIndicator(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Amount field
                    TextFormField(
                      controller: _amountController,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16.0),

                    // Category picker
                    Row(
                      children: [
                        Icon(Icons.category, color: Colors.black54),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            _selectedCategory,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            _showCategoryPicker(context);
                          },
                        ),
                      ],
                    ),
                    Divider(),

                    // Payment method picker
                    Row(
                      children: [
                        Icon(Icons.account_balance_wallet, color: Colors.black54),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            _selectedPaymentMethod,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            _showPaymentMethodPicker(context);
                          },
                        ),
                      ],
                    ),
                    Divider(),

                    // Notes field
                    TextFormField(
                      controller: _notesController,
                      decoration: InputDecoration(
                        labelText: 'Notes',
                        prefixIcon: Icon(Icons.notes),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16.0),

                    // Date and time picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Select date
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 8.0),
                              Text(
                                DateFormat.yMd().format(_selectedDate),
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),

                        // Select time
                        InkWell(
                          onTap: () => _selectTime(context),
                          child: Row(
                            children: [
                              Icon(Icons.access_time),
                              SizedBox(width: 8.0),
                              Text(
                                _selectedTime.format(context),
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.0),

                    // Add button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final String amountInput = _amountController.text;

                          // Validate amount input
                          if (amountInput.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Please enter an amount')),
                            );
                            return;
                          }

                          // Convert amount to double
                          final double amount = double.tryParse(amountInput) ?? 0.0;

                          // Validate amount
                          if (amount <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Invalid amount')),
                            );
                            return;
                          }

                          // Construct the expense
                          Expense expense = Expense(
                            amount: amount,
                            description: _notesController.text,
                            categoryId: _getCategoryId(_selectedCategory),
                            date: DateTime(
                              _selectedDate.year,
                              _selectedDate.month,
                              _selectedDate.day,
                              _selectedTime.hour,
                              _selectedTime.minute,
                            ).toIso8601String(),
                            userId: userId,
                          );

                          // Save the expense
                          p.createExpense(expense);

                          // Close the screen
                          Navigator.pop(context);
                        },
                        child: Text('Add'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Helper function to map selected category to its ID
  int _getCategoryId(String categoryName) {
    switch (categoryName) {
      case 'Donations and Gifts':
        return 1;
      case 'Food and Drinks':
        return 2;
      case 'Utilities':
        return 3;
      default:
        return 0;
    }
  }

  // Category picker modal
  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            ListTile(
              title: Text('Donations and Gifts'),
              onTap: () {
                setState(() {
                  _selectedCategory = 'Donations and Gifts';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Food and Drinks'),
              onTap: () {
                setState(() {
                  _selectedCategory = 'Food and Drinks';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Utilities'),
              onTap: () {
                setState(() {
                  _selectedCategory = 'Utilities';
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // Payment method picker modal
  void _showPaymentMethodPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            ListTile(
              title: Text('Cash'),
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 'Cash';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Credit Card'),
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 'Credit Card';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Debit Card'),
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 'Debit Card';
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // Date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
}
