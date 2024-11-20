import 'package:flutter/material.dart';
import 'planner_screen.dart';
import 'habits_screen.dart';
import 'moods_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productivity App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PlannerScreen()),
              ),
              child: Text("Task Planner"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HabitsScreen()),
              ),
              child: Text("Habit Tracker"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoodsScreen()),
              ),
              child: Text("Mood Tracker"),
            ),
          ],
        ),
      ),
    );
  }
}