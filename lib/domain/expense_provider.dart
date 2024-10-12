import 'package:flutter/material.dart';
import 'package:personal_expenses/data/local_services/database_helper.dart';
import 'package:personal_expenses/data/model/models.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];
  bool isLoading = false;

  // getter للحصول على قائمة النفقات
  List<Expense> get expenses => _expenses;

  // تحميل النفقات من قاعدة البيانات
  Future<void> loadExpenses() async {
    isLoading = true;
    notifyListeners();
    print("Loading expenses...");

    try {
      _expenses = await DatabaseHelper().getAllExpenses();  // جلب النفقات من قاعدة البيانات
      print("Expenses loaded successfully: $_expenses");
    } catch (e) {
      print("Error loading expenses: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  // إضافة نفقات جديدة
  Future<void> addExpense(Expense expense) async {
    print("Adding expense: $expense");

    try {
      await DatabaseHelper().insertExpense(expense);  // إضافة النفقة إلى قاعدة البيانات
      print("Expense added successfully");
    } catch (e) {
      print("Error adding expense: $e");
    }

    await loadExpenses();  // تحديث قائمة النفقات بعد الإضافة
  }

  // حذف نفقات
  Future<void> deleteExpense(int id) async {
    print("Deleting expense with ID: $id");

    try {
      await DatabaseHelper().deleteExpense(id);  // حذف النفقة من قاعدة البيانات
      print("Expense deleted successfully");
    } catch (e) {
      print("Error deleting expense: $e");
    }

    await loadExpenses();  // تحديث قائمة النفقات بعد الحذف
  }

  // تعديل نفقات موجودة
  Future<void> updateExpense(Expense expense) async {
    print("Updating expense: $expense");

    try {
      await DatabaseHelper().updateExpense(expense);  // تحديث النفقة في قاعدة البيانات
      print("Expense updated successfully");
    } catch (e) {
      print("Error updating expense: $e");
    }

    await loadExpenses();  // تحديث قائمة النفقات بعد التعديل
  }
}
