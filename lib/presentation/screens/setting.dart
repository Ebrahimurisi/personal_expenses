import 'package:flutter/material.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _themeMode = 'System Mode'; // الوضع الافتراضي

  // الوظيفة التي تعرض النافذة المنبثقة عند النقر على "Tell us a problem or leave a comment"
  void _showCommentSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
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
              Text(
                "What's wrong?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tell us your problem or leave a comment',
                ),
                maxLines: 4, // عدد الأسطر المسموح بها في مربع النص
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // إغلاق النافذة بعد الضغط على زر "Submit"
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // لون الزر
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // قسم Theme Mode
          Text(
            'Theme Mode',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildThemeButton('Light mode'),
              _buildThemeButton('Dark mode'),
            ],
          ),
          Divider(height: 32.0),

          // قسم اللغة
          ListTile(
            leading: Icon(Icons.language, color: Colors.black54),
            title: Text(
              'Language',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            onTap: () {},
          ),
          Divider(height: 32.0),

          // قسم "Tell us a problem or leave a comment"
          ListTile(
            leading: Icon(Icons.comment, color: Colors.black54),
            title: Text(
              'Tell us a problem or leave a comment',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            onTap: _showCommentSheet, // استدعاء النافذة عند النقر
          ),
        ],
      ),
    );
  }

  // بناء زر وضع الثيم
  Widget _buildThemeButton(String mode) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _themeMode = mode;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: _themeMode == mode ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24.0),
          border: _themeMode == mode ? Border.all(color: Colors.blue) : null,
        ),
        child: Text(
          mode,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: _themeMode == mode ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}
