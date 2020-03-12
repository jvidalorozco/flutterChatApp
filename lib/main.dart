import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutterchatsocket/Model.dart' show FlutterChatModel, model;
import "package:path/path.dart";
import "package:path_provider/path_provider.dart";
import 'package:scoped_model/scoped_model.dart';


var credentials;
var exists;


void main(){
  startMeUp() async{
    Directory docsDir = await getApplicationDocumentsDirectory();
    model.docsDir = docsDir;

    var credentialsFile = File(join(model.docsDir.path,"credentials"));
    exists = await credentialsFile.exists();
     if(exists){
       credentials = await credentialsFile.readAsString();
     }
    runApp(FlutterChat());
  }
   startMeUp();
}

class FlutterChat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: FlutterChatMain()));
  }
}


class FlutterChatMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    model.rootBuildContext = context;
    
    WidgetsBinding.instance.addPostFrameCallback((_) => executeAfterBuild());

    return ScopedModel<FlutterChatModel>(model: model, child: ScopedModelDescendant<FlutterChatModel>(
      builder: (BuildContext inContext, Widget inChild, FlutterChatModel inModel){
        return MaterialApp(
           initialRoute: "/",
           routes: {
             
           },
        );
      },
    ));
  }
  
  Future<void>executeAferBuild() async {
    if(exists){
      List credParts = credentials.split("============");
      LoginDialolg().va
     }else{
       await showDialog(context: model.rootBuildContext, barrierDismissible: false, builder: (BuildContext inDialogContext){
        return LoginDialog();
       });
    }
  }

}