import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/components/FlipBoxBar/flip_box_bar.dart';

class ThreeDimenssionBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('3D BottomNavigationBar'),
        ),
        bottomNavigationBar: FlipBoxBar(
          items: [
            FlipBarItem(
                icon: Icon(Icons.map),
                text: Text("Map"),
                frontColor: Colors.blue,
                backColor: Colors.blueAccent),
            FlipBarItem(
                icon: Icon(Icons.add),
                text: Text("Add"),
                frontColor: Colors.cyan,
                backColor: Colors.cyanAccent),
            FlipBarItem(
                icon: Icon(Icons.chrome_reader_mode),
                text: Text("Read"),
                frontColor: Colors.orange,
                backColor: Colors.orangeAccent),
            FlipBarItem(
                icon: Icon(Icons.print),
                text: Text("Print"),
                frontColor: Colors.purple,
                backColor: Colors.purpleAccent),
            FlipBarItem(
                icon: Icon(Icons.print),
                text: Text("Print"),
                frontColor: Colors.pink,
                backColor: Colors.pinkAccent),
          ],
          onIndexChanged: (newIndex) {
            print(newIndex);
          },
        ));
  }
}
