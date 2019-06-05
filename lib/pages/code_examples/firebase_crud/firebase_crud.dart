import 'package:flutter/material.dart';
import 'package:playground_flutter/configs/ioc.dart';
import 'package:playground_flutter/constants/navigation.dart';
import 'package:playground_flutter/models/baseball.model.dart';
import 'package:playground_flutter/services/firebase_basebal_team.service.dart';
import 'package:playground_flutter/shared/widgets/crud_demo_list_item.widget.dart';

class FirebaseDemo extends StatefulWidget {
  const FirebaseDemo({Key key}) : super(key: key);

  @override
  _FirebaseDemoState createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<FirebaseDemo> {
  FirebaseBaseballService _databaseService;
  //Control my form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Model for create or update action
  BaseballModel _model;
  // Controller for my fields
  TextEditingController _name = TextEditingController(),
      _coach = TextEditingController(),
      _players = TextEditingController();

  @override
  void initState() {
    super.initState();

    _databaseService = Ioc.get<FirebaseBaseballService>();
    _model = new BaseballModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Firebase CRUD'),
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
                      onSaved: (value) => _model.name = value,
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
                            //Same logic in sqlite crud demo
                            bool resultOperation = false;
                            if (_model.key == null || _model.key == 0) {
                              resultOperation = await _create();
                            } else {
                              resultOperation = await _update();
                            }

                            if (resultOperation) {
                              Navigator.of(context).pushNamed(
                                  NavigationConstrants.NOTIFICATION_SUCCESS);
                            }
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
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(accentColor: Colors.blue),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("No data found !!!"),
                    );
                  }

                  return ListView(
                    children: snapshot.data
                        .map((item) => CrudDemoListItem(
                              item: item,
                              onPressedDelete: _delete,
                              onPressedEdit: (item) {
                                setState(() {
                                  // set model and textfield controllers
                                  _model = item;
                                  _name.text = item.name;
                                  _coach.text = item.coach;
                                  _players.text = item.players.toString();
                                });
                              },
                            ))
                        .toList(),
                  );
                }),
          )
        ],
      ),
    );
  }

  _delete(BaseballModel item) async {
    bool result = await _databaseService.delete(item);
    if (result) {
      Navigator.of(context)
          .pushNamed(NavigationConstrants.NOTIFICATION_SUCCESS);
      return;
    }

    Navigator.of(context).pushNamed(NavigationConstrants.NOTIFICATION_ERROR);
  }

  Future<bool> _create() async {
    bool result = false;
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      result = await _databaseService.create(_model);
      _reset();
    }

    return result;
  }

  Future<bool> _update() async {
    bool result = false;
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      result = await _databaseService.update(_model);
      _reset();
    }

    return result;
  }

  _reset() {
    setState(() {
      _formKey.currentState.reset();
      _model = new BaseballModel();
      _name.text = "";
      _coach.text = "";
      _players.text = "";
    });
  }
}
