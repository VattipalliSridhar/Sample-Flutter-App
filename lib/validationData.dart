import 'package:flutter/material.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class MyAppli extends StatelessWidget {
  static final String title = 'TextFormField';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primaryColor: Colors.red),
      home: MainPage(title: title),
    );
  }
}

class MainPage extends StatefulWidget{

  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();


}


class _MainPageState extends State<MainPage> {


  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }
  bool _autoValidate = false;
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  bool showTooltip = false;
  String errorText = '';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Form(
      key: formKey,
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          buildUsername(),
          const SizedBox(height: 16),
          buildEmail(),
          Positioned(
            //You can use your own custom tooltip widget over here in place of below Container
            child: showTooltip
                ? Container(
               child: SimpleTooltip(
                 animationDuration: Duration(seconds: 3),
                 show: true,
                 //tooltipDirection: TooltipDirection.up,
                 tooltipDirection: TooltipDirection.down,
                 content: Text(
                   ""+errorText,
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 15,
                     decoration: TextDecoration.none,
                   ),
                 ),
               ),
            ) : Container(),
          ),
          const SizedBox(height: 32),




          buildPassword(),
          const SizedBox(height: 32),
          //buildSubmit(),
        ],
      ),
    ),
  );

  Widget buildUsername() => TextFormField(
    decoration: InputDecoration(
      labelText: 'Username',
      border: OutlineInputBorder(),
      // errorBorder:
      //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
      // focusedErrorBorder:
      //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
      // errorStyle: TextStyle(color: Colors.purple),
    ),
    validator: (value) {
      if (value.length < 4) {
        return 'Enter at least 4 characters';
      } else {
        return null;
      }
    },
    maxLength: 30,
    onSaved: (value) => setState(() => username = value),
  );

  Widget buildEmail() => TextFormField(
    decoration: InputDecoration(
      labelText: 'Email',
      suffixIcon: IconButton(
        icon: Icon(Icons.error, color: Colors.red,),
        onPressed: () {
          setState(() {
            showTooltip = !showTooltip;
          });
        },
      ),
      border: OutlineInputBorder(
      ),
    ),

    /*validator: (value) {
      final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
      final regExp = RegExp(pattern);

      if (value.isEmpty) {
          Container(
            child: Tooltip(message: "Sridhar",
            child: Text("sdsddsdsdssdsd"),),
          );
        return 'Enter an email';
      } else if (!regExp.hasMatch(value)) {
        return 'Enter a valid email';
      } else {
        return null;
      }
    },*/


    autovalidate: _autoValidate ,
    onChanged: (value) {

      setState(() {
        if(value.isEmpty)
          {
            showTooltip = false;
          }
        _autoValidate = true;
      });
    },
    validator: (value) {
     /* if (value.length < 5) {
        showTooltip = true;
      return '';
      } else {
        showTooltip = false;
        return '';
      }*/


      final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
      final regExp = RegExp(pattern);

      if (value.isEmpty) {
        showTooltip = true;
        errorText = "Enter an email";
        return '';
      } else if (!regExp.hasMatch(value)) {
        showTooltip = true;
        errorText = "Enter a valid email";
        return '';
      } else {
        showTooltip = false;
        errorText = "";
        return null;
      }
    },

    keyboardType: TextInputType.emailAddress,
    onSaved: (value) => setState(() => email = value),
  );

  Widget buildPassword() => TextFormField(
    decoration: InputDecoration(
      labelText: 'Password',
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if (value.length < 7) {
        return 'Password must be at least 7 characters long';
      } else {
        return null;
      }
    },
    onSaved: (value) => setState(() => password = value),
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
  );

  /*Widget buildSubmit() => Builder(
    builder: (context) => ButtonWidget(
      text: 'Submit',
      onClicked: () {
        final isValid = formKey.currentState.validate();
        // FocusScope.of(context).unfocus();

        if (isValid) {
          formKey.currentState.save();

          final message =
              'Username: $username\nPassword: $password\nEmail: $email';
          final snackBar = SnackBar(
            content: Text(
              message,
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    ),
  );*/
}
