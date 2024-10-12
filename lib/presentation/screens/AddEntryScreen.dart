import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/data/model/models.dart';
import 'package:personal_expenses/domain/expense_provider.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/theme_provider.dart'; // استيراد ThemeProvider

class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({super.key});

  @override
  _AddEntryScreenState createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedCategory = 'Donations and Gifts'; // الفئة الافتراضية

  // Controllers لالتقاط إدخال المستخدم للمبلغ والملاحظات
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  // معرف المستخدم الوهمي (يمكن استبداله بالمعرف الفعلي)
  int userId = 1;

  @override
  void dispose() {
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // الوصول إلى ThemeProvider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Financial Entry'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ExpenseProvider>(
          builder: (BuildContext context, ExpenseProvider p, Widget? child) {
            return Stack(
              children: [
                if (p.isLoading) const CircularProgressIndicator(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // حقل إدخال المبلغ
                    TextFormField(
                      controller: _amountController,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16.0),

                    // منتقي الفئة
                    Row(
                      children: [
                        const Icon(Icons.category, color: Colors.black54),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            _selectedCategory,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            _showCategoryPicker(context);
                          },
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 16.0),

                    // حقل إدخال الملاحظات
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        labelText: 'Notes',
                        prefixIcon: Icon(Icons.notes),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16.0),

                    // منتقي التاريخ والوقت
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // اختيار التاريخ
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 8.0),
                              Text(
                                DateFormat.yMd().format(_selectedDate),
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),

                        // اختيار الوقت
                        InkWell(
                          onTap: () => _selectTime(context),
                          child: Row(
                            children: [
                              const Icon(Icons.access_time),
                              const SizedBox(width: 8.0),
                              Text(
                                _selectedTime.format(context),
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),

                    // زر الإضافة
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          final String amountInput = _amountController.text;

                          // التحقق من صحة إدخال المبلغ
                          if (amountInput.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please enter an amount')),
                            );
                            return;
                          }

                          // تحويل المبلغ إلى double
                          final double amount = double.tryParse(amountInput) ?? 0.0;

                          // التحقق من صحة المبلغ
                          if (amount <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Invalid amount')),
                            );
                            return;
                          }

                          // إنشاء كائن النفقة
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

                          // حفظ النفقة
                          p.addExpense(expense);

                          // إغلاق الشاشة
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Add'),
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

  // وظيفة مساعد لتحديد معرف الفئة
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

  // عرض منتقي الفئات
  void _showCategoryPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            ListTile(
              title: const Text('Donations and Gifts'),
              onTap: () {
                setState(() {
                  _selectedCategory = 'Donations and Gifts';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Food and Drinks'),
              onTap: () {
                setState(() {
                  _selectedCategory = 'Food and Drinks';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Utilities'),
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

  // منتقي التاريخ
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

  // منتقي الوقت
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
