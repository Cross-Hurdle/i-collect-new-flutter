import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Model/fcmTokenresponse.dart';
import 'package:icollekt/Provider/provider%20helper.dart';


import 'Exports/Exports.dart';



class MainPage extends ConsumerStatefulWidget {
  final int? id;
  final int? index;

   MainPage({ Key? key,this.id,this.index=0 }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  DateTime timeBackpressed =DateTime.now();

PersistentTabController ?_controller ;
@override
void initState() { 
  _controller= PersistentTabController(initialIndex: widget.index!);
  super.initState();
  getfcmtoken();
}
  //  @override
  // void initState() {
  //   super.initState();

  //   // 1. This method call when app in terminated state and you get a notification
  //   // when you click on notification app open from terminated state and you can get notification data in this method

  //   FirebaseMessaging.instance.getInitialMessage().then(
  //     (message) {
  //       print("FirebaseMessaging.instance.getInitialMessage");
  //       if (message != null) {
  //         print("New Notification");
  //         if (message.data['_id'] != null) {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) => Cart()
  //             ),
  //           );
  //         }
  //       }
  //     },
  //   );

  //   // 2. This method only call when App in forground it mean app must be opened
  //   FirebaseMessaging.onMessage.listen(
  //     (message) {
  //       print("FirebaseMessaging.onMessage.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data11 ${message.data}");
  //          Localnotification.createanddisplaynotification(message);

  //       }
  //     },
  //   );
  //   FirebaseMessaging.onMessageOpenedApp.listen(
  //     (message) {
  //       print("FirebaseMessaging.onMessageOpenedApp.listen");
  //       if (message.notification != null) {
  //         print(message.notification!.title);
  //         print(message.notification!.body);
  //         print("message.data22 ${message.data['_id']}");
  //          if (message.data['_id'] != null) {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) => Cart()
  //             ),
  //           );
  //         }
  //       }
  //     },
  //   );
  // }
     FcmTokenResponse?getfcmtokenResponse ;
getfcmtoken() async {
 // print('${preferences.getString("Email")}');
  await FirebaseMessaging.instance.getToken().then((token)async {
//  if(preferences.getBool('chatfcm')==true){
//  getfcmtokenResponse = await AuthRepository().getfcmtoken(userid:preferences.getString("Email"),fcmtoken:''  );
//    print( getfcmtokenResponse!.message);
//   // print('token     ${token}');
//           setState(() {
            
//           });
//  }else{
 getfcmtokenResponse = await AuthRepository().getfcmtoken(userid:preferences.getInt('Userid'),fcmtoken: token );
 print('userId: ${preferences.getInt('Userid')}');
   print( getfcmtokenResponse!.message);
    print('token     $token');
          setState(() {
            
          });
// }
  });

   
      
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
  @override
  Widget build(BuildContext context) {
  
    return Container(
      color: Colors.white,
      child: SafeArea(
        child:  Scaffold(
          appBar:  appbar(context),
          backgroundColor: Color(0xffF9F2FF),
         
          bottomNavigationBar: bar()
          //bottomNavBar(),
        ),
      ),
    );
  }

 
  Widget bar(){
    List<Widget> _buildScreens() {
        return [
        // Home(),
         Search(),
         Chat(),
         UploadQuestion(),
       // StartSelling(),
       //  Upload(),
         Profile(
           id: widget.id,
         ),
        ];
    }
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
          
            PersistentBottomNavBarItem(
              
                icon:SvgPicture.asset(
                "Assets/Images/home.svg",
               
              ),
             inactiveIcon:
             SvgPicture.asset(
                "Assets/Images/home.svg",
                 color:Color(0xff1A1A1A),
              ),
             
             
            ),
            // PersistentBottomNavBarItem(
            //    icon:  SvgPicture.asset(
            //      "Assets/Images/search.svg",
            //      color:Color(0xff591B4C)
            //   ),
            //     inactiveIcon:  SvgPicture.asset(
            //      "Assets/Images/search.svg",
               
            //   ),
              
            //     activeColorPrimary: Color(0xff591B4C),
            //     inactiveColorPrimary: Color(0xff1A1A1A),
            // ),
              PersistentBottomNavBarItem(
                 icon:  SvgPicture.asset(
                 "Assets/Images/mail.svg",
                   color:Color(0xff591B4C)
                // color:
                //     _currentIndex == 2 ? Color(0xff591B4C) : Color(0xff1A1A1A),
               // height: 20,
              ),
                inactiveIcon: SvgPicture.asset(
                 "Assets/Images/mail.svg",
                 color:Color(0xff1A1A1A),
              ),
                activeColorPrimary: Color(0xff591B4C),
                inactiveColorPrimary: Color(0xff1A1A1A),
            ),
            PersistentBottomNavBarItem(
                 icon: SvgPicture.asset(
               "Assets/Images/upload.svg",
                 color:Color(0xff591B4C)
             
            ),
                 inactiveIcon: SvgPicture.asset(
               "Assets/Images/upload.svg",
              
              ),
             
            ),
            
              PersistentBottomNavBarItem(
               icon: SvgPicture.asset(
                 "Assets/Images/profile.svg",
                 color:Color(0xff591B4C)
              ),
                inactiveIcon: SvgPicture.asset(
                "Assets/Images/profile.svg",
                
              ), 
             
            ),
           
        ];
    }
    return PersistentTabView(
      
        context,
       resizeToAvoidBottomInset : false,
       navBarHeight: 70,
        controller: _controller,
        onItemSelected: (int  i){
         if (i==0) {
           ref.read(scrollProvider).scrolled();
         }
        },
        screens: _buildScreens(),
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style6,
        
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
       
       stateManagement: true, // Default is true.
       hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.// Choose the nav bar style with this property.
    );
  }
 
 AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,

      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      actions: [
        Image.asset("Assets/Images/shop.png",
     width: 12.w,
      ),
      ],
      elevation: 1,
    );
  }
}

