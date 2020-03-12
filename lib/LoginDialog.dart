import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Model.dart' show FlutterChatModel, model;
import 'Connector.dart';


final GlobalKey<FormState> _loginFormKey = new GlobalKey<FormState>();

class LoginDialog extends StatelessWidget {

   String _username;

   String _password;


  @override
  Widget build(BuildContext context) {
    return ScopedModel<FlutterChatModel>(model: model, child: ScopedModelDescendant<FlutterChatModel>(
     builder: (BuildContext inContext, Widget inChild, FlutterChatModel inModel){
       return AlertDialog(
         content: Container(height: 220,
          child: Form(key: _loginFormKey,
            child: Column(
              children: [
                 Text("Enter a username and password to register with the server", textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(model.rootBuildContext).accentColor, fontSize: 18),
                 ),SizedBox(
                   height:20
                 ),
                 TextFormField(
                   validator: (String inValue){
                     if(inValue.length == 0 || inValue.length > 10){
                       return "Please enter a username no more than 10 characters long";
                     }
                     return null;
                   },
                   onSaved: (String inValue){_username = inValue;},
                   decoration: InputDecoration(hintText: "Password", labelText: "Password"),
                 )
              ]
            )
          )    
         ),
       );
     },
    ));
  }
   
}