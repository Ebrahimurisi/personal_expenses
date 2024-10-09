import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// إنشاء كلاس لإدارة قاعدة البيانات
class DatabaSql{

  static final DatabaSql sqlDb =DatabaSql();
  static Database? _database;

  // أسماء الجداول
  static final tableUsers = 'Users';
  static final tableExpenses = 'Expenses';
  static final tableCategories = 'Categories';
  static final tableReports = 'Reports';
  static final tableSettings = 'Settings';

  //get Database
  Future<Database?> get database async{
    if(_database==null) {
      return await initialDB();
    }
    else{
      return _database;
    }
  }

  //initial Database
  Future<Database> initialDB()async{
    String dataBasePath=await getDatabasesPath();
    String path=join(dataBasePath,'expenses_management.db');
    Database myDb= await openDatabase(path,onCreate: _onCreate,version: 1);
    return myDb;

  }
  // إنشاء الجداول
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableUsers (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        full_name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''').then((value)  {
      print('\n\n\n ================Create First Table Success Fully\n\n\n ================');
    }).catchError((onError)
    {
      print('\n\n\n ================ Can not Create Table:${onError.toString()}===========\n\n\n');
    });

    await db.execute('''
      CREATE TABLE $tableCategories (
        category_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        category_name TEXT NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES $tableUsers(user_id)
      )
    ''').then((value)  {
      print('\n\n\n ================Create First Table Success Fully\n\n\n ================');
    }).catchError((onError)
    {
      print('\n\n\n ================ Can not Create Table:${onError.toString()}===========\n\n\n');
    });

    await db.execute('''
      CREATE TABLE $tableExpenses (
        expense_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        expense_name TEXT NOT NULL,
        amount REAL NOT NULL,
        category_id INTEGER,
        expense_type TEXT CHECK(expense_type IN ('Income', 'Expense')),
        date TEXT NOT NULL,
        note TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES $tableUsers(user_id),
        FOREIGN KEY (category_id) REFERENCES $tableCategories(category_id)
      )
    ''').then((value)  {
      print('\n\n\n ================Create First Table Success Fully\n\n\n ================');
    }).catchError((onError)
    {
      print('\n\n\n ================ Can not Create Table:${onError.toString()}===========\n\n\n');
    });

    await db.execute('''
      CREATE TABLE $tableReports (
        report_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        report_name TEXT NOT NULL,
        start_date TEXT NOT NULL,
        end_date TEXT NOT NULL,
        total_income REAL,
        total_expense REAL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES $tableUsers(user_id)
      )
    ''').then((value)  {
      print('\n\n\n ================Create First Table Success Fully\n\n\n ================');
    }).catchError((onError)
    {
      print('\n\n\n ================ Can not Create Table:${onError.toString()}===========\n\n\n');
    });

    await db.execute('''
      CREATE TABLE $tableSettings (
        settings_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER,
        theme TEXT CHECK(theme IN ('Light', 'Dark')) DEFAULT 'Light',
        notifications INTEGER DEFAULT 1, 
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES $tableUsers(user_id)
      )
    ''').then((value)  {
      print('\n\n\n ================Create First Table Success Fully\n\n\n ================');
    }).catchError((onError)
    {
      print('\n\n\n ================ Can not Create Table:${onError.toString()}===========\n\n\n');
    });
  }
}
