import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer' as developer;

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  String selectedCountry = "+91";
  TextEditingController _numberController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      top: false,
      minimum: EdgeInsets.all(0),
      child: Scaffold(
        key: _globalKey,
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(16),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳🇮🇳",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
              SizedBox(
                height: 20,

              ),
              Divider(
                height: 5,
                color: Colors.blue,
              ),
              Text(
                " WhatsApp ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),

              SizedBox(
                height: 40,
              ),
              Text(
                "Send Messages on WA without saving number.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 30,
                    child: CountryCodePicker(
                      initialSelection: "IN",
                      favorite: ["+91", "IN"],
                      onChanged: (item) {
                        print("county code: " + item.dialCode);
                        selectedCountry = item.dialCode;
                        Fluttertoast.showToast(msg: "$selectedCountry");

                      },


                    ),
                  ),
                  Expanded(
                    flex: 70,
                    child: TextField(
                      minLines: 1,
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,

                      decoration: InputDecoration(
                        labelText: "Mobile Number",
                        border: OutlineInputBorder(

                        ),
                        hintText: "Enter Mobile Number",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _messageController,
                minLines: 3,
                maxLines: 1000,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Message",
                    labelText: "Message"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.maxFinite,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    sendMessage();
                  },
                  child: Text(
                    "Send Message",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );

  }

  void sendMessage() {
    String number, message;

    if (_numberController.text == null || _numberController.text.length < 10) {
      _globalKey.currentState.showSnackBar(SnackBar(content: Text("Enter Valid Mobile Number")));
      return;
    }

    number = selectedCountry.substring(1)+_numberController.text;
    developer.log('$number', name: 'my.app.category');
    message = _messageController.text;
    String url = "https://wa.me/$number?text=" + Uri.encodeComponent(message);

    _launchURL(url);
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}


