import 'package:flutter/material.dart';
import 'package:playground_flutter/bloc/theme.bloc.dart';
import 'package:playground_flutter/configs/themes.dart';
import 'package:playground_flutter/pages/templates/calculator-check-list-clone/calculator_bloc.dart';
import 'package:playground_flutter/pages/templates/calculator-check-list-clone/tab-indicator.dart';
import 'package:playground_flutter/store/reducers/stack_overflow.reducer.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorChecklistHome extends StatefulWidget {
  CalculatorChecklistHome({Key key}) : super(key: key);

  _CalculatorChecklistState createState() => _CalculatorChecklistState();
}

class _CalculatorChecklistState extends State<CalculatorChecklistHome> with SingleTickerProviderStateMixin {
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
    operationsBloc.dispose();
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
                      padding: const EdgeInsets.all(20),
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
                                  StreamBuilder(
                                    stream: operationsBloc.total(),
                                    builder: (_, sn) {
                                      return Text(
                                        sn.hasData ? sn.data.toString() : '0',
                                        style: TextStyle(
                                          fontSize: 80,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Expanded(
                            child: StreamBuilder<List<Operation>>(
                              stream: operationsBloc.operations(),
                              builder: (_, snapshot) {
                                return ListView(
                                  reverse: true,
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          Text(
                                            _currentOperation,
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    if (snapshot.hasData)
                                      ...snapshot.data.map((op) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                operationsBloc.deleteOperation(op);
                                              },
                                              child: Icon(Icons.close),
                                            ),
                                            Text(op.value.toString()),
                                          ],
                                        );
                                      }).toList(),
                                  ],
                                );
                              },
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
                                          borderRadius: BorderRadius.circular(7),
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
                                          borderRadius: BorderRadius.circular(7),
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: size.width * .55,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                _optionItem(
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  () => _operation('0'),
                                                ),
                                                _optionItem(
                                                  Text(
                                                    ".",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  () => _operation('.'),
                                                ),
                                                _optionItem(
                                                    Icon(
                                                      Icons.arrow_back,
                                                      color: Colors.white,
                                                    ), () {
                                                  setState(() {
                                                    _currentOperation = _currentOperation.substring(0, _currentOperation.length - 1);
                                                  });
                                                }),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width * .3,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  _optionItem(
                                                    Text(
                                                      '/',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    () => _operation('/'),
                                                    Color(0xff91eff6),
                                                  ),
                                                  _optionItem(
                                                    Text(
                                                      'x',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    () => _operation('*'),
                                                    Color(0xff91eff6),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 45,
                                                      height: 100,
                                                      child: Material(
                                                        color: Color(0xff91eff6),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(30.0),
                                                        ),
                                                        child: InkWell(
                                                          borderRadius: BorderRadius.circular(30.0),
                                                          onTap: () => _operation('+'),
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 45,
                                                      height: 108,
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: <Widget>[
                                                          _optionItem(
                                                            Text(
                                                              '-',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            () => _operation('-'),
                                                            Color(0xff91eff6),
                                                          ),
                                                          _optionItem(
                                                            Text(
                                                              '%',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            () => _operation('%'),
                                                            Color(0xff91eff6),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: size.width * .3,
                                                height: 38,
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Material(
                                                  color: Color(0xffedffc5),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(30.0),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Parser p = new Parser();
                                                      ContextModel cm = new ContextModel();

                                                      try {
                                                        Expression exp = p.parse(_currentOperation);
                                                        var value = exp.evaluate(EvaluationType.REAL, cm).toString();

                                                        operationsBloc.addOperation(
                                                          new Operation(
                                                            id: uuid(),
                                                            value: double.parse(value),
                                                            description: 'Op',
                                                          ),
                                                        );

                                                        setState(() {
                                                          _currentOperation = '';
                                                        });
                                                      } catch (e) {}
                                                    },
                                                    borderRadius: BorderRadius.circular(30.0),
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        'Enter',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(),
                  ],
                ),
              )
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
        ...items.map(
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
      ],
    );
  }

  Widget _optionItem(Widget child, [Function callback, Color color]) {
    color = color ?? Color(0xff464c51);
    return FloatingActionButton(
      heroTag: uuid(),
      backgroundColor: color,
      mini: true,
      onPressed: callback,
      elevation: 0,
      child: child,
    );
  }

  _operation(String action) {
    setState(() {
      _currentOperation = "$_currentOperation$action";
    });
  }
}
