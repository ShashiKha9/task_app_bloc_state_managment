import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app_bloc_state_managment/blocs/task_bloc.dart';
import 'package:task_app_bloc_state_managment/models/task.dart';
import 'package:task_app_bloc_state_managment/screens/TaskScreen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage= await HydratedStorage.build(
      storageDirectory:await  getApplicationDocumentsDirectory());
  runApp(const MyApp(),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()..add(AddTask(task: Task(title: "Task 1"))),
      child: MaterialApp(
        home: TaskScreenPage(),
      ),
    );
  }
}


