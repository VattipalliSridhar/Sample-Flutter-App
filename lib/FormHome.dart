import 'package:flutter/material.dart';
import 'package:flutter_apps/FormStateFull.dart';

class FormHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var isLoading = false;

    void _submit() {
      final isValid = _formKey.currentState.validate();
      if (!isValid) {
        return;
      }
      _formKey.currentState.save();
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FormStateFull()));
    }

    return SafeArea(
        minimum: EdgeInsets.all(0),
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextField(
                  //controller: _messageController,
                  minLines: 1,
                  maxLines: 10,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Mobile Number",
                      labelText: "Mobile Number"),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.blue,
                                ),
                                labelText: 'E-Mail'),
                            keyboardType: TextInputType.emailAddress,
                            controller: email,
                            onFieldSubmitted: (value) {
                              //Validator
                            },
                            validator: (value) {
                              if (value.isEmpty ||
                                  !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                return 'Enter a valid email!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock, color: Colors.blue),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: password,
                            onFieldSubmitted: (value) {},
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a valid password!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          RaisedButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 15.0,
                            ),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 24.0,
                              ),
                            ),
                            onPressed: () => _submit(),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
