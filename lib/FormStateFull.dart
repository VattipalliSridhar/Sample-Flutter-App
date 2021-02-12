import 'package:flutter/material.dart';
class FormStateFull extends StatefulWidget {
  @override
  _FormStateFullState createState() => _FormStateFullState();
}

class _FormStateFullState extends State<FormStateFull> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 15),),
          ),
        ),
      ),


    );
  }
}
