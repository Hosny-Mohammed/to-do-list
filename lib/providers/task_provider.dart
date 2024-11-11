import 'package:flutter/cupertino.dart';
import 'package:to_do_list/models/task_model.dart';
import 'package:provider/provider.dart';
import '../services/todo_services.dart';

class TaskProvider extends ChangeNotifier{
  TaskModel? data;
  bool postStatus = true;

  Future<void> getAllData() async{
    data = await TodoServices.fetchData();
    notifyListeners();
  }
  Future<void> addTask(String todo) async{
    postStatus = await TodoServices.addItem(todo: todo);
    data?.tasks.add({"todo": todo});
    data?.total += 1;
    notifyListeners();
  }
}
