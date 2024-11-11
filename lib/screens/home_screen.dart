import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/providers/task_provider.dart';
import 'package:to_do_list/services/todo_services.dart';
import 'package:to_do_list/widgets/task_card.dart';

import 'add_task.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        color: Colors.teal[400],
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 90.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Row(
                        children: [
                          Icon(CupertinoIcons.list_bullet, size: 35,color: Colors.white,),
                          SizedBox(width: 20,),
                          Text("To Day Do", style: TextStyle(fontSize: 30, color: Colors.white),)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Consumer<TaskProvider>(builder: (context, provider, Widget? child){
                        if(provider.data == null){
                          provider.getAllData();
                          return const Center(child: CircularProgressIndicator());
                        }
                        return Text('${provider.data?.total} Tasks', style: const TextStyle(fontSize: 20, color: Colors.white),);
                      })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 680,
                    child: Consumer<TaskProvider>(builder:(context, provider, Widget? child){
                      return ListView.builder(itemCount: provider.data?.total,itemBuilder: (context, index){
                        if(provider.data == null){
                          provider.getAllData();
                          return Center(child: const CircularProgressIndicator());
                        }else {
                          return TaskCard(description: provider.data
                              ?.tasks[index]['todo'], completed: provider.data
                              ?.tasks[index]['completed'] ?? false);
                        }
                      },
                      );
                    })
                  )
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const AddTask();
          },
        );
      }, child: const Icon(CupertinoIcons.add),),
    );
  }
}
