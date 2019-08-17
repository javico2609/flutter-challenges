import 'package:flutter/material.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/pages/templates/calculator-check-list-clone/tab-indicator.dart';

class CalculatorChecklistHome extends StatefulWidget {
  CalculatorChecklistHome({Key key}) : super(key: key);

  _CalculatorChecklistState createState() => _CalculatorChecklistState();
}

class _CalculatorChecklistState extends State<CalculatorChecklistHome>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  String _currentOperation = "";

  @override
  void initState() {
    super.initState();
    themeBloc.changeTheme(Themes.calculator);
    _controller = new TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff464c51),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: size.width,
                child: TabBar(
                  controller: _controller,
                  unselectedLabelColor: Color(0xff646a6f),
                  indicator: CustomTabIndicator(
                    insets: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    borderSide: BorderSide(
                      width: 4.2,
                      color: Color(0xff9fadb8),
                    ),
                  ),
                  //indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        "LETS CALC!",
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "LETS CHECK!",
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "MY TRIP TO SPAIN",
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "US \$",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "2.4K",
                                    style: TextStyle(
                                      fontSize: 90,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView(
                              reverse: true,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Visibility(
                                      visible: _currentOperation.length > 0,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _currentOperation = "";
                                          });
                                        },
                                        child: Icon(Icons.close),
                                      ),
                                    ),
                                    Text(_currentOperation)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: RaisedButton(
                                        color: Color(0xff464c51),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          side: BorderSide(
                                            color: Color(0xff63696e),
                                          ),
                                        ),
                                        child: Text(
                                          '[',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xffbee9ea),
                                          ),
                                        ),
                                        onPressed: () {
                                          _operation("(");
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: RaisedButton(
                                        color: Color(0xff464c51),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          side: BorderSide(
                                            color: Color(0xff63696e),
                                          ),
                                        ),
                                        child: Text(
                                          ']',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xffbee9ea),
                                          ),
                                        ),
                                        onPressed: () {
                                          _operation(")");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: size.width * .5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            _buildRegularOptions(
                                              ['7', '8', '9'],
                                            ),
                                            _buildRegularOptions(
                                              ['4', '5', '6'],
                                            ),
                                            _buildRegularOptions(
                                              ['1', '2', '3'],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                _optionItem(
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                _optionItem(
                                                  Text(
                                                    ".",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                _optionItem(
                                                  Icon(
                                                    Icons.arrow_back,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width * .4,
                                        child: Container(
                                          color: Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegularOptions(List<String> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ...items
            .map(
              (i) => _optionItem(
                Text(
                  i,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                () => _operation(i),
              ),
            )
            .toList()
      ],
    );
  }

  Widget _optionItem(Widget child, [Function callback]) {
    return FloatingActionButton(
      backgroundColor: Color(0xff464c51),
      mini: true,
      onPressed: callback,
      elevation: 0,
      child: child,
    );
  }

  _operation(String action) {
    setState(() {
      _currentOperation = "$_currentOperation $action";
    });
  }
}
