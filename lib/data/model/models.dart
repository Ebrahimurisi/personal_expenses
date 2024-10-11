
class User {
  final int? id;
  final String username;
  final String password;

  User({this.id, required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }


  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      username: data['username'],
      password: data['password'],
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Category.fromJson(Map<String, dynamic> data) {
    return Category(
      id: data['id'],
      name: data['name'],
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

  Expense({
    this.id,
    required this.amount,
    required this.description,
    required this.categoryId,
    required this.date,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'description': description,
      'category_id': categoryId,
      'date': date,
      'user_id': userId,
    };
  }

  factory Expense.fromJson(Map<String, dynamic> data) {
    return Expense(
      id: data['id'],
      amount: data['amount'],
      description: data['description'],
      categoryId: data['category_id'],
      date: data['date'],
      userId: data['user_id'],
    );
  }

  @override
  String toString() {
    return 'Expense{id: $id, amount: $amount, description: $description, categoryId: $categoryId, date: $date, userId: $userId}';
  }
}

class Settings {
  final int? id;
  final String language;
  final String theme;

  Settings({this.id, required this.language, required this.theme});


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'language': language,
      'theme': theme,
    };
  }


  factory Settings.fromJson(Map<String, dynamic> data) {
    return Settings(
      id: data['id'],
      language: data['language'],
      theme: data['theme'],
    );
  }

  @override
  String toString() {
    return 'Settings{id: $id, language: $language, theme: $theme}';
  }
}
