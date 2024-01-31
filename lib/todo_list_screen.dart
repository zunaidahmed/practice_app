import 'package:code_practice_with_flutter/add_new_todo_screen.dart';
import 'package:code_practice_with_flutter/edit_todo_screen.dart';
import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todos',
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text('Todo Title'),
            subtitle: const Text('Todo Body'),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: showDialogConfirmation,
                  icon: const Icon(Icons.delete_forever_outlined),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditTodoScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 12,
            indent: 16,
            color: Colors.grey.shade200,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewTodoScreen()));
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }

  void showDialogConfirmation() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete Todo'),
            content: const Text('Are you want to sure?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sure,Delete',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          );
        });
  }
}
