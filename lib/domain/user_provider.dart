import 'package:flutter/material.dart';
import 'package:personal_expenses/data/local_services/database_helper.dart';
import 'package:personal_expenses/data/model/models.dart'; // تأكد من استيراد موديل User

class UserProvider with ChangeNotifier {
  List<User> _users = []; // قائمة المستخدمين

  List<User> get users => _users; // إرجاع قائمة المستخدمين

  bool isLoading = false; // حالة التحميل

  // تحميل المستخدمين من قاعدة البيانات
  Future<void> loadUsers() async {
    isLoading = true;
    notifyListeners(); // تحديث حالة التحميل
    _users = await DatabaseHelper().getAllUsers(); // جلب المستخدمين من قاعدة البيانات
    isLoading = false;
    notifyListeners(); // إبلاغ واجهات المستخدم بعد التحديث
  }

  // إضافة مستخدم جديد إلى قاعدة البيانات
  Future<void> addUser(User user) async {
    isLoading = true;
    notifyListeners(); // تحديث حالة التحميل
    await DatabaseHelper().insertUser(user); // إدخال المستخدم الجديد
    await loadUsers(); // تحميل المستخدمين مرة أخرى بعد الإضافة
  }

  // حذف مستخدم من قاعدة البيانات
  Future<void> deleteUser(int id) async {
    await DatabaseHelper().deleteUser(id); // حذف المستخدم بناءً على معرفه
    await loadUsers(); // تحميل المستخدمين مرة أخرى بعد الحذف
    notifyListeners(); // تحديث واجهات المستخدم
  }

  // تحديث معلومات مستخدم موجود
  Future<void> updateUser(User user) async {
    await DatabaseHelper().updateUser(user); // تحديث بيانات المستخدم
    await loadUsers(); // تحميل المستخدمين مرة أخرى بعد التعديل
    notifyListeners(); // تحديث واجهات المستخدم
  }
}
