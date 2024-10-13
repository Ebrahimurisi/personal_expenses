import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../domain/user_provider.dart';
import '../data/model/models.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        centerTitle: true,
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          if (userProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (userProvider.users.isEmpty) {
            return const Center(child: Text('No users available'));
          }

          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final user = userProvider.users[index];
              return ListTile(
                title: Text(user.username),
                subtitle: Text('ID: ${user.id}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showUserForm(context, user: user);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        userProvider.deleteUser(user.id!);
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
          _showUserForm(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showUserForm(BuildContext context, {User? user}) {
    final usernameController = TextEditingController(text: user?.username ?? '');
    final passwordController = TextEditingController(text: user?.password ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(user == null ? 'Add User' : 'Edit User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
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
                final userProvider = Provider.of<UserProvider>(context, listen: false);
                if (user == null) {
                  final newUser = User(
                    username: usernameController.text,
                    password: passwordController.text,
                  );
                  userProvider.addUser(newUser);
                } else {
                  final updatedUser = User(
                    id: user.id,
                    username: usernameController.text,
                    password: passwordController.text,
                  );
                  userProvider.updateUser(updatedUser);
                }
                Navigator.pop(context);
              },
              child: Text(user == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }
}
