class User {
  final int? id;
  final String username;
  final String password;

  User({this.id, required this.username, required this.password});

  // لتحويل كائن User إلى JSON لحفظه في قاعدة البيانات
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  // لإنشاء كائن User من JSON عند جلب البيانات من قاعدة البيانات
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }

  @override
  String toString() {
    return 'User{id: $id, username: $username, password: $password}';
  }
}

class Category {
  final int? id;
  final String name;

  Category({this.id, required this.name});

  // لتحويل كائن Category إلى JSON لحفظه في قاعدة البيانات
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // لإنشاء كائن Category من JSON عند جلب البيانات من قاعدة البيانات
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name}';
  }
}
class Expense {
  final int? id;
  final double amount;
  final String description;
  final int categoryId;
  final String date;
  final int userId;
  String? categoryName;  // إضافة اسم الفئة

  Expense({
    this.id,
    required this.amount,
    required this.description,
    required this.categoryId,
    required this.date,
    required this.userId,
    this.categoryName,
  });

  // لتحويل كائن Expense إلى JSON لحفظه في قاعدة البيانات
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'description': description,
      'categoryId': categoryId,
      'date': date,
      'userId': userId,
    };
  }

  // لإنشاء كائن Expense من JSON عند جلب البيانات من قاعدة البيانات
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      amount: json['amount'],
      description: json['description'],
      categoryId: json['categoryId'],
      date: json['date'],
      userId: json['userId'],
    );
  }
}



class Settings {
  final int? id;
  final String language;
  final String theme;

  Settings({this.id, required this.language, required this.theme});

  // لتحويل كائن Settings إلى JSON لحفظه في قاعدة البيانات
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'language': language,
      'theme': theme,
    };
  }

  // لإنشاء كائن Settings من JSON عند جلب البيانات من قاعدة البيانات
  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      id: json['id'],
      language: json['language'],
      theme: json['theme'],
    );
  }

  @override
  String toString() {
    return 'Settings{id: $id, language: $language, theme: $theme}';
  }
}
