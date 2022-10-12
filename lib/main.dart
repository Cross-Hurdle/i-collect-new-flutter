import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:icollekt/Model/EmailAlreadyExist.dart';
//import 'package:icollekt/Model/fcmTokenresponse.dart';
import 'package:icollekt/Screens/chat/MyGroupProfile.dart';
import 'package:icollekt/Services/Provider.dart';
import 'Exports/Exports.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:http/http.dart' as http;


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
    print('Handling a background message ${message.notification!.title}');
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
   preferences= await SharedPreferences.getInstance();
    

   runApp(MyApp());
} 
 bool keepSignedIn = false;

 class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}
// Crude counter to make messages unique
int _messageCount = 0;

/// The API endpoint here accepts a raw FCM payload for demonstration purposes.
String constructFCMPayload(String? token) {
  _messageCount++;
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      'count': _messageCount.toString(),
    },
    'notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This notification (#$_messageCount) was created via FCM!',
    },
  });
}
class _MyAppState extends ConsumerState<MyApp> {
  @override
   initState() {
    getInstance();
   userexist();
   
   gettocken();
   fcmtoken ();
   //getfcmtoken();
    listenfcm(context);
  
    super.initState();
    
  }
  String type ='home';

  late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
void listenfcm(BuildContext context)async{
  FirebaseMessaging.instance.getInitialMessage().then((message) {
    print('object$message');
  // if(message!=null){
  //    print('objectasd$message');
  //             Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Cart()
  //     ),
  //   );
  //        }
  } );
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      Map<String,dynamic> norificationvalue = message.data;
     
      print('Id ${norificationvalue['value'].toString()}');
       print('value ${norificationvalue['key_value'].toString()}');
         print('status ${norificationvalue['status'].toString()}');
          type=norificationvalue['key_value'];
      
       ref.watch(viewgroupprov).groupid=norificationvalue['value'];
          setState(() {
            
          });
          print('hello   ${ ref.watch(viewgroupprov).groupid}');
      //      int count =0;
      //  //ref.watch(creategroupnavigatorprov).creategroup=='create'?
       
      //          Navigator.of(context).popUntil((route) => count++ ==2);
      // print('hiiokkkkkkkkk$notification');
         print('message  ${ message.notification!.body}');
    //       Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Cart()
    //   ),
    // );
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
         message.notification.hashCode,
           message.notification!.title,
          message. notification!.body,
          NotificationDetails(
            android: AndroidNotificationDetails( 
              channel.id,
              channel.name,
              enableVibration: true,
               autoCancel:false,
                importance: Importance.high,
              icon: 'launch_background',
              
            ),
          ),
        );
       
    //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   //message.data.
    //   Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => Cart()
    //   ),
    // );
    // });
      
      }
    });
    
}

//FirebaseMessaging firebaseMessaging = FirebaseMessaging();
// firebasetrigger(BuildContext ctx){
//  FirebaseMessaging.onMessage
// }
void fcmtoken ()async{
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
void gettocken()async{
 await FirebaseMessaging.instance.getToken().then((token) => print(token));
}
  EmailAlreadyExistResponse? exitResponse;
  bool loader=false;
userexist() async {
  print('${preferences.getString("Email")}');
    exitResponse = await AuthRepository().getEmailalredyexitresponse(email:'${preferences.getString("Email")}' );
    print(exitResponse!.message);
    loader=true;
          setState(() {
            
          });
      
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }


  

  Future getInstance() async {
    preferences= await SharedPreferences.getInstance();
 //preferences.getBool('login');
    if ( preferences.getBool("Login") == true) {
      setState(() => keepSignedIn = true);
    } 
    // else if (preferences.getBool("Login")) {
    //   setState(() => keepSignedIn = true);
    // } 
    else if( preferences.getBool("Login") == false){
      setState(() => keepSignedIn = false);
    }
    }
     

// Future<void> sendPushMessage() async {
//    await FirebaseMessaging.instance.getToken().then((token) {
//   if (token == null) {
//       print('Unable to send FCM message, no token exists.');
//       return;
//     }

//     try {
//       http.post(
//         Uri.parse('https://api.rnfirebase.io/messaging/send'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: constructFCMPayload(token),
//       );
//       print('FCM request for device sent!');
//     } catch (e) {
//       print(e);
//     }
//    });
  
//   }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
          );
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
          );
        }
        break;
      case 'unsubscribe':
        {
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
          );
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
          );
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
              'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
            );
          }
        }
        break;
      default:
        break;
    }
  }


  page(){
    switch ( type ) {
      case 'like Post' :
        return MyGroupMessage(
            group: 'group',
            //inbox: false,
          ) ;
        // MyGroupProfile(isdirect: true,);

         case 'Group Post' :
        return MyGroupProfile(isdirect: true,) ;
         case 'join request accepted' :
        return 
        MyGroupMessage(
            group: 'group',
            //inbox: false,
          ) ;
         case 'chat' :
        return PersonalChat(isdirect: true,) ;
         case 'Your invite request accepted' :
         return MyGroupMessage(
            group: 'group',
            //inbox: false,
          );

      default:
      return MainPage();
    }
  }







  Widget build(BuildContext context) {
    
    return ProviderScope(
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
        
          title: 'Icollekt',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          
     //   home:Collection(number: 111,)
       home:  Builder(
           builder: (context) {
               print('${preferences.getString("Email")}');
               if (loader==true) {
                   if(exitResponse!.result==false){
      
    return  MainRoute();
       
     }   else{
               if (preferences.getString("Email")!='') {
                 if ( keepSignedIn) {
                   gettocken();
         return  page();
         //MainPage();
         }  else
        {
           return  MainRoute();
        }
             } else {
         return MainRoute();
             }
        
     }
               } else 
               return  Scaffold(
                 appBar:  appbar(context),
                 backgroundColor: Color(0xffF9F2FF),
                 body: Stack(
                   children: 
                             [Container(
                             //  color: Colors.black.withOpacity(0.5),
                               height: double.infinity,
                               width: double.infinity,
                               child: Center(child: CircularProgressIndicator()),
                             ),
                             Image.asset("Assets/Images/Icollekt.png")
                           ],
                 ),
               );
           }
         )
       //  keepSignedIn? MainPage():MainRoute()
         // Exp1() 
          //  CollectionHastags(
          //   id: 111,
          // )
 //home: CollectionHastags(id: 111,),
     //  DateOfBirth(id: 382,)
    
   //MainPage(id:416 ,)
       //SignUpProfileImage(id: 111,)
         // MainRoute(),
         // SignUpProfileImage(id: 3,)
      //     MainPage(
      //  id: 3,
      // )
          //ProfilePost()
          //SignUpMobileNumber()
        //  MainRoute(),
        
        );
      }),
    );
  }
  appbar(context){
  return AppBar(
      backgroundColor: kBackground,

      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      
      elevation: 1,
    );
}
}

