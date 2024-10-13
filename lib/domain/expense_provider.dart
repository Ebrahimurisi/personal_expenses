import 'package:flutter/material.dart';
import 'package:personal_expenses/data/local_services/database_helper.dart';
import 'package:personal_expenses/data/model/models.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];
  bool isLoading = false;


  List<Expense> get expenses => _expenses;


  Future<void> loadExpenses() async {
    isLoading = true;
    notifyListeners();
    print("Loading expenses...");

    try {
      _expenses = await DatabaseHelper().getAllExpenses();
      print("Expenses loaded successfully: $_expenses");
    } catch (e) {
      print("Error loading expenses: $e");
    }

    isLoading = false;
    notifyListeners();
  }


  Future<void> addExpense(Expense expense) async {
    print("Adding expense: $expense");

    try {
      await DatabaseHelper().insertExpense(expense);
      print("Expense added successfully");
    } catch (e) {
      print("Error adding expense: $e");
    }

    await loadExpenses();
  }

  // حذف نفقات
  Future<void> deleteExpense(int id) async {
    print("Deleting expense with ID: $id");

    try {
      await DatabaseHelper().deleteExpense(id);
      print("Expense deleted successfully");
    } catch (e) {
      print("Error deleting expense: $e");
    }

    await loadExpenses();
  }

  Future<void> updateExpense(Expense expense) async {
    print("Updating expense: $expense");

    try {
      await DatabaseHelper().updateExpense(expense);
      print("Expense updated successfully");
    } catch (e) {
      print("Error updating expense: $e");
    }

    await loadExpenses();
  }
}
