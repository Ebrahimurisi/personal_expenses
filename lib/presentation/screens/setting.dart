import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the ThemeProvider from the widget tree
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor:
            themeProvider.isLightTheme ? Colors.white : Colors.grey[900],
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Theme Mode Section
          const Text(
            'Theme Mode',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildThemeButton(context, true, themeProvider.isLightTheme),
              _buildThemeButton(context, false, themeProvider.isLightTheme),
            ],
          ),
          const Divider(height: 32.0),

          // Language Section
          ListTile(
            leading: const Icon(Icons.language, color: Colors.black54),
            title: const Text(
              'Language',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          const Divider(height: 32.0),

          // "Tell us a problem or leave a comment" Section
          ListTile(
              leading: const Icon(Icons.comment, color: Colors.black54),
              title: const Text(
                'Tell us a problem or leave a comment',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              onTap: () => _showCommentSheet(context)),
        ],
      ),
    );
  }

  // Function to show the bottom sheet for comments
  void _showCommentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            top: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What's wrong?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tell us your problem or leave a comment',
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Build Theme Mode Button
  Widget _buildThemeButton(
      BuildContext context, bool isLight, bool currentMode) {
    // Get the ThemeProvider from the context
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        // Toggle the theme when tapped
        themeProvider.toggleTheme(isLight);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: currentMode == isLight ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24.0),
          border:
              currentMode == isLight ? Border.all(color: Colors.blue) : null,
        ),
        child: Text(
          isLight ? 'Light Mode' : 'Dark Mode',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: currentMode == isLight ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}

