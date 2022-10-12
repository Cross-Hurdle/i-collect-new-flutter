// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:icollekt/Helpers/SharedPreference.dart';
// //import 'package:one_context/one_context.dart';


// final FirebaseMessaging _fcm = FirebaseMessaging.instance;


// class PushNotificationService {

//   Future initialise() async {
//     if (Platform.isIOS) {
//       _fcm.requestPermission(); //requestNotificationPermissions(IosNotificationSettings());
//     }
//     String? fcmToken = await _fcm.getToken();

//     if (fcmToken != null) {
//       print("--fcm token--");
//       print(fcmToken);
//       if (preferences.getBool("Login") == true) {
//         // update device token
//         // var deviceTokenUpdateResponse =
//         //     await ProfileRepository().getDeviceTokenUpdateResponse(fcmToken);
//       }
//     }

// FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       //  OneContext().showDialog(
//       //     // barrierDismissible: false,
//       //     builder: (context) => AlertDialog(
//       //       content: ListTile(
//       //         title:Text(message.notification!.title!,style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.05/3,),),
//       //         subtitle:Text(message.notification!.body!),
//       //         //title: Text(message['notification']['title']),
//       //         //subtitle: Text(message['notification']['body']),
//       //       ),
//       //       actions: <Widget>[

//       //         FlatButton(
//       //           child: Text('close',style:TextStyle(fontSize:MediaQuery.of(context).size.height*0.05/3,)),
//       //           onPressed: () => Navigator.of(context).pop(),
//       //         ),
//       //         FlatButton(
//       //           child: Text('GO',style:TextStyle(fontSize:MediaQuery.of(context).size.height*0.05/3,)),
//       //           onPressed: () {
//       //             if (preferences.getBool("Login") == false) {
//       //               // ToastComponent.showDialog("You are not logged in", context,
//       //               //     gravity: Toast.TOP, duration: Toast.LENGTH_LONG);
//       //               return;
//       //             }
//       //             print(message);
//       //             Navigator.of(context).pop();
//       //             // if (message['data']['item_type'] == 'order') {
//       //                 if (message.data['item_type'] == 'order') {
//       //               // OneContext().push(MaterialPageRoute(builder: (_) {
//       //               //   // return OrderDetails(
//       //               //   //     id: int.parse(message.data['item_type_id']),
//       //               //   //     from_notification: true);
//       //               // }));
//       //             }
//       //           },
//       //         ),
//       //       ],
//       //     ),
//        // );
//      });
    



//     // _fcm.configure(
//     //   onMessage: (Map<String, dynamic> message) async {
//     //     print("onMessage: $message");

//     //     OneContext().showDialog(
//     //       // barrierDismissible: false,
//     //         builder: (context) =>  AlertDialog(
//     //           content: ListTile(
//     //             title: Text(message['notification']['title']),
//     //             subtitle: Text(message['notification']['body']),
//     //           ),
//     //           actions: <Widget>[
//     //             FlatButton(
//     //               child: Text('close'),
//     //               onPressed: () => Navigator.of(context).pop(),
//     //             ),
//     //             FlatButton(
//     //               child: Text('GO'),
//     //               onPressed: () {
//     //             if (is_logged_in.$ == false) {
//     //               ToastComponent.showDialog("You are not logged in", context,
//     //                   gravity: Toast.TOP, duration: Toast.LENGTH_LONG);
//     //               return;
//     //             }
//     //                 print(message);
//     //                 Navigator.of(context).pop();
//     //                 if (message['data']['item_type'] == 'order') {
//     //                   OneContext().push(MaterialPageRoute(builder: (_) {
//     //                     return OrderDetails(
//     //                         id: int.parse(message['data']['item_type_id']) ,
//     //                         from_notification: true);
//     //                   }));
//     //                 }
//     //               } ,
//     //             ),
//     //           ],
//     //         ),
//     //  );

//     //  },

//     //   onLaunch: (Map<String, dynamic> message) async {
//     //     print('ffffffffffffffffffff');
//     //     print("onLaunch: $message");
//     //     _serialiseAndNavigate(message);
//     //   },
//     //   onResume: (Map<String, dynamic> message) async {
//     //     print('ggggggggggggggggggggg');
//     //     print("onResume: $message");
//     //     _serialiseAndNavigate(message);
//     //   },
//     // );
//   }

//   void _serialiseAndNavigate(Map<String, dynamic> message) {
//     print(message.toString());
//     print('hridoy');
//     if (preferences.getBool("Login")== false) {
//       // OneContext().showDialog(
//       //   // barrierDismissible: false,
//       //     builder: (context) => AlertDialog(
//       //       title: new Text("You are not logged in"),
//       //       content: new Text("Please log in"),
//       //       actions: <Widget>[
//       //         FlatButton(
//       //           child: Text('close'),
//       //           onPressed: () => Navigator.of(context).pop(),
//       //         ),
//       //         FlatButton(
//       //           child: Text('Login'),
//       //           onPressed: () {
//       //             // Navigator.of(context).pop();
//       //             //   OneContext().push(MaterialPageRoute(builder: (_) {
//       //             //     return Login();
//       //             //   }));
//       //             }
//       //         ),
//       //       ],
//       //     )
//       // );
//       return;
//     }
//     if (message['data']['item_type'] == 'order') {
//       // OneContext().push(MaterialPageRoute(builder: (_) {
//       //   return OrderDetails(
//       //       id: int.parse(message['data']['item_type_id']) ,
//       //       from_notification: true);
//       // }));
//     }
//     // If there's no view it'll just open the app on the first view
//   }
// }
