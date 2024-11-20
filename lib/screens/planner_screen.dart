import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class PlannerScreen extends StatefulWidget {
  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  final _taskController = TextEditingController();
  final _dbHelper = DatabaseHelper.instance;
  List<Map> _tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final db = await _dbHelper.database;
    final tasks = await db.query('tasks');
    setState(() {
      _tasks = tasks;
    });
  }

  Future<void> _addTask(String name) async {
    final db = await _dbHelper.database;
    await db.insert('tasks', {'name': name, 'priority': 'Normal'});
    _fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Planner")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: "Task Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addTask(_taskController.text);
              _taskController.clear();
            },
            child: Text("Add Task"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]['name']),
                  subtitle: Text("Priority: ${_tasks[index]['priority']}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}