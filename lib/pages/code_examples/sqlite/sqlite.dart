import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:playground_flutter/configs/ioc.dart';
import 'package:playground_flutter/constants/navigation.dart';
import 'package:playground_flutter/models/baseball.model.dart';
import 'package:playground_flutter/services/baseball-team.service.dart';
import 'package:playground_flutter/store/state/app.state.dart';

class SqliteDemo extends StatefulWidget {
  SqliteDemo({Key key}) : super(key: key);

  _SqliteDemoState createState() => _SqliteDemoState();
}

class _SqliteDemoState extends State<SqliteDemo> {
  BaseballService _databaseService;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  BaseballModel _model;
  TextEditingController _name = TextEditingController(),
      _coach = TextEditingController(),
      _players = TextEditingController();

  @override
  void initState() {
    super.initState();

    _databaseService = Ioc.get<BaseballService>();
    _model = new BaseballModel();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _databaseService.seedData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Sqlite demo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextFormField(
                      controller: _name,
                      onSaved: ((value) => _model.name = value),
                      validator: (value) {
                        if (value.isEmpty) return "Name its required";
                      },
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      controller: _coach,
                      validator: (value) {
                        if (value.isEmpty) return "Coach its required";
                      },
                      onSaved: ((value) => _model.coach = value),
                      decoration: InputDecoration(
                        hintText: "Coach",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      controller: _players,
                      validator: (value) {
                        if (value.isEmpty || int.tryParse(value) == null)
                          return "Players its required";
                      },
                      keyboardType: TextInputType.number,
                      onSaved: ((value) => _model.players = int.parse(value)),
                      decoration: InputDecoration(
                        hintText: "Players",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.green,
                          child: Text(
                            _model.key == null || _model.key == 0
                                ? "Create"
                                : "Update",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () async {
                            if (_model.key == null || _model.key == 0) {
                              await _create(_model);
                            } else {
                              await _update(_model);
                            }

                            Navigator.of(context).pushNamed(
                                NavigationConstrants.NOTIFICATION_SUCCESS);
                          },
                        ),
                        SizedBox(width: 10),
                        Visibility(
                          visible: _model.key != null && _model.key != 0,
                          child: RaisedButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: _reset,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _databaseService.list(),
              builder: (_, AsyncSnapshot<List<BaseballModel>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("No data found !!!"),
                  );
                }

                return ListView(
                  children: snapshot.data.map((item) {
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.coach),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await _delete(item);
                                Navigator.of(context).pushNamed(
                                    NavigationConstrants.NOTIFICATION_SUCCESS);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () async {
                                setState(() {
                                  _model = item;
                                  _name.text = item.name;
                                  _coach.text = item.coach;
                                  _players.text = item.players.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> _delete(BaseballModel item) async {
    await _databaseService.delete(item);
    setState(() {});
  }

  Future<void> _create(BaseballModel item) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await _databaseService.create(item);
      _reset();
    }
  }

  Future<void> _update(BaseballModel item) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await _databaseService.update(item);
      _reset();
    }
  }

  void _reset() {
    setState(() {
      _formKey.currentState.reset();
      _model = new BaseballModel();
      _name.text = "";
      _coach.text = "";
      _players.text = "";
    });
  }
}
