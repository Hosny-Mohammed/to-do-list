import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  String description;
  bool completed;
  TaskCard({super.key, required this.description, required this.completed,});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Text(description, style: const TextStyle(fontSize:20),),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Checkbox(value:completed, onChanged: (nn){
                        completed =  nn!;
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
