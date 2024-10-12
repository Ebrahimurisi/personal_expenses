import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/models.dart';

class DatabaseHelper {
  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  // الحصول على قاعدة البيانات
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // تهيئة قاعدة البيانات وإنشاء الجداول
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'expenses.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // جدول النفقات
        await db.execute('''
          CREATE TABLE expenses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount REAL,
            description TEXT,
            categoryId INTEGER,
            date TEXT,
            userId INTEGER
          )
        ''');

        // جدول المستخدمين
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT UNIQUE,
            password TEXT
          )
        ''');

        // جدول الفئات
        await db.execute('''
          CREATE TABLE categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');

        // جدول الإعدادات
        await db.execute('''
          CREATE TABLE settings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            language TEXT,
            theme TEXT
          )
        ''');
      },
    );
  }

  // ============== إدارة النفقات ============== //

  // جلب كل النفقات
  // جلب كل النفقات
  // تعديل طريقة جلب النفقات مع اسم الفئة الصحيح
  Future<List<Expense>> getAllExpenses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
    SELECT expenses.*, categories.name AS categoryName 
    FROM expenses 
    JOIN categories ON expenses.categoryId = categories.id
  ''');

    return List.generate(maps.length, (i) {
      return Expense(
        id: maps[i]['id'],
        amount: maps[i]['amount'],
        description: maps[i]['description'],
        categoryId: maps[i]['categoryId'],
        date: maps[i]['date'],
        userId: maps[i]['userId'],
        categoryName: maps[i]['categoryName'], // جلب اسم الفئة الصحيح
      );
    });
  }


  // جلب النفقات بناءً على userId
  Future<List<Expense>> getExpensesForUser(int userId) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'expenses',
      where: 'userId = ?', // تحديد المستخدم بناءً على userId
      whereArgs: [userId],
    );
    return result.map((json) => Expense.fromJson(json)).toList();
  }

  // إدخال نفقات جديدة
  Future<int> insertExpense(Expense expense) async {
    final db = await database;
    return await db.insert(
      'expenses',
      expense.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // حذف نفقة بواسطة المعرف
  Future<int> deleteExpense(int id) async {
    final db = await database;
    return await db.delete(
      'expenses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // تحديث نفقة
  Future<int> updateExpense(Expense expense) async {
    final db = await database;
    return await db.update(
      'expenses',
      expense.toJson(),
      where: 'id = ?',
      whereArgs: [expense.id],
    );
  }

  // ============== إدارة المستخدمين ============== //

  // جلب كل المستخدمين
  Future<List<User>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('users');
    return result.map((json) => User.fromJson(json)).toList();
  }

  // إدخال مستخدم جديد
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toJson());
  }

  // حذف مستخدم بواسطة المعرف
  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // تحديث بيانات المستخدم
  Future<int> updateUser(User user) async {
    final db = await database;
    return await db.update('users', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  }

  // ============== إدارة الفئات ============== //

  // جلب كل الفئات
  Future<List<Category>> getAllCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('categories');
    return result.map((json) => Category.fromJson(json)).toList();
  }

  // إدخال فئة جديدة
  Future<int> insertCategory(Category category) async {
    final db = await database;
    return await db.insert('categories', category.toJson());
  }

  // جلب فئة بناءً على categoryId
  Future<Category?> getCategoryById(int categoryId) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [categoryId],
    );

    if (result.isNotEmpty) {
      return Category.fromJson(result.first);
    }
    return null;
  }

  // حذف فئة بواسطة المعرف
  Future<int> deleteCategory(int id) async {
    final db = await database;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }

  // تحديث فئة
  Future<int> updateCategory(Category category) async {
    final db = await database;
    return await db.update('categories', category.toJson(), where: 'id = ?', whereArgs: [category.id]);
  }

  // ============== إدارة الإعدادات ============== //

  // جلب الإعدادات
  Future<Settings?> getSettings() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('settings');
    if (result.isNotEmpty) {
      return Settings.fromJson(result.first);
    }
    return null;
  }

  // إدخال إعدادات جديدة
  Future<int> insertSettings(Settings settings) async {
    final db = await database;
    return await db.insert('settings', settings.toJson());
  }

  // تحديث الإعدادات
  Future<int> updateSettings(Settings settings) async {
    final db = await database;
    return await db.update('settings', settings.toJson(), where: 'id = ?', whereArgs: [settings.id]);
  }
}
