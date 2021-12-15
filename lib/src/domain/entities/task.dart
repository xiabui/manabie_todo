import 'package:equatable/equatable.dart';

class Task extends Equatable {
  
  final int id;
  final String title;
  final String content;
  final int endDate;
  final int modified;
  final int status;

  const Task({
    required this.id,
    required this.title,
    required this.content,
    required this.endDate,
    required this.modified,
    required this.status,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      content,
      endDate,
      modified,
      status,
    ];
  }

  @override
  bool get stringify => true;
}