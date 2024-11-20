import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class HabitsScreen extends StatefulWidget {
  @override
  _HabitsScreenState createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  final _habitController = TextEditingController();
  final _dbHelper = DatabaseHelper.instance;
  List<Map> _habits = [];

  @override
  void initState() {
    super.initState();
    _fetchHabits();
  }

  Future<void> _fetchHabits() async {
    final db = await _dbHelper.database;
    final habits = await db.query('habits');
    setState(() {
      _habits = habits;
    });
  }

  Future<void> _addHabit(String name) async {
    final db = await _dbHelper.database;
    await db.insert('habits', {'name': name, 'streak': 0});
    _fetchHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Habit Tracker")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _habitController,
              decoration: InputDecoration(
                labelText: "Habit Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addHabit(_habitController.text);
              _habitController.clear();
            },
            child: Text("Add Habit"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _habits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_habits[index]['name']),
                  subtitle: Text("Streak: ${_habits[index]['streak']} days"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}