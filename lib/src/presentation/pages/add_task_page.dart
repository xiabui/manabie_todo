import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:manabie_todo/src/presentation/blocs/task/task_bloc.dart';
import 'package:manabie_todo/src/presentation/widgets/app_color.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton.icon(
            onPressed: () {
              onSavePress(context);
            },
            icon: const Icon(
              Icons.save_outlined,
              color: AppColors.primaryColor,
            ),
            label: const Text(
              'Save',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: AppColors.primaryColor,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColors.primaryColor,
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 15, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  key: const Key('input_title'),
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.fontColor,
                    ),
                  ),
                ),
                TextField(
                  key: const Key('input_content'),
                  controller: _contentController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Content',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: AppColors.fontColor,
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSavePress(BuildContext context) async {
    //Get data from text field
    String title = _titleController.text;
    String content = _contentController.text;

    //Set data to model
    TaskModel taskModel = TaskModel(
      title: title,
      content: content,
      status: 1,
    );

    BlocProvider.of<TaskBloc>(context).add(AddTask(taskModel));

    Navigator.pop(context);
    // print(addStatus);
  }
}
