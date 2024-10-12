import '../model/models.dart'; // تأكد من استيراد موديلاتك (User, Category, Expense, Settings)
import 'package:personal_expenses/data/local_services/database_helper.dart'; // تأكد من استيراد DatabaseHelper

class Repository {
  final DatabaseHelper localDb = DatabaseHelper(); // تأكد من تعريف localDb كـ DatabaseHelper

  // Users
  Future<List<User>> getAllUsers() async {
    return await localDb.getAllUsers();
  }

  Future<int> insertUser(User user) async {
    return localDb.insertUser(user);
  }

  Future<int> updateUser(User user) async {
    return localDb.updateUser(user);
  }

  Future<int> deleteUser(int id) async {
    return localDb.deleteUser(id);
  }

  // Categories
  Future<List<Category>> getAllCategories() async {
    return await localDb.getAllCategories();
  }

  Future<int> insertCategory(Category category) async {
    return localDb.insertCategory(category);
  }

  Future<int> updateCategory(Category category) async {
    return localDb.updateCategory(category);
  }

  Future<int> deleteCategory(int id) async {
    return localDb.deleteCategory(id);
  }

  // Expenses
  Future<List<Expense>> getAllExpenses() async {
    return await localDb.getAllExpenses();
  }

  Future<int> insertExpense(Expense expense) async {
    return localDb.insertExpense(expense);
  }

  Future<List<Expense>> getExpensesForUser(int userId) async {
    return localDb.getExpensesForUser(userId);
  }

  Future<int> deleteExpense(int id) async {
    return localDb.deleteExpense(id);
  }

  // Settings
  Future<Settings?> getSettings() async {
    return await localDb.getSettings();
  }

  Future<int> insertSettings(Settings settings) async {
    return localDb.insertSettings(settings);
  }

  Future<int> updateSettings(Settings settings) async {
    return localDb.updateSettings(settings);
  }
}
