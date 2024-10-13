import 'package:flutter/material.dart';
import 'package:personal_expenses/data/local_services/database_helper.dart';
import 'package:personal_expenses/data/model/models.dart'; // تأكد من استيراد موديل User

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  bool isLoading = false;


  Future<void> loadUsers() async {
    isLoading = true;
    notifyListeners();
    _users = await DatabaseHelper().getAllUsers();
    isLoading = false;
    notifyListeners();
  }

  Future<void> addUser(User user) async {
    isLoading = true;
    notifyListeners();
    await DatabaseHelper().insertUser(user);
    await loadUsers();
  }


  Future<void> deleteUser(int id) async {
    await DatabaseHelper().deleteUser(id);
    await loadUsers();
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    await DatabaseHelper().updateUser(user);
    await loadUsers();
    notifyListeners();
  }
}
