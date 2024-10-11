import 'package:flutter/cupertino.dart';

import '../data/local_services/database_helper.dart';
import '../data/model/models.dart';

class ExpenseController extends ChangeNotifier{

  bool isLoading = false;

  DatabaseHelper db = DatabaseHelper();

  Future<void> createExpense(Expense expense) async{

    toggleLoading(true);
    await db.insertExpense(expense);

    toggleLoading(false);

  }

  toggleLoading(bool value){

    isLoading = value;
    notifyListeners();
  }
}