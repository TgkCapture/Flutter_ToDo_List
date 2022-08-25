import 'package:flutter/material.dart';
import 'package:to_do/screens/taskpage.dart';
import 'package:to_do/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 32.0,
                    bottom: 32.0,
                  ),
                  child: Image(
                    image: AssetImage("assets/images/lion_icon.png"),
                  ),
                ),
                Expanded(
                    child: ScrollConfiguration(
                  behavior: NoGlowBehaviour(),
                  child: ListView(
                    children: [
                      TaskCardWidget(
                        title: "Task 1",
                        desc:
                            'lorem ipsum dolor sit amet consectetur adipiscing elit natoque integer platea quisque orci vivamus torquent tincidunt nostra ut fringilla est',
                      ),
                      TaskCardWidget(
                        title: 'Task 2',
                        desc:
                            'lorem ipsum dolor sit amet consectetur adipiscing elit interdum vehicula elementum euismod phasellus suscipit senectus',
                      ),
                      TaskCardWidget(),
                      TaskCardWidget(),
                      TaskCardWidget(),
                      TaskCardWidget(),
                      TaskCardWidget(),
                    ],
                  ),
                ))
              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 0.0,
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
                        // color: Color(0xFF7349FE),
                        ),
                    child: Image(
                      image: AssetImage("assets/images/add_icon.png"),
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
