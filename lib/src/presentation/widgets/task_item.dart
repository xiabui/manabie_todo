import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:manabie_todo/src/presentation/blocs/task/task_bloc.dart';
import 'package:manabie_todo/src/presentation/pages/detail_task_page.dart';
import 'package:manabie_todo/src/presentation/widgets/app_color.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  final TaskModel taskModel;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            _onTaskPress();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  key: const Key('check_box'),
                  checkColor: Colors.white,
                  value: widget.taskModel.status == 2 ? true : false,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.taskModel.status = value == true ? 2 : 1;
                      BlocProvider.of<TaskBloc>(context)
                          .add(UpdateTask(widget.taskModel));
                    });
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.taskModel.title ?? '(No title)',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: _getTextDecoration(),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.taskModel.content ?? '(No content)',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.fontColor,
                          decoration: _getTextDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<TaskBloc>(context).add(
                      DeleteTask(widget.taskModel.id!),
                    );
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: AppColors.fontColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextDecoration _getTextDecoration() {
    return widget.taskModel.status == 2
        ? TextDecoration.lineThrough
        : TextDecoration.none;
  }

  void _onTaskPress() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailTaskPage(taskModel: widget.taskModel),
      ),
    );
  }
}
