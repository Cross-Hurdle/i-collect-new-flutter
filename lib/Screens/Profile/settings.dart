import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Profile/FAQ.dart';
import 'package:icollekt/Services/Provider.dart';

import 'Service/ProfileRepositoryService.dart';


class Settings extends ConsumerStatefulWidget {
     final int?id;
  const Settings({ Key? key,this.id }) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}
class _SettingsState extends ConsumerState<Settings> {
 bool _keepLogin=false;
   FBAuth fbAuth =FBAuth();
   final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogIn = FacebookLogin();
  logout(CollectionData collectdata, HastagData tagdata,CreatebackgroungData bgdata,CreateProfileData dpdata) async {

    final  logoutResponse = await AuthRepository().getlogoutResponse();
        print('object');
     if(logoutResponse.result==true){
        //Fluttertoast.showToast(msg: logoutResponse.message,webPosition: 'center');
 showToast(logoutResponse.message,
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
        return  ;
     }   else if(logoutResponse.result==false){
        showToast(logoutResponse.message,
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
                      // preferences.remove('ID');
                      collectdata.selected.clear();
                      tagdata.selected.clear();
                       bgdata.filepathprov ='';
      dpdata.filepathprov='';
                       if (_keepLogin==false) {
        preferences.remove("Login");
         preferences.remove("Email");
          preferences.remove('Userid');
      } 
      ref.watch(notificationswitch).isSwitched=false;
        ref.watch(notificationswitch).isSwitched1=false;
        ref.watch(notificationswitch).isSwitched2=false;
                              
        // Fluttertoast.showToast(msg: logoutResponse.message);
         return
         Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) =>  MainRoute()),
            (Route<dynamic> route) => false,
          ); 
     }
  
   }
    void logoutFacebook() async{
  await facebookLogIn.logOut();
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {return Signin();},),);
  print("User Sign Out");
}
@override
void initState() { 
  super.initState();
   getstausview();
}
    bool isSwitched  = false;
      bool isSwitched1 = false;
       bool isSwitched2 = false;
       bool status= false;
       //  bool isSwitched3 = false;
            getstausview()async{  
  final statusResponse = await ProfileRepository().getnotificationstusviewResponse();
  
    try {
      setState(() {
        
      });
      if(statusResponse.deliveryNotification=='0'){
         isSwitched=false;
      }else{
         isSwitched=true;
      }
        if(statusResponse.inboxNotification=='0'){
         isSwitched1=false;
      }else{
         isSwitched1=true;
      }
        if(statusResponse.groupNotification=='0'){
         isSwitched2=false;
      }else{
         isSwitched2=true;
      }
     //statusResponse.deliveryNotification
    } catch (e) {
      print(e);
    } 
    status=true;
   setState(() {
     
   });
}
//        getupdatestausview()async{  
//   final statusResponse = await ProfileRepository().getnotificationUpdateResponse(isSwitched, isSwitched1, isSwitched2);
//   print(statusResponse.deliveryNotification);
//   print('object');
//      print(statusResponse.groupNotification);
//       print(statusResponse.inboxNotification);
//       isSwitched=statusResponse.deliveryNotification;
//       isSwitched1=statusResponse.inboxNotification;
//       isSwitched2=statusResponse.groupNotification;
//     status=true;
//    setState(() {
     
//    });
// }
ontapprovforscreen(){
   ref.watch(notificationswitch).isSwitched=isSwitched;
        ref.watch(notificationswitch).isSwitched1=isSwitched1;
        ref.watch(notificationswitch).isSwitched2=isSwitched2;
       // Navigator.pop(context);
}
ontapprov(){
   ref.watch(notificationswitch).isSwitched=isSwitched;
        ref.watch(notificationswitch).isSwitched1=isSwitched1;
        ref.watch(notificationswitch).isSwitched2=isSwitched2;
        Navigator.pop(context);
}
  Widget build(BuildContext context) {
  
    return WillPopScope(
      
      onWillPop: () {
        return ontapprov();
           
        },
      child: Scaffold(
        appBar: buildappbar(context),
        body: 
        Column(
          children: [
            if (status) 
            Container(
             margin: EdgeInsets.symmetric(vertical: 29,horizontal: 10),
             // height: 300,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
               color: Colors.white,
                 boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(2, 2), // changes position of shadow
            ),
              ],
              ),
              child: Column(
                children: [
                
                     
                     Container(
                        margin: EdgeInsets.symmetric(horizontal:14.sp,vertical: 14.sp),
                        child: Column(
                          children: [
      Row(
                        children: [
                      Text('Notifications',style: TextStyle(
          color: Color(0xff1A1A1A),
          fontSize: 14.sp,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600
        ),),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery status updates',style: TextStyle(
          color: Color(0xff1A1A1A),
          fontFamily: 'Gilroy',
           fontSize: 12.sp,
          fontWeight: FontWeight.w400
        ),),
                           Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                      isSwitched = value;
                      print(isSwitched);
                      //  getupdatestausview();
                });
              },
              
              inactiveThumbColor:  Colors.grey,
              inactiveTrackColor: Colors.grey[300] ,
              activeTrackColor:Colors.grey[300] ,
              activeColor: Color(0xff55D85A)
            ),
                        ],
                      ),
                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Inbox & Group chat updates',style: TextStyle(
          color: Color(0xff1A1A1A),
          fontFamily: 'Gilroy',
           fontSize: 12.sp,
          fontWeight: FontWeight.w400
        ),),
                           Switch(
              value: isSwitched1,
              onChanged: (value) async{
                setState(() {
                      isSwitched1 = value;
                      print(isSwitched1);
                         // getupdatestausview();
                      preferences.setBool('chatfcm',isSwitched1);
                      print( 'helloo ${preferences.getBool('chatfcm')}');
                });
              },
               
              inactiveThumbColor:  Colors.grey,
              inactiveTrackColor: Colors.grey[300] ,
              activeTrackColor:Colors.grey[300] ,
              activeColor: Color(0xff55D85A)
            ),
                        ],
                      ),
                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My collection type updates',style: TextStyle(
          color: Color(0xff1A1A1A),
          fontFamily: 'Gilroy',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400
        ),),
                           Switch(
              value: isSwitched2,
              onChanged: (value) {
                setState(() {
                      isSwitched2 = value;
                      print(isSwitched2);
                        // getupdatestausview();
                });
              },
               
              inactiveThumbColor:  Colors.grey,
              inactiveTrackColor: Colors.grey[300] ,
              activeTrackColor:Colors.grey[300] ,
              activeColor: Color(0xff55D85A)
            ),
                        ],
                      ),
        //            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text('Icollekt information updates',style: TextStyle(
        //   color: Color(0xff1A1A1A),
        //   fontFamily: 'Gilroy',
        //    fontSize: 12.sp,
        //   fontWeight: FontWeight.w400
        // ),),
        //                Switch(
                             
        //       value: isSwitched3,
        //       onChanged: (value) {
        //         setState(() {
        //           isSwitched3 = value;
        //           print(isSwitched3);
        //         });
        //       },
             
        //       inactiveThumbColor:  Colors.grey,
        //       inactiveTrackColor: Colors.grey[300] ,
        //       activeTrackColor:Colors.grey[300] ,
        //       activeColor: Color(0xff55D85A)
        //     ),
        //             ],
        //           ),
                          ],
                        ),
                      ),
                   InkWell(
             onTap: (){
                pushNewScreen(
          context,
          screen:Report(
                     id:widget.id
                  ) ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) => ontapprovforscreen());
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:100.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text( 'Report',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          ),
           InkWell(
             onTap: (){
                pushNewScreen(
          context,
          screen: Help(
      id:widget.id
                   ) ,
          withNavBar:false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) =>ontapprovforscreen());
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:100.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text('Help',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          ),
           InkWell(
             onTap: (){
                pushNewScreen(
          context,
          screen:FAQ() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) =>ontapprovforscreen());
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:100.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text( 'FAQ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          ),
                
                  // CustomButton(title: 'Report', ontapped: ()=> nav: false),
                  //  CustomButton(title: 'Help', ontapped:()=>, nav: false),
                  //   CustomButton(title: 'FAQ', ontapped:()=>, nav: false),
                  InkWell(
               onTap: ()async{
                //  bool isLoading;
                //  logoutFacebook();
                  logout(ref.watch(collectionProv),ref.watch(hastagProv),ref.watch(profilebgprov),ref.watch(profiledpprov));
                  
                  try {
      await googleSignIn.signOut();
       await fbAuth.signOut();
                                // if (_keepLogin) {
                                //   sharedPreferences.setBool("Login", true);
                                  
                                // } else {
                                //   sharedPreferences.setBool("Login", false);
                                // }
                              } catch (e) {
                               // setState(() => isLoading = false);
                              }     
        //           pushNewScreen(
        //     context,
        //     screen: ontapped() ,
        //     withNavBar: nav, // OPTIONAL VALUE. True by default.
        //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
              // onPressed(function: onpressedtitle);
            },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                width:90.w,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  color: Color(0xff591B4C)
                ),
                child: Center(child: Text("Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gilroy",
                  fontSize: 16
                ),
                )),
              ),
            )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
        leading: GestureDetector(
        onTap: (){
                 ref.watch(notificationswitch).isSwitched=isSwitched;
        ref.watch(notificationswitch).isSwitched1=isSwitched1;
        ref.watch(notificationswitch).isSwitched2=isSwitched2;
        print('hii1 ${ ref.watch(notificationswitch).isSwitched}');
          print('hii2 ${ ref.watch(notificationswitch).isSwitched1}');
            print('hii3 ${ ref.watch(notificationswitch).isSwitched2}');
         Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      centerTitle: true,
      title: Text('Settings',style: TextStyle(
        color: Color(0xff1A1A1A),
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700
      ),),
      // actions: [
      //   GestureDetector(
      //     onTap: (){

      //     },
      //     child: Image.asset("Assets/Images/search.png",
      //        width: 6.w,
      //         ),
      //   ),
      //   SizedBox(width: 4.w,)
      // ],
      elevation: 1,
    );
  }
}