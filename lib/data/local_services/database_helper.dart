import 'package:sqflite/sqflite.dart';
import '../local_db/database.dart';
import '../model/models.dart';


class DatabaseHelper {
  Future<Database> get db async => await DatabaseProvider.getDatabaseInstance();

  //User Table

  Future<int> insertUser(User user) async {
    final database = await db;
    return await database.insert(
      'users',
      user.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> getAllUsers() async {
    final database = await db;
    final List<Map<String, dynamic>> result = await database.query('users');
    return result.map((map) => User.fromJson(map)).toList();
  }

  Future<int> updateUser(User user) async {
    final database = await db;
    return await database.update(
      'users',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final database = await db;
    return await database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Category Table

  Future<int> insertCategory(Category category) async {
    final database = await db;
    return await database.insert(
      'categories',
      category.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Category>> getAllCategories() async {
    final database = await db;
    final List<Map<String, dynamic>> result = await database.query('categories');
    return result.map((map) => Category.fromJson(map)).toList();
  }

  Future<int> updateCategory(Category category) async {
    final database = await db;
    return await database.update(
      'categories',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> deleteCategory(int id) async {
    final database = await db;
    return await database.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Expense Table

  Future<int> insertExpense(Expense expense) async {
    final database = await db;
    return await database.insert(
      'expenses',
      expense.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Expense>> getAllExpenses() async {
    final database = await db;
    final List<Map<String, dynamic>> result = await database.query('expenses');
    return result.map((map) => Expense.fromJson(map)).toList();
  }


  Future<List<Expense>> getExpensesForUser(int userId) async {
    final database = await db;
    final List<Map<String, dynamic>> result = await database.query(
      'expenses',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return result.map((map) => Expense.fromJson(map)).toList();
  }

  //Setting Table

  Future<int> insertSettings(Settings settings) async {
    final database = await db;
    return await database.insert(
      'settings',
      settings.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Settings?> getSettings() async {
    final database = await db;
    final List<Map<String, dynamic>> result = await database.query('settings');
    if (result.isNotEmpty) {
      return Settings.fromJson(result.first);
    }
    return null;
  }


  Future<int> updateSettings(Settings settings) async {
    final database = await db;
    return await database.update(
      'settings',
      settings.toJson(),
      where: 'id = ?',
      whereArgs: [settings.id],
    );
  }
}
