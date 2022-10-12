import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

import 'MyGroupProfile.dart';

class GroupChat extends ConsumerStatefulWidget {
  const GroupChat({ Key? key }) : super(key: key);

  @override
  _GroupChatState createState() => _GroupChatState();
}

class _GroupChatState extends ConsumerState<GroupChat> {
  TextEditingController _chatcontroller= TextEditingController();
   bool emojiShowing = false;

  _onEmojiSelected(Emoji emoji) async {
    _chatcontroller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _chatcontroller.text.length));
  }

  _onBackspacePressed() {
    _chatcontroller
      ..text = _chatcontroller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _chatcontroller.text.length));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context,ref.watch(viewMygroupprov)),
      backgroundColor: Color(0xffF9F2FF),
      body: Column(
        children: [
        Expanded(
            child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context,index){
                    return Column(
                      children: [
                        SizedBox(height: 20,),
                        GroupChatContainer(chat: true,groupmember: "Jack",),
                        GroupChatContainer(chat: false),
                        GroupChatContainer(chat: true,groupmember: "Chloe",),
                      ],
                    );
                  }),
          ),
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
      
    );
    
  }
  chattext(){
return   Container(
             margin: EdgeInsets.only(bottom: 10.sp),
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
                     SizedBox(width: 3.w,),
                     SvgPicture.asset( "Assets/Images/chatcamera.svg",
                       height: 3.6.h,
                            ),
                       
                  ],
                ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 4.sp,bottom: 10.sp),
                    
                    color: Colors.white,
                    child: TextField(
                      cursorHeight: 23,
                       controller:_chatcontroller,
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
                      Container(
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
                      )
                    ],
                  ),
                  ),
              ],
            ),
          );
          
  }
      AppBar buildappbar(context,ViewMyGroupData mydata){
    return AppBar(
      toolbarHeight: 8.h,
      backgroundColor: kBackground,
    //  flexibleSpace: ,
        leading: Container(
          margin: EdgeInsets.only(left: 10.sp),
          child: GestureDetector(
          onTap: (){
           Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        ),
     // centerTitle: true,
      title: GestureDetector(
        onTap: (){
           pushNewScreen(
          context,
          screen:MyGroupProfile() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
        },
        child: Container(
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
            imageUrl:'${mydata.groupImagedp}',
            
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
                     width: 44.w,
                    child: Text('${mydata.groupname}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Color(0xff1A1A1A),
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                  Container(
                    width: 44.w,
                    child: Text('${mydata.message}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff969696),
                      fontFamily: 'Gilroy',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
         PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Colors.black,),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(child: Text('Images',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff591B4C)),)),
              const PopupMenuItem(child: Text('Search',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff591B4C)))),
              const PopupMenuItem(child: Text('Mute Notifications',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff591B4C)))),
              const PopupMenuItem(child: Text('Report',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff591B4C)))),
              const PopupMenuItem(child: Text('Block',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xff591B4C)))),
            ],
          ),
       
        SizedBox(width: 4.w,)
      ],
      elevation: 1,
    );
    
  }
}



class GroupChatContainer extends ConsumerStatefulWidget {
  final bool? chat;
  final String? groupmember;
  GroupChatContainer({ Key? key,this.chat,this.groupmember }) : super(key: key);

  @override
  _GroupChatContainerState createState() => _GroupChatContainerState();
}

class _GroupChatContainerState extends ConsumerState<GroupChatContainer> {
  @override
  Widget build(BuildContext context) {
    return   Align(
      alignment:widget.chat==false? Alignment.centerRight:Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
      //      decoration:widget.chat==false? BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //  topLeft:Radius.circular(10.0),
      //    topRight: Radius.circular(10.0),
      //    bottomLeft: Radius.circular(10.0),
      //    bottomRight: Radius.zero,
      //          ),
      //           color: Color(0xff3641B7),
      //    ):BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //    topLeft: Radius.zero,
      //    topRight: Radius.circular(10.0),
      //    bottomLeft: Radius.circular(10.0),
      //    bottomRight: Radius.circular(10.0),
      //          ),
      //          color: Color(0xff591B4C),
      //    ),
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius:widget.chat==false? BorderRadius.only(
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
          color:widget.chat==false?  Color(0xff591B4C): Color(0xff3641B7),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            //     widget.chat==true?    Padding(
            //  padding:  EdgeInsets.only(top:4.0,left: 5,right: 6.h),
            //    child: Text(widget.groupmember.toString(),
            //     style: TextStyle(
            //                              fontWeight: FontWeight.w600,
            //                              fontFamily: "Gilroy",
            //                              fontSize: 11.5.sp,
            //                              color: Colors.white
            //                            ),
            //    ),
            //  ):Container(),
            widget.chat==true?   Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Padding(
                padding:  EdgeInsets.only(top:4.0,left: 5,right: 5),
                  child: Text(widget.groupmember.toString(),
                   style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Gilroy",
                                            fontSize: 11.5.sp,
                                            color: Colors.white
                                          ),
                  ),
                ),
                Padding(
                   padding:  EdgeInsets.symmetric(vertical:5.0,horizontal: 12),
                  child: Text('hellosd ',
                   style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Gilroy",
                                            fontSize: 11.5.sp,
                                            color: Colors.white
                                          ),
                  ),
                ),
              ],
            ):
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 30,
                      top: 5,
                      bottom: 10,
                    ),
                    child:Text('hello',
                style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontFamily: "Gilroy",
                                         fontSize: 11.5.sp,
                                         color: Colors.white
                                       ),
                    ),
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
            ],
          ),
        ),
      ),
    );
    //  Row(
    //   mainAxisAlignment: widget.chat==true?MainAxisAlignment.start:MainAxisAlignment.end,
    //   children: [
    //     Container(
    //       margin: EdgeInsets.only(top: 1.h,bottom: 1.h,right: 1.h,left: 1.h),
    //      width: 24.w,
    //      decoration:widget.chat==true?BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //      topLeft: Radius.zero,
    //      topRight: Radius.circular(10.0),
    //      bottomLeft: Radius.circular(10.0),
    //      bottomRight: Radius.circular(10.0),
    //            ),
    //            color: Color(0xff3641B7),
              
    //      ) :BoxDecoration(
    //         borderRadius: BorderRadius.only(
    //    topLeft:Radius.circular(10.0),
    //      topRight: Radius.circular(10.0),
    //      bottomLeft: Radius.circular(10.0),
    //      bottomRight: Radius.zero,
    //            ),
    //         color: Color(0xff591B4C),     
    //      ),
         
    //      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    //        children: [
    //       widget.chat==true?    Padding(
    //          padding:  EdgeInsets.only(top:4.0,left: 5,right: 6.h),
    //            child: Text(widget.groupmember.toString(),
    //             style: TextStyle(
    //                                      fontWeight: FontWeight.w600,
    //                                      fontFamily: "Gilroy",
    //                                      fontSize: 11.5.sp,
    //                                      color: Colors.white
    //                                    ),
    //            ),
    //          ):Container(),
    //         widget.chat==true?   Padding(
    //          padding:  EdgeInsets.symmetric(vertical:1.0.h,horizontal: 12),
    //            child: Text('hello ',
    //             style: TextStyle(
    //                                      fontWeight: FontWeight.w400,
    //                                      fontFamily: "Gilroy",
    //                                      fontSize: 11.5.sp,
    //                                      color: Colors.white
    //                                    ),
    //            ),
    //          ):Padding(
    //          padding:  EdgeInsets.only(top:1.0.h,left: 5.w,right: 3.h,bottom: 1.0.h),
    //            child: Text('hello ',
    //             style: TextStyle(
    //                                      fontWeight: FontWeight.w400,
    //                                      fontFamily: "Gilroy",
    //                                      fontSize: 11.5.sp,
    //                                      color: Colors.white
    //                                    ),
    //            ),
    //          )
    //        ],
    //      ),
    //     ),
    //   ],
    // );
  }
}