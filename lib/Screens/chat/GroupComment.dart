import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/CommentUnlikeModle.dart';
import 'package:icollekt/Model/CommentViewModle.dart';
import 'package:icollekt/Model/CommentlikeModle.dart';
import 'package:icollekt/Services/Provider.dart';

class GroupComment extends ConsumerStatefulWidget {
  const GroupComment({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GroupCommentState();
}

class _GroupCommentState extends ConsumerState<GroupComment> {
 
  bool status=false;
  bool isliked =false;
  int count =0;
  FocusNode focusNode =FocusNode();
   @override
  void initState() {

    super.initState();
        updatecomment();
    focusNode.requestFocus();
  }
  
  TextEditingController _controller = TextEditingController();
  
  bool appbar=false;
 createcomment() async {
    final  createcommentResponse = await 
    GroupAndChatRepository().getcreatecommentResponse(
      postid:ref.read(commentinfo).id!, 
      groupid:ref.read(viewgroupprov).groupid! ,
       comment:_controller.text.toString() );
       print('hiiiiiiiiiii   ${ref.read(commentinfo).id!}');
     if(createcommentResponse.result==false){
       
      _controller.clear();
      updatecomment();
       
     }   else if(createcommentResponse.result==true){
   
     }
     setState(() {
       
     });
   }
   
   CommentViewModle? commentResponse;
   Future updatecomment() async {
       print('hiiiiiiiiiii   ${ref.read(commentinfo).id!}');
   commentResponse = await GroupAndChatRepository().getcommentResponse(postid:ref.read(commentinfo).id!,);
   status=true;
       print('hiiiiiiiiiii   ${ref.read(commentinfo).id!}');
   // print(commentResponse!.userData.length);
     setState(() {
       
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context,),
      backgroundColor: Color(0xffF9F2FF),
      body:  Column(
        children: [
          topinfo(),
       commentlist(),
          SizedBox(height: 15,),
        
        chattext(),
        
        ],
      ),
    
     
    );
    
  }

  commentlist(){
    print(status);
   // print(commentResponse!.userData.length);
      if (!status) {
                 return Expanded(
                   child: Container(
                      //height: 50.h,
                     child: Center(child: CircularProgressIndicator())),
                 );
               }else{
   return 
           commentResponse!.userData.isNotEmpty?    Expanded(
            child: 
                StreamBuilder(
                  stream:  updatecomment().asStream(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      
                      reverse:false,
                      itemCount: commentResponse!.userData.length,
                            itemBuilder: (context,index){
                               if (commentResponse!.userData[index].likeComments.isNotEmpty) {
      count=commentResponse!.userData[index].likeComments[0].likecount;
      commentResponse!.userData[index].likeComments.forEach((element) {
        if (element.userId==preferences.getInt('Userid')&&element.status==1) {
         // print('222222222222222222222222222222');
          isliked=true;
        }else{
          //print('1111111111111111111111111');
          isliked=false;
        }
      });
    }else{
      count=0;
      isliked=false;
    }
                              //print()
                    //         DateTime? convert = DateTime.tryParse( commentResponse!.userData[index].createdAt.toString());
                    // var dateString = DateFormat.jm().format(DateFormat("yy hh:mm:ss").parse('2022-02-14T18:02:15.000Z'));
                    // String date = DateFormat('h:ss a').format(convert!.add(new Duration(hours: 5,minutes: 18)));
                   
                           return Container(
                             margin: EdgeInsets.symmetric(vertical: 4),
                             child: GestureDetector(
                               onLongPress: (){
                    //  setState(() {
                       
                    //  });
                    // appbar=true;
                               },
                               child: CommentContainer(
                                 index: index,
                                 commentid:  commentResponse!.userData[index].id,
                                 status:isliked,
                                 listcount: count,
                     commentcolor: appbar,
                     profilename: commentResponse!.userData[index].user.name,
                     profilepic: commentResponse!.userData[index].user.profilePic,
                     comment: commentResponse!.userData[index].comment,
                     likelist: commentResponse!.userData[index].likeComments,
                     time:commentResponse!.userData[index].createdAt,
                               ))
                           );
                              });
                  }
                )
     
          ):Expanded(
            child: Container(
               
                child: Center(child: Text('No Comments'))),
          );
  }
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
                        
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                      cursorHeight: 23,
                      // controller:_chatcontroller,
          decoration: InputDecoration(
            
            border: InputBorder.none,
            hintText: 'Comment as ${preferences.getString('Name')}',
            hintStyle: TextStyle(
              color: Color(0xffAAAAAA),
             fontFamily: 'Gilroy',
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
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
                           createcomment();
                          
                            // updatecomment();
                           //sendPushMessage();
                         //  getCollectionData(ref.read(onetoonechatdataprov),ref.read(chatdataprov)); 
                          //// if(_controller.text.isNotEmpty){
  
 
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
Widget  topinfo(){
   final comment = ref.watch(commentinfo);
   return Container(
     color: Colors.white,
     child: Container(
       margin: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 10.sp),
       color: Colors.white,
       child: Column(
         children: [
           Row(children: [
              CircleAvatar(
                               radius: 15.sp,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child:
                                 CachedNetworkImage(
                                    imageUrl:'${comment.profile}',
                                    
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
                      SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       // Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                        Text.rich(
  TextSpan(
    children: [
     
      TextSpan(
            text: '${comment.postname}',
           style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))
      ),

           TextSpan(text: '  ${comment.subject}',style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1A1A1A))),
    //  TextSpan(text: ' world!'),
    ],
  ),
),
      SizedBox(height: 1.h,),
     Text('${comment.dateandtime}',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 9.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey)),
                      ],
                    ),
                    //child: Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                  ),
                )
            ],),
           
          
         ],
       ),
     ),
   );
  }
      AppBar buildappbar(context){
    return AppBar(
      backgroundColor: appbar==true?Colors.blue: kBackground,
        leading: Container(
          margin: EdgeInsets.only(left: 10.sp),
          child: appbar==true? GestureDetector(
          onTap: (){
            appbar=false;
            setState(() {
              
            });
           //Navigator.pop(context);
          },
          child: Icon(Icons.close,color: Colors.black,)):GestureDetector(
          onTap: (){
           Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        ),
     // centerTitle: true,
      title:Text('Comments',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color:  appbar==true?Colors.white:Color(0xff1A1A1A))),
    
      elevation: 1,
      actions: [
       appbar==true? IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.black,)):Container()
      ],
    );
    
  }
}
class CommentContainer extends ConsumerStatefulWidget {
  final bool status;
  final int index;
  final bool commentcolor;
 final String profilename;
 final  String profilepic;
  final String  comment;
  final int commentid;
  final List<LikeComment> likelist;
  final int listcount;
  final  DateTime  time;
  CommentContainer({ Key? key,required this.index, required this.commentid, required this.listcount,required this.status, required this.commentcolor,required this.comment,required this.likelist,required this.profilename,required this.profilepic,required this.time }) : super(key: key);

  @override
  _CommentContainerState createState() => _CommentContainerState();
}

class _CommentContainerState extends ConsumerState<CommentContainer> {
   bool isliked = false;
   int count =0;
  String timeAgo(DateTime d) {
 Duration diff = DateTime.now().difference(d);
 if (diff.inDays > 365)
  return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
 if (diff.inDays > 30)
  return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
 if (diff.inDays > 7)
  return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
 if (diff.inDays > 0)
  return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
 if (diff.inHours > 0)
  return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
 if (diff.inMinutes > 0)
  return "${diff.inMinutes} ${diff.inMinutes == 1 ? "min" : "minutes"} ago";
 return "just now";
  }
     CommentLikeModle ?allpostlikeresponse;
 getallLikeresponse()async{
 allpostlikeresponse=   await AuthRepository().getCommentlikeData(commentid:widget.commentid,postid:ref.read(commentinfo).id! ,groupid:ref.read(viewgroupprov).groupid! ,  ); 
 //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());  
 print( 'sdfsdsf${allpostlikeresponse!.likeData[0].status}');
 print( 'asdasdadasd${widget.commentid}');
 print(allpostlikeresponse!.likeData[0].likecount);
 if(mounted){
    setState(() {
    isliked=true;
    // allpostlikeresponse!.likeData.forEach((element) {
    //   if (element.postId==widget.commentid) {
    //     print(ref.read(viewgroupprov).postid!.toInt());
    //     count=element.likecount;
    //   }
    // });
}); 
 }          

}
//LikeDataResponse? 
CommentUnLikeModle? allUnpostlikeresponse;
 getallUnLikeresponse()async{
  // postresponse!.userData.forEach((element) {
  //     ref.read(viewgroupprov).postid=  element.id;
  //   }); 
 allUnpostlikeresponse=  await AuthRepository().getCommentUnlikeData(commentid:widget.commentid,postid:ref.read(commentinfo).id! ,); 
 print(allUnpostlikeresponse);
   print( 'asdasdadasd${widget.commentid}');
if (mounted) {
  setState(() {
   
      
  isliked=false;
    //  allUnpostlikeresponse!.likeData.forEach((element) {
    //    if (element.postId==widget.commentid) {
    //     print(ref.read(viewgroupprov).postid!.toInt());
    //     count=element.likecount;
    //   }
    // });
});   
}          

}
  @override
  Widget build(BuildContext context) {
   try {
        if (widget.likelist.isNotEmpty) {
      count=widget.likelist[0].likecount;
      widget.likelist.forEach((element) {
        if (element.userId==preferences.getInt('Userid')&&element.status==1) {
          isliked=true;
        }else{
          isliked=false;
        }
      });
    //  print('111111111111111111');
    }else{
      count=0;
      isliked=false;
    }
   
   } catch (e) {
     print(e);
   }
    return  Container(
      color: widget.commentcolor==true?Colors.blueAccent[100]: Colors.white,
     child: Container(
       margin: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 10.sp),
       color: widget.commentcolor==true?Colors.blueAccent[100]: Colors.white,
       child: Column(
         children: [
           Row(children: [
              CircleAvatar(
                               radius: 15.sp,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child:
                                 CachedNetworkImage(
                                    imageUrl:'${widget.profilepic}',
                                    
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
                      SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    //color: Colors.red,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       // Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                        Text.rich(
  TextSpan(
    children: [
     
      TextSpan(
            text:'${widget.profilename}',
           style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1A1A1A))
      ),

           TextSpan(text: '  ${widget.comment}',style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff1A1A1A))),
    //  TextSpan(text: ' world!'),
    ],
  ),
),
      SizedBox(height: 1.h,),
     Row(
       children: [
         Text(timeAgo(widget.time),style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey)),
                      SizedBox(width: 1.h,),
     Text('${widget.listcount} Likes',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 9.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey)),
       ],
     ),
               
                      ],
                    ),
                    //child: Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                   Builder(
                     builder: (context) {
                       return Column(
          children: [
            Row(
                                                      children: [
                                                         GestureDetector(
                                                          onTap: (){
                                                        // ontap();
                                                           // print(isliked);
                                                           if(isliked){
                                                             //  ref.read(viewgroupprov).postid=postresponse.userData[index];
                                                           //   ref.read(viewgroupprov).postid=widget.postid;
                                                            getallUnLikeresponse();
                                                           }else{
                                                           //    ref.read(viewgroupprov).postid=widget.postid;
                                                              getallLikeresponse();
                                                           }
                                                          },
                                                          child: Icon(Icons.favorite,color:isliked==true?Colors.red: Colors.grey[500],size: 26,)),
                                                       
                                                       
                                                      ],
                                                    ),
          ],
        );
                     }
                   )
                     
                    ],
                  ),
                  //child: Text('sdkdfjsdfddsjkdfjalkdjasdlkjasjdlkdjklasjdlkadjlkadjaklsdjaklsdjsakdjsalkdklas'),
                )
            ],),
           
          
         ],
       ),
     ),
   );
    }
}

