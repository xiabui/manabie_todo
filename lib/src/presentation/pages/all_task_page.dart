import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/src/presentation/blocs/task/task_bloc.dart';
import 'package:manabie_todo/src/presentation/widgets/app_color.dart';
import 'package:manabie_todo/src/presentation/widgets/page_title.dart';
import 'package:manabie_todo/src/presentation/widgets/popup_notifcation.dart';
import 'package:manabie_todo/src/presentation/widgets/task_item.dart';

class AllTaskPage extends StatefulWidget {
  const AllTaskPage({Key? key}) : super(key: key);

  @override
  State<AllTaskPage> createState() => _AllTaskPageState();
}

class _AllTaskPageState extends State<AllTaskPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
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
              return Scrollbar(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageTitle(title: 'All tasks'),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TaskItem(key: Key('task_item_${index+1}'),taskModel: state.data[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                        padding: const EdgeInsets.all(10),
                      ),
                    )
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
