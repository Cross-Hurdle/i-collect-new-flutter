

// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/InboxChatResponseModle.dart';
import 'package:icollekt/Screens/chat/MyGroupProfile.dart';
import 'package:icollekt/Screens/chat/PersonalChatContact.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:intl/intl.dart';

class MyGroupMessage extends ConsumerStatefulWidget {
final String? group;
 final String ?inbox;
 final bool? isdirect;
  MyGroupMessage({Key? key,this.group, this.inbox,this.isdirect=false}) : super(key: key);

  @override
  _MyGroupMessageState createState() => _MyGroupMessageState();
}
 
class _MyGroupMessageState extends ConsumerState<MyGroupMessage> {
var iselected;
  void initState() {
    iselected=widget.group;
    setState(() {
      
    });
   getgroupdata();
    groupdata.clear();
    getInboxdata();
    inboxchat.clear();
    super.initState();
  }
  var inbox;

  List groupdata=[];
  // List groupgetdata=[];
  getgroupdata()async{  
  
  final groupResponse = await GroupAndChatRepository().getMyGroupData();
   groupdata.clear();
  if(groupResponse.data != null){ 
   groupdata.addAll( groupResponse.data.reversed); 
  }
 if (mounted) {
    setState(() {
  
  });
 }
}
List inboxchat=[];
InboxPersonalChatDataResponse ?inboxResponse;
bool status=false;
 Future getInboxdata()async{  
  inboxResponse = await GroupAndChatRepository().getMyInboxData();
 //inboxchat.clear();
 print('object');
 status=true;
  print( inboxResponse!.userData.length);
  if(mounted){
    setState(() {
  
  });
  }
}
//  OnetoonConnectionResponse? onetoonConnectionResponse;

// Future getonetoonConnectionResponseData(ChatData chatdata)async { 
//     onetoonConnectionResponse = await GroupAndChatRepository().getonetooneConnectionResponse(id:chatdata.id!);
//          print("all12${onetoonConnectionResponse!.id}");
//   return onetoonConnectionResponse!.id;
//  // chatdata.roomid=onetoonConnectionResponse!.id;


// }
callback(){
  setState(() {
    
  });
  
  getgroupdata();
  groupdata.clear();
}
  empty( CreateGroupData groupdp){
        groupdp.file?.path.isEmpty;
        groupdp.filepathprov?.absolute;
      }
  late  bool inboxmsg =true;
    late  bool groupmsg=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F2FF),
      appBar: buildappbar(context),
      body: RefreshIndicator(
        onRefresh: () async {getgroupdata();groupdata.clear();},
        child: CustomScrollView(
          physics:  BouncingScrollPhysics(),
          slivers: 
            [
              SliverList(delegate: SliverChildListDelegate(
                [
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container( 
                       height: 7.h,
                       width:60.w,
                        decoration: BoxDecoration(
                          color: Color(0xffD7D9E9),
                     borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                 BoxShadow(
                   color: Colors.black12,
                   spreadRadius: 0,
                   blurRadius: 1,
                   offset: Offset(1, 1), // changes position of shadow
                 ),
                   ],
                   ),
                      // width: double.infinity,
                       
                       margin: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 60.sp),
                       child: Row(mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           GestureDetector(
                             onTap: (){
                               print('inbox');
                               getInboxdata();
                               //print(inboxmsg);
                             setState(() {
                               iselected='inbox';
                                // inboxmsg =true;
                              //   inboxmsg?inbox():Container();
                             });
                              //  widget.inbox?inbox():Container();
                             },
                             child: Container(
                                height: 5.h,
                               width: 25.w,
                                decoration:  iselected=='inbox' ?BoxDecoration(
                           color:  Colors.white,
                     borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                 BoxShadow(
                   color: Colors.black12,
                   spreadRadius: 0,
                   blurRadius: 1,
                   offset: Offset(1, 1), // changes position of shadow
                 ),
                   ],
                   ): BoxDecoration(
                   color:  Color(0xffD7D9E9)
                   ),
                              
                               child: Center(child: Text('Inbox',
                                style: TextStyle(
            color: Color(0xff010101),
            fontWeight: FontWeight.w700,
            fontFamily: "Gilroy",
            fontSize: 11.sp
                       ),
                               ))),
                           ),
                            GestureDetector(
                                onTap: (){
                                  print(groupmsg);
                                  print('group');
                                   getgroupdata();
                                   
                                    setState(() {
                                        iselected='group';
                                      //groupmsg =true;
                               //  groupmsg?group():Container();
                             });
                              //  widget.inbox?group():Container();
                             },
                              child: Container(
                                 height: 5.h,
                               width: 25.w,
                                 decoration:iselected=='group' ? BoxDecoration(
                           color:  Colors.white,
                     borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                 BoxShadow(
                   color: Colors.black12,
                   spreadRadius: 0,
                   blurRadius: 1,
                   offset: Offset(1, 1), // changes position of shadow
                 ),
                   ],
                   ): BoxDecoration(
                   color:  Color(0xffD7D9E9)
                   ),
                                
                               //  color: widget.group? Colors.green:Colors.red,
                                child: Center(child: Text('Group',
                                 style: TextStyle(
            color: Color(0xff010101),
            fontWeight: FontWeight.w700,
            fontFamily: "Gilroy",
            fontSize: 11.sp
                       ),
                                ))),
                            )
                         ],
                       ),
                     ),
                   ],
                 ),
              // groupmsg?group():Container(),
              //  inboxmsg?group():Container(),
             iselected=='group'? group(ref.watch(viewMygroupprov),ref.watch(viewgroupprov)):Container(),
              iselected=='inbox'?inbox1():Container(),
            
                ]
              ),
              
              ),
          ],
        ),
        
      ),
    
      floatingActionButton: iselected=='group'?  FloatingActionButton(
        backgroundColor: Color(0xff591B4C),
        child: Icon(Icons.add,size: 30,),
        onPressed: (){
         empty(ref.watch(creategroupprov));
           ref.watch(creategroupnavigatorprov).creategroup='add';
            pushNewScreen(
          context,
          screen: CreateaGroup() ,
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) {
       callback();
      } );
        }):FloatingActionButton(
        backgroundColor: Color(0xff591B4C),
        child: Icon(Icons.add,size: 30,),
        onPressed: (){
            pushNewScreen(
          context,
          screen:PersonalChatContact(),
          //ChatContact(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) =>   getInboxdata());
        })
    );
  }
  Widget group(ViewMyGroupData mygroupview,ViewGroupData allgroupview){
     
    return   groupdata.length!=0?ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 1,
              //  // crossAxisSpacing: 5.0,
              //    mainAxisExtent: 13.h,
              //  mainAxisSpacing: 0,
              // ),
              itemCount:groupdata.length,
              itemBuilder: (context, index) {
               
                return GestureDetector(
         onTap: (){
            mygroupview.groupname=groupdata[index].subject;
                mygroupview.groupImagedp=groupdata[index].groupImage;
                mygroupview.message=groupdata[index].message;
           allgroupview.groupid=groupdata[index].groupId;
 pushNewScreen(
          context,
          screen: MyGroupProfile(),
          //GroupChat() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) =>  getgroupdata());
         },
         child: Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          // margin: EdgeInsets.symmetric(vertical: 4.sp,horizontal: 10),
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
           width: 3.w,
           child: Column(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SizedBox(height: 1.h,),
               Row(
                 children: [
                    SizedBox(width: 3.w,),
                    CircleAvatar(
                     radius: 24,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child:
                       CachedNetworkImage(
        imageUrl:groupdata[index].groupImage,
        
      ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
         width: 9.5.h,
                        height: 9.5.h,
                           fit: BoxFit.cover,
                           
             imageBuilder: (context, imageProvider) =>CircleAvatar(
                    radius: 33.sp,
  
                    child:  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
         // colorFilter:
            //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
              ),
    ),
  ),                 
                    ),
                            
        progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
     ),

                    ),
                  ),
                   SizedBox(width: 2.w,),
                   Column(crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(groupdata[index].subject,
                     style: TextStyle(
          color: Color(0xff343339),
          fontWeight: FontWeight.w700,
          fontFamily: "Gilroy",
          fontSize: 13.sp
                     ),
                     ),
                     SizedBox(height: 1.h,),
         Text(groupdata[index].message,
                     style: TextStyle(
          color: Color(0xff343339),
          fontWeight: FontWeight.w400,
          fontFamily: "Gilroy",
          fontSize: 11.sp
                     ),
                     ),
                     ],
                   )
                 ],
               ),
               SizedBox(height: 1.h,),
             ],
           ),
         ),
       );
              },
            ):Container(
              height: 50.h,
              child: Center(child: Text('No Group')));
  }
 Widget inbox1(){
   final chatprov=ref.watch(chatdataprov);
    if (!status) {
                 return Container(
                    height: 50.h,
                   child: Center(child: CircularProgressIndicator()));
               }else{
   return 
     inboxResponse!.userData.length!=0?   
    
        StreamBuilder(
          stream: getInboxdata().asStream(),
          builder: (context, snapshot) {
            return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 5.0,
                             mainAxisExtent: 12.h,
                            mainAxisSpacing: 0,
                          ),
                          reverse: true,
                          itemCount:inboxResponse!.userData.length,
                          itemBuilder: (context, index) {
                              DateTime? convert = DateTime.tryParse(inboxResponse!.userData[index].createdAt.toIso8601String());
             //var dateString = DateFormat.jm().format(DateFormat("yy hh:mm:ss").parse('2022-02-14T18:02:15.000Z'));
             String date = DateFormat('h:ss a').format(convert!.add(new Duration(hours: 5,minutes: 18)));
                      //         if (!status) {
                      //    return Center(child: CircularProgressIndicator());
                      //  }else
                            return  GestureDetector(
                             onTap: ()async{
                                chatprov.id=inboxResponse!.userData[index].toUserId;
                      chatprov.image=inboxResponse!.userData[index].user.profilePic;
                      chatprov.name=inboxResponse!.userData[index].user.name;
                     // int id=inboxResponse!.userData[index].connectionId;
                    // await getonetoonConnectionResponseData(ref.read(chatdataprov));
                    // print(onetoonConnectionResponse!.id);
                     //  Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalChat()))
                      pushNewScreen(
                      context,
                      screen:  PersonalChat(
                        //connectionId: inboxResponse!.userData[index].connectionId.toInt()
                       ) ,
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  ).then((value) =>   getInboxdata());
                             
                             },
                             child: Container(
                               margin: EdgeInsets.symmetric(vertical: 4.sp,horizontal: 10.sp),
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
                               width: 3.w,
                               child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   SizedBox(height: 1.h,),
                                   Row(
                                     children: [
                                        SizedBox(width: 1.h,),
                                      CircleAvatar(
                                 radius: 24,
                                backgroundColor: Colors.white,
                                child: ClipOval(
                                  child:
                                   CachedNetworkImage(
                    imageUrl:'${inboxResponse!.userData[index].user.profilePic}',
                    
                  ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                     width: 9.5.h,
                                    height: 9.5.h,
                                       fit: BoxFit.cover,
                                       
                         imageBuilder: (context, imageProvider) =>CircleAvatar(
                                radius: 33.sp,
              
                                child:  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                     // colorFilter:
                        //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                          ),
                ),
              ),                 
                                ),
                                        
                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                            CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                 ),
             
                                ),
                              ),
                                       SizedBox(width: 1.h,),
                                       Column(crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Row(
                                             children: [
                                               Container(
                                                 width: 40.w,
                                                 child: Text('${inboxResponse!.userData[index].user.name}',
                                                  overflow: TextOverflow.ellipsis,
                                         style: TextStyle(
                              color: Color(0xff343339),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Gilroy",
                              fontSize: 13.sp
                                         ),
                                         ),
                                               ),
                                        
                                             ],
                                           ),
                                         SizedBox(height: 1.h,),
                             Container(
                               width: 52.w,
                               child: Text('${inboxResponse!.userData[index].chat}',
                               
                                           style: TextStyle(
                                             
                                             overflow: TextOverflow.ellipsis,
                                             
                                color: Color(0xff343339),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Gilroy",
                                fontSize: 11.sp
                                           ),
                                           ),
                             ),
                                         ],
                                       ),
                                        Container(
                                          margin: EdgeInsets.only(left: 15.sp),
                                         // color: Colors.red,
                                          height: 6.h,
                                          child: Text('$date',
                                           style: TextStyle(
                              color: Color(0xff343339),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Gilroy",
                              fontSize: 11.sp
                                           ),
                                           ),
                                        ),
                                     ],
                                   ),
                                   SizedBox(height: 1.h,),
                                 ],
                               ),
                             ),
                           );
                          },
                        );
          }
        )
      
                   :Container(
              height: 50.h,
              child: Center(child: Text('No Chats')));
                }
              //   :Container(
              // height: 50.h,
              // child: Center(child: Text('No Chats')));
 }
    
    AppBar buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
        leading: GestureDetector(
        onTap: (){
           if (widget.isdirect!) {
            Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) =>
  MainPage(index: 2,)
  // (isdirect: true,)
  //  MyGroupMessage(
  //          //  inbox: "inbox",
  //          isdirect: true,
  //            group: "inbox",
  //         ) ,
  ),
  (Route<dynamic> route) => false,
);
            }else{
              Navigator.pop(context);
            }
        // Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      centerTitle: true,
      // title: Text('Report',style: TextStyle(
      //   color: Color(0xff1A1A1A),
      //   fontFamily: 'Gilroy',
      //   fontWeight: FontWeight.w700
      // ),),
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
