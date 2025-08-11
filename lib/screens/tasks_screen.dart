// lib/screens/tasks_screen.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_connect/models/task_model.dart'; // Import our new model

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Task> _tasks = [];
  final TextEditingController _taskController = TextEditingController();
  static const String _tasksKey = 'tasks_list_key';

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Load tasks when the app starts
  }

  // ---- CRUD Logic ----

  // READ from local storage
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> taskListJson = prefs.getStringList(_tasksKey) ?? [];
    setState(() {
      _tasks.clear();
      _tasks.addAll(taskListJson.map((json) => Task.fromJson(json)));
    });
  }

  // Helper method to SAVE all tasks to local storage
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> taskListJson =
        _tasks.map((task) => task.toJson()).toList();
    await prefs.setStringList(_tasksKey, taskListJson);
  }

  // CREATE a new task
  void _addTask(String title) {
    if (title.isNotEmpty) {
      final newTask = Task(id: DateTime.now().toString(), title: title);
      setState(() {
        _tasks.add(newTask);
      });
      _saveTasks();
      _taskController.clear();
      FocusScope.of(context).unfocus(); // Close keyboard
    }
  }

  // UPDATE an existing task's completion status
  void _toggleTaskStatus(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
    _saveTasks();
  }

  // UPDATE an existing task's title
  void _editTaskTitle(Task task, String newTitle) {
    if (newTitle.isNotEmpty) {
      setState(() {
        task.title = newTitle;
      });
      _saveTasks();
    }
  }

  // DELETE a task
  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((task) => task.id == id);
    });
    _saveTasks();
  }

  // ---- UI ----

  // Dialog for editing a task
  void _showEditTaskDialog(Task task) {
    final editController = TextEditingController(text: task.title);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF172A46),
        title: const Text('Edit Mission'),
        content: TextField(
          controller: editController,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'New mission title'),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent),
            child: const Text('Save', style: TextStyle(color: Colors.black)),
            onPressed: () {
              _editTaskTitle(task, editController.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mission Control'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A192F), Color(0xFF172A46), Color(0xFF304878)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Input field for adding new tasks
            _buildAddTaskUI(),
            // List of tasks
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(child: Text("No missions assigned. Add one!"))
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];
                        return _buildTaskCard(task);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // UI for the input field
  Widget _buildAddTaskUI() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: 'Add a new mission...',
                filled: true,
                fillColor: const Color(0xFF0A192F).withOpacity(0.7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (value) => _addTask(value),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.add_task),
            iconSize: 30,
            color: Colors.lightBlueAccent,
            onPressed: () => _addTask(_taskController.text),
          )
        ],
      ),
    );
  }

  // UI for a single task card
  Widget _buildTaskCard(Task task) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Checkbox(
          value: task.isDone,
          onChanged: (value) => _toggleTaskStatus(task),
          activeColor: Colors.lightBlueAccent,
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            color: task.isDone ? Colors.white54 : Colors.white,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_note, color: Colors.greenAccent),
              onPressed: () => _showEditTaskDialog(task),
            ),
            IconButton(
              icon: const Icon(Icons.delete_forever, color: Colors.redAccent),
              onPressed: () => _deleteTask(task.id),
            ),
          ],
        ),
      ),
    );
  }
}
