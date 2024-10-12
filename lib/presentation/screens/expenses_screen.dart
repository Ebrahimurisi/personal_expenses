import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personal_expenses/domain/expense_provider.dart';  // استيراد مزود النفقات
import 'package:personal_expenses/data/model/models.dart';  // استيراد نموذج النفقات
import 'package:intl/intl.dart';  // مكتبة لتنسيق التاريخ

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  void initState() {
    super.initState();
    // تحميل النفقات عند فتح الشاشة
    Provider.of<ExpenseProvider>(context, listen: false).loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        centerTitle: true,
      ),
      body: Consumer<ExpenseProvider>(
        builder: (context, expenseProvider, _) {
          // عرض مؤشر التحميل إذا كانت البيانات قيد التحميل
          if (expenseProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // عرض رسالة إذا لم تكن هناك نفقات
          if (expenseProvider.expenses.isEmpty) {
            return const Center(child: Text('No expenses available'));
          }

          // عرض قائمة النفقات إذا كانت متوفرة
          return ListView.builder(
            itemCount: expenseProvider.expenses.length,
            itemBuilder: (context, index) {
              final expense = expenseProvider.expenses[index];
              // تنسيق التاريخ
              String formattedDate = DateFormat.yMMMMd().format(DateTime.parse(expense.date));

              return ListTile(
                title: Text('Amount: \$${expense.amount.toStringAsFixed(2)}'),
                subtitle: Text(
                  'Category: ${expense.categoryName}, Date: $formattedDate',  // عرض اسم الفئة
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // زر تعديل النفقات
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showEditExpenseForm(context, expense);  // استدعاء واجهة التعديل
                      },
                    ),
                    // زر حذف النفقات
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        // تأكيد قبل الحذف
                        bool? confirmDelete = await _showDeleteConfirmation(context);
                        if (confirmDelete == true) {
                          await expenseProvider.deleteExpense(expense.id!);  // حذف النفقات
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Expense deleted successfully')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // واجهة تعديل النفقات
  void _showEditExpenseForm(BuildContext context, Expense expense) {
    final amountController = TextEditingController(text: expense.amount.toString());
    final descriptionController = TextEditingController(text: expense.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // إغلاق النافذة
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // تحديث البيانات في قاعدة البيانات
                final updatedExpense = Expense(
                  id: expense.id,
                  amount: double.tryParse(amountController.text) ?? expense.amount,
                  description: descriptionController.text,
                  categoryId: expense.categoryId,
                  date: expense.date,
                  userId: expense.userId,
                  categoryName: expense.categoryName,  // الاحتفاظ باسم الفئة
                );
                Provider.of<ExpenseProvider>(context, listen: false).updateExpense(updatedExpense);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Expense updated successfully')),
                );
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  // واجهة تأكيد الحذف
  Future<bool?> _showDeleteConfirmation(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Expense'),
          content: const Text('Are you sure you want to delete this expense?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
