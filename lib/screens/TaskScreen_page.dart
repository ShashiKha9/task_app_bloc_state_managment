import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app_bloc_state_managment/blocs/task_bloc.dart';

import '../models/task.dart';

class TaskScreenPage extends StatelessWidget {
  TaskScreenPage({Key? key}) : super(key: key);
  final _titleController = TextEditingController();
  
  void _addTask (BuildContext context){
    showModalBottomSheet(context: context,
        builder: (context)=> SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add Task"),
                  SizedBox(height: 10,),
                  TextField(
                    autofocus: true,
                    controller: _titleController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      labelText: "Title",
                      border: OutlineInputBorder()
                    ),
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: ()=>
                          Navigator.pop(context),
                          child: Text("Cancel")),

                      ElevatedButton(onPressed: (){
                        var task = Task(title: _titleController.text);
                        context.read<TaskBloc>().add(AddTask(task: task));
                        Navigator.pop(context);
                        _titleController.clear();
                      },
                          child: Text("Add"))

                    ],
                  )

                  
                ],
              ),
            ),
          ),
        ));
    
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList= state.allTasks;
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: ()=>_addTask(context),
          tooltip: "Add Task",
          child: Icon(Icons.add),),
          appBar: AppBar(
            title: Text("Task App"),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: taskList.length,
                    itemBuilder: (context, index) {
                      var task = taskList[index];
                      return ListTile(
                        title: Text(task.title),
                        trailing: Checkbox(value: task.isDone,
                            onChanged: (value) {
                          context.read<TaskBloc>().add(UpdateTask(task: task));
                            }),
                        onLongPress: ()=>context.read<TaskBloc>().add(DeleteTask(task: task)),
                      );
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}
