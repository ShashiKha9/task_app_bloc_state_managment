part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

}
class AddTask extends TaskEvent{
 final Task task;

 const AddTask({required this.task});

  @override
  // TODO: implement props
  List<Object?> get props => [task];


}
class UpdateTask extends TaskEvent{
  final Task task;

  const UpdateTask({required this.task});

  @override
  // TODO: implement props
  List<Object?> get props => [task];


}
class DeleteTask extends TaskEvent{
  final Task task;

  const DeleteTask({required this.task});

  @override
  // TODO: implement props
  List<Object?> get props => [task];


}


