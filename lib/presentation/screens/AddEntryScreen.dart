import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEntryScreen extends StatefulWidget {
  @override
  _AddEntryScreenState createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedCategory = 'Donations and Gifts'; // الفئة الافتراضية
  String _selectedPaymentMethod = 'Cash'; // طريقة الدفع الافتراضية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Financial Entry'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // حقل المبلغ
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Amount', // النص التوضيحي
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, // نوع لوحة المفاتيح: أرقام
            ),
            SizedBox(height: 16.0),

            // حقل الفئة
            Row(
              children: [
                Icon(Icons.category, color: Colors.black54),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    _selectedCategory, // عرض الفئة المختارة
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    _showCategoryPicker(context); // اختيار الفئة عند الضغط
                  },
                ),
              ],
            ),
            Divider(),

            // حقل طريقة الدفع
            Row(
              children: [
                Icon(Icons.account_balance_wallet, color: Colors.black54),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    _selectedPaymentMethod, // عرض طريقة الدفع المختارة
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    _showPaymentMethodPicker(context); // اختيار طريقة الدفع عند الضغط
                  },
                ),
              ],
            ),
            Divider(),

            // حقل الملاحظات
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Notes', // النص التوضيحي
                prefixIcon: Icon(Icons.notes),
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // السماح بثلاثة أسطر
            ),
            SizedBox(height: 16.0),

            // حقل التاريخ والوقت
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // اختيار التاريخ
                InkWell(
                  onTap: () => _selectDate(context),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 8.0),
                      Text(
                        DateFormat.yMd().format(_selectedDate), // عرض التاريخ المختار
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),

                // اختيار الوقت
                InkWell(
                  onTap: () => _selectTime(context),
                  child: Row(
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: 8.0),
                      Text(
                        _selectedTime.format(context), // عرض الوقت المختار
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),

            // زر الإضافة
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // إغلاق الشاشة بعد الضغط على "Add"
                },
                child: Text('Add'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // زر بعرض كامل
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة لاختيار الفئة
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

  // دالة لاختيار طريقة الدفع
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
              title: Text('Bank Transfer'),
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = 'Bank Transfer';
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // اختيار التاريخ
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  // اختيار الوقت
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }
}
