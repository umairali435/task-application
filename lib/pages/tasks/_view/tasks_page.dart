import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/providers/all_providers.dart';

class TasksPage extends StatelessWidget {
  final String? id;
  final String? description;
  const TasksPage({Key? key, this.id, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AllTasksWidget()),
        VerticalDivider(
          thickness: 1.6,
        ),
        if (id != null)
          Expanded(
            child: TaskDetailWidget(
              description: description!,
            ),
          ),
      ],
    );
  }
}

class AllTasksWidget extends HookConsumerWidget {
  const AllTasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(alltasksProvider);
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tasks",
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          Divider(
            color: AppStyle.mediumBlue,
            thickness: 1.0,
          ),
          tasks.when(
            data: (alltasks) => Expanded(
              child: ListView.builder(
                itemCount: alltasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TasksWidget(
                    task: alltasks[index].title!,
                    time: alltasks[index].dateTime!,
                    onPressed: () {
                      GoRouter.of(context).go(
                        "/tasks/${index + 1}",
                        extra: alltasks[index].description,
                      );
                    },
                  );
                },
              ),
            ),
            error: (err, stk) => Text(
              err.toString(),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

class TasksWidget extends StatelessWidget {
  final String task;
  final DateTime time;
  final VoidCallback onPressed;
  const TasksWidget({
    super.key,
    required this.task,
    required this.time,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: AppStyle.taskTileColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task),
            extractDate(time),
          ],
        ),
      ),
    );
  }
}

Widget extractDate(DateTime dateTime) {
  int day = dateTime.day;
  int month = dateTime.month;
  int hours = dateTime.hour;
  int minutes = dateTime.minute;
  return Text("${month}/${day}, ${hours}:${minutes}");
}

class TaskDetailWidget extends StatelessWidget {
  final String description;
  const TaskDetailWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Text(
            "Tasks",
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          Divider(
            color: AppStyle.mediumBlue,
            thickness: 1.0,
          ),
          Text(description),
        ],
      ),
    );
  }
}
