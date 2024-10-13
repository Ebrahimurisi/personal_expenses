import 'package:flutter/material.dart';
import '../data/local_services/database_helper.dart';
import '../data/model/models.dart';

class CategoryProvider with ChangeNotifier {
  // Category list
  List<Category> _categories = [];

  // Getter
  List<Category> get categories => _categories;

  // stat loded
  bool isLoading = false;

  //loadCategories
  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();
    _categories = await DatabaseHelper().getAllCategories();
    isLoading = false;
    notifyListeners();
  }

  //
  Future<void> addCategory(Category category) async {
    isLoading = true;
    notifyListeners();
    await DatabaseHelper().insertCategory(category);
    await loadCategories();
    isLoading = false;
    notifyListeners();
  }

  // deleteCategory
  Future<void> deleteCategory(int id) async {
    await DatabaseHelper().deleteCategory(id);
    await loadCategories();
    notifyListeners();
  }


  Future<void> updateCategory(Category category) async {
    await DatabaseHelper().updateCategory(category);
    await loadCategories();
    notifyListeners();
  }
}
