import 'package:flutter/material.dart';
import 'package:to_do/Database_helper.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/widgets.dart';

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image(
                              image: AssetImage("assets/images/back_arrow.png"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              if (value != "") {
                                DatabaseHelper _dbHelper = DatabaseHelper();

                                Task _newTask = Task(title: value);

                                await _dbHelper.insertTask(_newTask);

                                print("New Task created");
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Task Title",
                                border: InputBorder.none),
                            style: TextStyle(
                              fontSize: 26.8,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF211551),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 12.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter Description",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                          )),
                    ),
                  ),
                  Todowidget(
                    text: "First task",
                    isDone: false,
                  ),
                  Todowidget(
                    text: "second task",
                    isDone: false,
                  ),
                  Todowidget(
                    isDone: true,
                  ),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 24.0,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Taskpage()),
                      );
                    },
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          // color: Color(0xFFFE3577),
                          ),
                      child: Image(
                        image: AssetImage("assets/images/delete_icon.png"),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
