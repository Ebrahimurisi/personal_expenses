import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/models.dart';
import '../../domain/category_provider.dart';

class CategoryManagementScreen extends StatelessWidget {
  const CategoryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Management'),
        centerTitle: true,
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, _) {
          if (categoryProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (categoryProvider.categories.isEmpty) {
            return const Center(child: Text('No categories available'));
          }

          return ListView.builder(
            itemCount: categoryProvider.categories.length,
            itemBuilder: (context, index) {
              final category = categoryProvider.categories[index];
              return ListTile(
                title: Text(category.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showCategoryForm(context, category: category);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        categoryProvider.deleteCategory(category.id!);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCategoryForm(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCategoryForm(BuildContext context, {Category? category}) {
    final nameController = TextEditingController(text: category?.name ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(category == null ? 'Add Category' : 'Edit Category'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Category Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
                if (category == null) {
                  final newCategory = Category(name: nameController.text);
                  categoryProvider.addCategory(newCategory);
                } else {
                  final updatedCategory = Category(
                    id: category.id,
                    name: nameController.text,
                  );
                  categoryProvider.updateCategory(updatedCategory);
                }
                Navigator.pop(context);
              },
              child: Text(category == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }
}
