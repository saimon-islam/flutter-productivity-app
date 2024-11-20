import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class MoodsScreen extends StatelessWidget {
  final _moods = ["Happy", "Neutral", "Sad"];
  final _dbHelper = DatabaseHelper.instance;

  Future<void> _saveMood(String mood) async {
    final db = await _dbHelper.database;
    await db.insert('moods', {'date': DateTime.now().toString(), 'mood': mood});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mood Tracker")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Select Your Mood Today:"),
          for (var mood in _moods)
            ElevatedButton(
              onPressed: () => _saveMood(mood),
              child: Text(mood),
            ),
        ],
      ),
    );
  }
}