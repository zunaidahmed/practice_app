import 'package:flutter/material.dart';

class NewTodoScreen extends StatefulWidget {
  const NewTodoScreen({super.key});

  @override
  State<NewTodoScreen> createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO SCREEN',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                maxLines: 5,
                maxLength: 100,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Add')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
