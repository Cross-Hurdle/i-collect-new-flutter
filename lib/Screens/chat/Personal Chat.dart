import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/OneToOnePersonalChat.dart';
import 'package:icollekt/Model/PersonalSendMessageModle.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';



class PersonalChat extends ConsumerStatefulWidget {
  final int? connectionId;
  final bool? isdirect;
  const PersonalChat({ Key? key,this.connectionId,this.isdirect=false }) : super(key: key);

  @override
  _PersonalChatState createState() => _PersonalChatState();
}

class _PersonalChatState extends ConsumerState<PersonalChat> {
 // TextEditingController _chatcontroller= TextEditingController();
   bool emojiShowing = false;
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
  _onEmojiSelected(Emoji emoji) async {
  _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset:_controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }
  
  //MultiImage Picker
List<Asset> images = [];
  String error1 = 'No Error Dectected';



void initState() { 
  super.initState();
 print(widget.connectionId);
   getallchatresponse();
    //var dateString = DateFormat.jm().format(DateFormat("yy hh:mm:ss").parse('2022-02-14T18:02:15.000Z'));
    DateTime? convert = DateTime.tryParse('2022-02-14T18:02:15.000Z');
    //var dateString = DateFormat.jm().format(DateFormat("yy hh:mm:ss").parse('2022-02-14T18:02:15.000Z'));
    String date = DateFormat('hh:ss a').format(convert!);
   print(date);
   // chatitems.clear();   
}

  Future<void> loadAssets() async {
    List<Asset> resultList = [];
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 50,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
         // doneButtonTitle: "Fatto",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "ICollekt App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      error1 = error;
    });
  }


List chatitems=[];
  TextEditingController _controller = TextEditingController();

 //Connection User
//  OnetoonConnectionResponse? onetoonConnectionResponse;

// getonetoonConnectionResponseData(ChatData chatdata)async { 
//     onetoonConnectionResponse = await GroupAndChatRepository().getonetooneConnectionResponse(id: chatdata.id!);
     
//   // chatdata.roomid=  onetoonConnectionResponse!.id;
  
//     print("all1${onetoonConnectionResponse!.id}");
//     setState(() {});

// }
PersonalSendMessage? onePersonalChatDataResponse;
getCollectionData(OneToOneChatDataProv chat,ChatData chatdata)async { 
     onePersonalChatDataResponse = (await GroupAndChatRepository().getChatResponse(
       chat: _controller.text,
       id: chatdata.id!,
       connectionId: widget.connectionId!)) ;
      print("all55${chatdata.roomid}");
     setState(() {
       
     });
     if (onePersonalChatDataResponse?.status=='Success') {
        _controller.clear();
     }
   print( onePersonalChatDataResponse?.status);

//  streamcontrollers.sink.done;
  //  chatitems.clear() ;  

}
OneToOnePersonalChatDataResponse? allchatresponse;
bool status=false;
Stream ?streamresponse;
Future getallchatresponse()async{
  
  allchatresponse=   await GroupAndChatRepository().getAllmychatData(id: widget.connectionId!,);  
  print( widget.connectionId!);
  status=true;
  setState(() {
  
});           

}
Future getalldeletechatresponse()async{
  
  allchatresponse=   await GroupAndChatRepository().getAllDeletechatData(id: widget.connectionId!,);  
  // status=true;
  setState(() {
  
});           

}
 back(){
    if (widget.isdirect!) {
               pushNewScreen(
          context,
        screen: MyGroupMessage(
           //  inbox: "inbox",
           isdirect: true,
             group: "inbox",
          ) ,
          //ChatContact(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return MyGroupMessage(
           //  inbox: "inbox",
           isdirect: true,
             group: "inbox",
          ) ;
          },
        ),
        (_) => false,
      );
//             Navigator.pushAndRemoveUntil(
//   context,
//   MaterialPageRoute(builder: (context) =>
//    MyGroupMessage(
//            //  inbox: "inbox",
//            isdirect: true,
//              group: "inbox",
//           ) ,
//   ),
//   (Route<dynamic> route) => false,
// );
            }else{
              Navigator.pop(context);
            }
 }
  @override
  Widget build(BuildContext context) {
   // final chat =ref.watch(onetoonechatdataprov);
    return WillPopScope(
      onWillPop: () { 
        return  back();
       },
      child: Scaffold(
        appBar: buildappbar(context,ref.watch(chatdataprov)),
        backgroundColor: Color(0xffF9F2FF),
        body: Column(
          children: [
            
            Expanded(
              child: StreamBuilder(
               // initialData: ,
                stream: getallchatresponse().asStream(),
                //getallchatresponse(ref.watch(chatdataprov)) ,
                builder: (BuildContext context,AsyncSnapshot snapshot) {
                 // allchatresponse=snapshot.data;
                 if (!status) {
                   return Center(child: CircularProgressIndicator());
                 }else
                   return 
                  ListView.builder(
                    reverse: true,
                    itemCount: allchatresponse!.data.length,
              itemBuilder: (context,index){
               DateTime? convert = DateTime.tryParse(allchatresponse!.data[index].createdAt.toString());
      //var dateString = DateFormat.jm().format(DateFormat("yy hh:mm:ss").parse('2022-02-14T18:02:15.000Z'));
      String date = DateFormat('h:ss a').format(convert!.add(new Duration(hours: 5,minutes: 18)));
       
             return Container(
               margin: EdgeInsets.symmetric(vertical: 4),
               child: PersonalChatContainer(
                 time: date,
               message:allchatresponse!.data[index].chat,
                 touserid: allchatresponse!.data[index].toUserId,
                 fromuserid:allchatresponse!.data[index].fromUserId),
             );
                });
        //          if(snapshot.hasData){
        //            print(snapshot.data);
        //          var jsonvar= json.decode(snapshot.data.toString());
        //           allchatresponse=OneToOnePersonalChatDataResponse.fromJson(jsonvar);
        // //               allchatresponse?.data.forEach(
        // //   (element) {
           
        // //        chatitems.add(
        // //         {
                
        // //        "Id": element.id,
        // //       "chat": element.chat,
        // //       "from": element.fromUserId,
        // //       "to": element.toUserId
             
      
                
        // //         },
        // //       );
        // //   },
          
        // // );  
        //           return 
        //           ListView.builder(
        //            // reverse: true,
        //             itemCount: allchatresponse!.data.length,
        //       itemBuilder: (context,index){
               
        //      return PersonalChatContainer(
        //      message:allchatresponse!.data[index].chat,
        //        touserid: allchatresponse!.data[index].toUserId,
        //        fromuserid:allchatresponse!.data[index].fromUserId);
        //         });
        //          }else{
        //            return Center(child: CircularProgressIndicator());
        //          }
                 
                
                }
              )
              // ListView.builder(
              //       //  shrinkWrap: true,
              //          // controller: _scrollController,
              //           itemCount: 10,
              //         itemBuilder: (context,index){
              //         
                     
              //         // Column(
              //         //   children: [
              //         //     SizedBox(height: 20,),
              //         //     PersonalChatContainer(chat: false,),
              //         //     PersonalChatContainer(chat: true,),
              //         //   ],
              //         // );
              //       }),
            ),
            SizedBox(height: 15,),
           //  buildGridView(),
            // Expanded(child: SingleChildScrollView(child: Container(
            //   child: Column(
            //     children: [
            //       ListView.builder(
            //         itemCount: 10,
            //         itemBuilder: (context,index){
            //         return PersonalChatContainer(chat: true,);
            //       })
            //       // Container(height: 100,color: Colors.red,),
            //       //  Container(height: 100,color: Colors.green,),
            //       //   Container(height: 1000,color: Colors.yellow,),
            //     ],
            //   ),
            // ))),
          chattext(),
           Offstage(
                offstage: !emojiShowing,
                child: SizedBox(
                  height: 250,
                  child: EmojiPicker(
                      onEmojiSelected: (Category category, Emoji emoji) {
                        _onEmojiSelected(emoji);
                      },
                      onBackspacePressed: _onBackspacePressed,
                      config: Config(
                          columns: 7,
                          // Issue: https://github.com/flutter/flutter/issues/28894
                          emojiSizeMax: 30 * (Platform.isAndroid ? 1.0 : 1.0),
                          verticalSpacing: 0,
                          horizontalSpacing: 0,
                          initCategory: Category.SMILEYS,
                          bgColor: const Color(0xFFF2F2F2),
                          indicatorColor: Colors.blue,
                          iconColor: Colors.grey,
                          iconColorSelected: Color(0xff591B4C),
                          progressIndicatorColor: Colors.blue,
                          backspaceColor: Color(0xff591B4C),
                          skinToneDialogBgColor: Colors.white,
                          skinToneIndicatorColor: Colors.grey,
                          enableSkinTones: true,
                          showRecentsTab: true,
                          recentsLimit: 28,
                          noRecentsText: 'No Recents',
                          noRecentsStyle: const TextStyle(
                              fontSize: 10, color: Colors.black26),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: const CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL)),
                ),
              ),
          ],
        ),
        
      ),
    );
    
  }
  
  Widget buildGridView() {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
                images.length==1?Container(
                width:60.w,
              ):Container(
                width:30.w,
              ),
              Expanded(
                child: images.length!=0?Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height:   images.length<=2?22.h:34.h,
                     decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffC1BFFF),
                                   boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(2, 2), // changes position of shadow
                              ),
                                ],
                                ),
                    child: GridView.count(
                      crossAxisCount: images.length<2?1:2,
                      children: List.generate(images.length, (index) {
                        Asset asset = images[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffC1BFFF),
                                   boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(2, 2), // changes position of shadow
                              ),
                                ],
                                ),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Container(
                                child: AssetThumb(
                                  
                                 spinner:  Center(
                                   
                                   child: CircularProgressIndicator(
                                     strokeWidth: 4,
                                   )),
                                  asset: asset,
                                  width: 300,
                                  height: 300,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ):Container()
              ),
            
            ],
          ),
        ],
      ),
    );
  }
  chattext(){
return   Container(
            // margin: EdgeInsets.only(bottom: 10.sp),
             padding: EdgeInsets.only(right: 10.sp),
               color: Colors.white,
            child: Row(
              children: [
                 
                Container(
                //    margin: EdgeInsets.only(left: 49.sp,bottom: 10.sp),
                
                  //width: 2.w,
                  color: Colors.white,
                child: Row(
                  children: [
                     SizedBox(width: 3.w,),
                             InkWell(
                               onTap: (){
                                 setState(() {
                            emojiShowing = !emojiShowing;
                          });
                               },
                               child: SvgPicture.asset( "Assets/Images/Smile.svg",
                               height: 3.3.h,
                                                         ),
                             ),
                     //SizedBox(width: 3.w,),
                    //  InkWell(
                    //    onTap: loadAssets,
                    //    child: SvgPicture.asset( "Assets/Images/chatcamera.svg",
                    //      height: 3.6.h,
                    //           ),
                    //  ),
                       
                  ],
                ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 4.sp,bottom: 20.sp),
                    
                    color: Colors.white,
                    child: TextField(
                        controller: _controller,
                                  //  focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                      cursorHeight: 23,
                      // controller:_chatcontroller,
          decoration: InputDecoration(
            
            border: InputBorder.none,
            hintText: 'Type something...',
            hintStyle: TextStyle(
              color: Color(0xffAAAAAA),
              fontSize: 14.sp
            ),
            contentPadding: EdgeInsets.only(left: 8.sp,top: 8.sp),
          //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
        //  ),
        )
                    )),
                ),
                  Container(width: 12.w,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                           //sendPushMessage();
                           getCollectionData(ref.read(onetoonechatdataprov),ref.read(chatdataprov)); 
                          // if(_controller.text.isNotEmpty){
  
 
                          //     //  _controller.clear();     
                          // }
                              
                           setState(() {
                             
                           });
                          
                        },
                        child: Container(
                          width: 12.w,
                          height: 12.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:  Color(0xff591B4C),
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 1.w,),
                              SvgPicture.asset( "Assets/Images/Send.svg",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  ),
              ],
            ),
          );
          
  }
      AppBar buildappbar(context,ChatData chatData){
    return AppBar(
      backgroundColor: kBackground,
        leading: Container(
          margin: EdgeInsets.only(left: 10.sp),
          child: GestureDetector(
          onTap: (){
            if (widget.isdirect!) {
               pushNewScreen(
          context,
        screen: MyGroupMessage(
           //  inbox: "inbox",
           isdirect: true,
             group: "inbox",
          ) ,
          //ChatContact(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return MyGroupMessage(
           //  inbox: "inbox",
           isdirect: true,
             group: "inbox",
          ) ;
          },
        ),
        (_) => false,
      );
//             Navigator.pushAndRemoveUntil(
//   context,
//   MaterialPageRoute(builder: (context) =>
//    MyGroupMessage(
//            //  inbox: "inbox",
//            isdirect: true,
//              group: "inbox",
//           ) ,
//   ),
//   (Route<dynamic> route) => false,
// );
            }else{
              Navigator.pop(context);
            }
         
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        ),
     // centerTitle: true,
      title: Container(
        child: Row(
          children: [
            Column(
              children: [
   CircleAvatar(
                       radius: 16.sp,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child:
                         CachedNetworkImage(
          imageUrl:'${chatData.image}',
          
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
              ],
            ),
            SizedBox(width: 5.w,),
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 35.w,
                  child: Text('${chatData.name}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Color(0xff1A1A1A),
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w700
                  ),),
                ),
                // Text('Last seen at 8.54PM',style: TextStyle(
                //   color: Color(0xff969696),
                //   fontFamily: 'Gilroy',
                //   fontSize: 10.sp,
                //   fontWeight: FontWeight.w400
                // ),),
              ],
            ),
          ],
        ),
      ),
      actions: [
         PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Colors.black,),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              // const PopupMenuItem(child: Text('Images',style: TextStyle(
              //   fontFamily: 'Gilroy',
              //   fontSize: 17,
              //   fontWeight: FontWeight.w600,
              //   color: Color(0xff591B4C)),)),
              PopupMenuItem(
                onTap: (){
                  getalldeletechatresponse();
                },
                height: 62,
                child: Text('Clear Chat',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff591B4C)))),
              // const PopupMenuItem(child: Text('Mute Notifications',style: TextStyle(
              //   fontFamily: 'Gilroy',
              //   fontSize: 17,
              //   fontWeight: FontWeight.w600,
              //   color: Color(0xff591B4C)))),
              // const PopupMenuItem(child: Text('Report',style: TextStyle(
              //   fontFamily: 'Gilroy',
              //   fontSize: 17,
              //   fontWeight: FontWeight.w600,
              //   color: Color(0xff591B4C)))),
              // const PopupMenuItem(child: Text('Block',style: TextStyle(
              //   fontFamily: 'Gilroy',
              //   fontSize: 17,
              //   fontWeight: FontWeight.w600,
              //   color: Color(0xff591B4C)))),
            ],
          ),
       
        SizedBox(width: 4.w,)
      ],
      elevation: 1,
    );
    
  }
}

class PersonalChatContainer extends ConsumerStatefulWidget {
  final int? fromuserid;
   final int? touserid;
  final String? message;
  final String ? time;
  PersonalChatContainer({ Key? key,this.fromuserid,this.touserid,this.message,this.time }) : super(key: key);

  @override
  _PersonalChatContainerState createState() => _PersonalChatContainerState();
}

class _PersonalChatContainerState extends ConsumerState<PersonalChatContainer> {
  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment: 
    preferences.getInt('Userid')==widget.fromuserid?  Alignment.centerRight
      : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child:widget.message!=""? Column(
          crossAxisAlignment: preferences.getInt('Userid')!=widget.fromuserid? CrossAxisAlignment.start:CrossAxisAlignment.end,
          children: [
            Card(
     
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: preferences.getInt('Userid')==widget.fromuserid?BorderRadius.only(
       topLeft:Radius.circular(10.0),
             topRight: Radius.circular(10.0),
             bottomLeft: Radius.circular(10.0),
             bottomRight: Radius.zero,
                   ): BorderRadius.only(
             topLeft: Radius.zero,
             topRight: Radius.circular(10.0),
             bottomLeft: Radius.circular(10.0),
             bottomRight: Radius.circular(10.0),
                   ),),
              color: preferences.getInt('Userid')==widget.fromuserid?  Color(0xff591B4C): Color(0xff3641B7),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 30,
                      top: 5,
                      bottom: 10,
                    ),
                    child: preferences.getInt('Userid')==widget.fromuserid?Text(widget.message.toString(),
                style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontFamily: "Gilroy",
                                         fontSize: 11.5.sp,
                                         color: Colors.white
                                       ),
                    ):Text(widget.message.toString(),
                style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontFamily: "Gilroy",
                                         fontSize: 11.5.sp,
                                         color: Colors.white
                                       ),)
                  ),
                  // Positioned(
                  //   bottom: 4,
                  //   right: 10,
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //        '2.00',
                  //         style: TextStyle(
                  //           fontSize: 13,
                  //           color: Colors.grey[600],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 5,
                  //       ),
                  //       Icon(
                  //         Icons.done_all,
                  //         size: 20,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
             preferences.getInt('Userid')==widget.fromuserid?Padding(
               padding:  EdgeInsets.only(right:15.0),
               child: Text(widget.time.toString(),
                  style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontFamily: "Gilroy",
                                           fontSize: 10.5.sp,
                                           color: Colors.grey
                                         ),
                      ),
             ):Padding(
               padding:  EdgeInsets.only(left:15.0),
               child: Text(widget.time.toString(),
                  style: TextStyle(
                                           fontWeight: FontWeight.w600,
                                           fontFamily: "Gilroy",
                                           fontSize: 10.5.sp,
                                           color: Colors.grey
                                         ),),
             )
          ],
        ):Container()
      ),
    );
    // Row(
    //   mainAxisAlignment: widget.chat==true?MainAxisAlignment.start:MainAxisAlignment.end,
    //   children: [
    //     Container(
    //       margin: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h,left: 1.h),
    //      width: 24.w,
    //      decoration:widget.chat==false? BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //    topLeft:Radius.circular(10.0),
    //      topRight: Radius.circular(10.0),
    //      bottomLeft: Radius.circular(10.0),
    //      bottomRight: Radius.zero,
    //            ),
    //             color: Color(0xff3641B7),
    //      ):BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //      topLeft: Radius.zero,
    //      topRight: Radius.circular(10.0),
    //      bottomLeft: Radius.circular(10.0),
    //      bottomRight: Radius.circular(10.0),
    //            ),
    //            color: Color(0xff591B4C),
    //      ),
         
    //      child: Padding(
    //      padding:  EdgeInsets.symmetric(vertical:1.0.h,horizontal: 8),
    //        child: Text('hello',
    //         style: TextStyle(
    //                                  fontWeight: FontWeight.w600,
    //                                  fontFamily: "Gilroy",
    //                                  fontSize: 11.5.sp,
    //                                  color: Colors.white
    //                                ),
    //        ),
    //      ),
    //     ),
    //   ],
    // );
  }
}

