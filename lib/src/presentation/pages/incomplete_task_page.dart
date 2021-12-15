import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/src/presentation/blocs/task/task_bloc.dart';
import 'package:manabie_todo/src/presentation/widgets/page_title.dart';
import 'package:manabie_todo/src/presentation/widgets/popup_notifcation.dart';
import 'package:manabie_todo/src/presentation/widgets/task_item.dart';

class IncompleteTaskPage extends StatelessWidget {
  const IncompleteTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTitle(title: 'Incompleted Tasks'),
              Expanded(
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    if (state is TaskLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is TaskError) {
                      PopupNoti.showMyDialog(
                        context,
                        title: 'Error',
                        content: state.errorMessage,
                      );
                      return const SizedBox();
                    }
                    
                    if (state is TaskLoaded) {
                      return state.data.isNotEmpty
                          ? ListView.separated(
                              itemCount: state.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (state.data[index].status == 1) {
                                  return TaskItem(taskModel: state.data[index]);
                                }

                                return const SizedBox.shrink();
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                if (state.data[index].status == 1) {
                                  return const Divider();
                                }

                                return const SizedBox.shrink();
                              },
                              padding: const EdgeInsets.all(10),
                            )
                          : const Center(
                              child: Text('No task now'),
                            );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
