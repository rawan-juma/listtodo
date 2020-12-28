import 'package:assignmettodo/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DB_helper.dart';

class deleteWidget extends StatefulWidget {
  Task task;
  Function function;
  Function function1;
  deleteWidget(this.task, [this.function1, this.function]);

  @override
  _deleteWidgetState createState() => _deleteWidgetState();
}

class _deleteWidgetState extends State<deleteWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blue,
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text("Alert"),
                            content: Text(" ?"),
                            actions: <Widget>[
                              FlatButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    widget.function1(widget.task);
                                    Navigator.of(context).pop();
                                  }),
                              FlatButton(
                                  child: Text("No"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })
                            ]);
                      });
                }),
            Text(widget.task.taskTitle),
            Checkbox(
                value: widget.task.isComplete,
                onChanged: (value) {
                  DBHelper.dbHelper.updateTask(Task(
                      widget.task.taskTitle,
                      this.widget.task.isComplete =
                          !this.widget.task.isComplete,
                      widget.task.id));
                  setState(() {});
                  widget.function();
                })
          ],
        ),
      ),
    );
  }
}
