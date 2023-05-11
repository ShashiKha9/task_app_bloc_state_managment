part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  const TaskState(
  {this.allTasks = const <Task>[]}
      );

  @override
  // TODO: implement props
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': this.allTasks,
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: map['allTasks'] as List<Task>,
    );
  }
}

class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}
