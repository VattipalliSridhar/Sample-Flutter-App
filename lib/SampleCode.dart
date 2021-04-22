import 'package:flutter/material.dart';

class sampleAppCode extends StatefulWidget {

  @override
  _sampleAppCodeState createState() => _sampleAppCodeState();
}

class _sampleAppCodeState extends State<sampleAppCode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(


      child: Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Container(
          
        )
      ),



    );
  }
}
