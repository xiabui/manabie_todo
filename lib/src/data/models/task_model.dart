class TaskModel implements Comparable<TaskModel> {
  /// The task id
  int? id;

  /// The title of task
  String? title;

  /// The content or description for task
  String? content;

  /// The status of the task, was defined by:
  /// [1] New => Incomplete
  /// [2] Done => Completed
  /// [3] Over => Time up
  int? status;

  /// Estimated date of completion of the task
  /// Data will store by unix (Milliseconds Since Epoch)
  int? endDate;

  /// The date that the task was modified
  /// Data will store by unix (Milliseconds Since Epoch)
  int? modified;

  TaskModel({
    this.id,
    this.title,
    this.content,
    this.status,
    this.endDate,
    this.modified,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? content,
    int? status,
    int? endDate,
    int? modified,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      status: status ?? this.status,
      endDate: endDate ?? this.endDate,
      modified: modified ?? this.modified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'status': status ?? 1,
      'end': endDate,
      'modified': convertDateTimeToUnix()
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, content: $content, status: $status, end: $endDate, modified: $modified}';
  }

  int convertDateTimeToUnix() {
    return DateTime.now().toUtc().millisecondsSinceEpoch;
  }

  DateTime convertUnixToDateTime(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date);
  }

  @override
  int compareTo(TaskModel other) {
    if(status == null || other.status == null) return -1;

    if (status!.compareTo(other.status!) == -1) {
      return -1;
    }

    if (status!.compareTo(other.status!) == 0) {
      if (modified! < other.modified!) {
        return -1;
      } else if (modified! == other.modified!) {
        return 0;
      } else {
        return 1;
      }
    }

    return 1;
  }
}
