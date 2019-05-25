import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:playground_flutter/components/ProgressButton/progress-button.dart'
    as ProgressButtonComponent;
import 'package:playground_flutter/constants/navigation.dart';
import 'package:playground_flutter/models/rates.model.dart';
import 'package:playground_flutter/services/web.client.dart';

class ProgressButton extends StatefulWidget {
  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _createMovement(done) async {
    await Future.delayed(Duration(seconds: 1));

    // find more example in redux service. :)
    //dynamic ratesResponse = await http.get('currency/latest');
    //RatesModel rates = RatesModel.fromSnapshot(ratesResponse["rates"]);

    //print(ratesResponse);

    bool successFlag = Random().nextInt(50) % 2 == 0 ? true : false;

    if (successFlag) {
      Navigator.of(context)
          .pushNamed(NavigationConstrants.NOTIFICATION_SUCCESS);
    } else {
      Navigator.of(context).pushNamed(NavigationConstrants.NOTIFICATION_ERROR);
    }
    return done(successFlag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Button"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: "Title del movimiento",
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: "Description del movimiento",
                  ),
                ),
                ProgressButtonComponent.ProgressButton(
                  title: "Crear",
                  operation: _createMovement,
                  canExecuteOperation: () => _formKey.currentState.validate(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
