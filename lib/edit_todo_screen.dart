import 'package:code_practice_with_flutter/todo_list_screen.dart';
import 'package:flutter/material.dart';

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({super.key});

  @override
  State<EditTodoScreen> createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<EditTodoScreen> {

  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EDIT TODO',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return "Please Type Title";
                  } return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please Type Description";
                  }
                  return null;
                },
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
                    onPressed: () {

                      if(_formkey.currentState!.validate()){
                        
                        Navigator.pop(context);
                        
                      }

                    }, child: const Text('Update')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
