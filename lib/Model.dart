
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FlutterChatModel extends Model {
   
   BuildContext rootBuildContext;

   Directory docsDir;

   String greeting = "";

   String userName = "";

   
   static final String DEFAULT_ROOM_NAME = "Not currently in a room";

   //Name of the room the user is currently in, if any.
   String currentRoomName = DEFAULT_ROOM_NAME;

   //The list of users in the current room
   List curentRoomUserList =  [ ];

   bool currentRoomEnabled = false;

   List currentRoomMessages = [ ];

   List roomList = [ ];

   List userList = [ ];

   bool creatorFunctionsEnabled = false;

   Map roomInvites = { };
  
   
   void setGreeting(final String inGreeting){
     print("## FlutterChatModel.setGreeting(): inGreeting = $inGreeting");

     greeting = inGreeting;
     notifyListeners();
   }  

   void setUserName(final String inUserName){
     print("## FlutterChatModel.setUserName(): inUserName = $inUserName");

     userName = inUserName;
     notifyListeners();
   }

   void setCurrentRoomName(final String inRoomName){
     print("## FlutterChatModel.setCurrentRoomName(): inRoomName = $inRoomName");
     currentRoomName = inRoomName;
     notifyListeners();

   }

   void setCreatorFunctionsEnabled(final bool isEnabled){
      print("## FlutterChatModel.setCreatorFunctionsEnabled(): inEnabled = $isEnabled");
   }
  
   void setCurrentRoomEnabled(final bool isEnabled){
       print("## FlutterChatModel.setCurrentRoomEnabled(): inEnabled = $isEnabled");

       currentRoomEnabled = isEnabled;
       notifyListeners();
   }

   void addMessage(final String inUserName, final String inMessage){
      print("## FlutterChatModel.addMessage(): inUserName = $inUserName inMessage = $inMessage");
      currentRoomMessages.add({"userName": inUserName, "message": inMessage});
      notifyListeners();
   }

   void setRoomList(final Map inRoomList){
     print("## FlutterChatModel.setRoomList(): inRoomList = $inRoomList");
     List rooms = [ ];
     for(String roomName in inRoomList.keys){
       Map room = inRoomList[roomName];
       rooms.add(room);
     }
     roomList = rooms;
     notifyListeners();
   }

   void setUserList(final Map inUserList){
     print("## FlutterChatModel.setUserList(): inUserList = $inUserList");
     List users = [ ];
     for(String userName in inUserList.keys){
       Map user = inUserList[userName];
       users.add(user);
     }
     userList = users;
     notifyListeners();
   }

   void setCurrentRoomUserList(final Map inUserList){
     print("## FlutterChatModel.setCurrentRoomUserList(): inUserList = $inUserList");
     List users = [ ];
     for(String userName in inUserList.keys){
       Map user = inUserList[userName];
       users.add(user);
     }
     curentRoomUserList = users;
     notifyListeners();

   }

   void addRoomInvite(final String inRoomName){
     roomInvites[inRoomName] = true;
   }

   void removeRoomInvite(final String inRoomName){
     roomInvites.remove(inRoomName);
   }

   void clearCurrentRoomMessages(){
     currentRoomMessages = [ ];
   }

}

FlutterChatModel model = FlutterChatModel();