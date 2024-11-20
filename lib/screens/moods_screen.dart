import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class MoodsScreen extends StatelessWidget {
  final _moods = ["Happy", "Neutral", "Sad"]; // This is fine.

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
              onPressed: () {
                // Handle mood selection
              },
              child: Text(mood),
            ),
        ],
      ),
    );
  }
}