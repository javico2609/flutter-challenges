import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  ChatHome({Key key}) : super(key: key);

  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final TextEditingController _textController = new TextEditingController();

  void _handleSubmitted(String text) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff2c8cde),
              Color(0xffb1e9e4),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              new Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              new Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xff2139b1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Consultation",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      child: Text(
                        "Question Ideas",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      child: Text(
                        "Question Ideas",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 120,
                      child: Text(
                        "Question Ideas",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              new Flexible(
                child: new ListView(
                  padding: new EdgeInsets.fromLTRB(16, 0, 16, 30),
                  reverse: true,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: <Widget>[
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "11: 55 AM",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text("I hope tomorrow"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: CustomPaint(
                                  painter: Triangle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            bottom: 8.0,
                            right: 8.0,
                          ),
                          child: CircleAvatar(
                            child: Text("B"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            bottom: 8.0,
                            right: 8.0,
                          ),
                          child: CircleAvatar(
                            child: Text("A"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 0,
                                bottom: 0,
                                child: CustomPaint(
                                  painter: Triangle(),
                                ),
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "11: 53 AM",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text("When will i get a job?"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Container(
                padding: const EdgeInsets.only(left: 20, right: 5),
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: new Row(
                  children: <Widget>[
                    new Flexible(
                      child: new TextField(
                        decoration: new InputDecoration.collapsed(
                          hintText: "Ask a question",
                        ),
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                      ),
                    ),
                    new Container(
                      child: new IconButton(
                        icon: new Icon(
                          Icons.send,
                          color: Color(0xff2139b1),
                        ),
                        onPressed: () => _handleSubmitted(_textController.text),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class Triangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;

    var path = Path();
    path.lineTo(10, 0);
    path.lineTo(0, -10);
    path.lineTo(-10, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
