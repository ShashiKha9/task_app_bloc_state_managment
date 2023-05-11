import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState>  {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>((event, emit) {
      final state = this.state;
      emit(TaskState(
        allTasks: List.from(state.allTasks)..add(event.task),
      ));


    });
    //update task
    on<UpdateTask>((event, emit) {
      final state = this.state;
      final task = event.task;
      final int index=state.allTasks.indexOf(task);
      List<Task> allTasks = List.from(state.allTasks)..remove(task);
      task.isDone== false ? allTasks.insert(index,task.copyWith(isDone: true))
          : allTasks.insert(index,task.copyWith(isDone: false));

      emit(TaskState(
        allTasks: allTasks
      ));

    });

    on<DeleteTask>((event, emit) {
      final state = this.state;
      emit(TaskState(
        allTasks: List.from(state.allTasks)..remove(event.task),
      ));


    });

  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return  TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {

return state.toMap();
  }



}
