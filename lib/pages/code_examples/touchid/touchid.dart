import 'package:flutter/material.dart';
import 'package:playground_flutter/configs/ioc.dart';
import 'package:playground_flutter/shared/utils/touchid.util.dart';

class TouchIdDemo extends StatelessWidget {
  TouchIdUtil _auth = Ioc.get<TouchIdUtil>();

  TouchIdDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage(
              "assets/images/splash-full-sml.jpg",
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.group),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.verified_user),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 40,
                            width: 100,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {},
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0.0),
                              child: Text('Login'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: FutureBuilder<bool>(
                    future: _auth.isActive(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData && snapshot.data) {
                        return IconButton(
                          icon: Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                          ),
                          iconSize: 80,
                          onPressed: _touchIdAuth,
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _touchIdAuth() async {
    bool success = await _auth.auth();
    if (success) {
      //redirect to home for example.
      print('fingerprint auth !!!!');
    }
  }
}
