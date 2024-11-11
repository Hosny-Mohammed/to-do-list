import 'package:dio/dio.dart';
import 'package:to_do_list/models/task_model.dart';
class TodoServices{
  static final Dio dio = Dio();

  static Map postData = {'todo':'', 'completed':false, 'userId':5};

  static Future<TaskModel> fetchData() async{
    try{
      Response response = await dio.get('https://dummyjson.com/todos/user/1');
      if(response.statusCode == 200) {
        return TaskModel(tasks: response.data['todos'], total: response.data['total']);
      }
      else{
        throw Exception("Couldn't fetch the data");
      }
    }
    catch(ex){
      throw('Error : $ex');
    }
  }
  
  static Future<bool> addItem({required String todo}) async {
    postData['todo'] =todo;
    Response response = await dio.post('https://dummyjson.com/todos/add', data: postData);
    if(response.statusCode! >= 200 && response.statusCode! <=204){
      return true;
    }else{
      return false;
    }
  }

}