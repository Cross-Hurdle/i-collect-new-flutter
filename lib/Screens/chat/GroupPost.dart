// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:icollekt/Exports/Exports.dart';
// import 'package:icollekt/Model/GoupPostModle.dart';
// import 'package:icollekt/Model/PostLikeModle.dart';
// import 'package:icollekt/Model/PostUnlikeModle.dart';
// import 'package:icollekt/Services/Provider.dart';
// import 'package:intl/intl.dart';

// class GrupPost extends ConsumerStatefulWidget {
//   const GrupPost({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _GrupPostState();
// }

// class _GrupPostState extends ConsumerState<GrupPost> {
//    @override
//    void initState() { 
//       getpostedresponse();
//        // getallLikeresponse(ref.read(viewgroupprov));
//        //  final data= ref.read(viewgroupprov);
//       // ListView.builder(itemBuilder: (context,index){
//       //   allpostlikeresponse!.likeData[index].postId=data.postid!;
//       //   return Container();
//       // });
//      super.initState();
     
//    }

//     bool islike=false;
//     bool status=false;
//     LikeDataResponse ?allpostlikeresponse;
// Future getallLikeresponse(ViewGroupData allgroupview)async{
//  // print('object${allgroupview.postid!.toInt()}');
//  allpostlikeresponse=   await GroupAndChatRepository().getPostlikeData(postid:allgroupview.postid!.toInt());  
//  print( 'sdfsdsf${allpostlikeresponse!.likeData.length}');
//  if(mounted){
//     setState(() {
  
// }); 
//  }          

// }

// //LikeDataResponse? 
//  UnLikeDataResponse? allUnpostlikeresponse;
// Future getallUnLikeresponse(ViewGroupData allgroupview)async{
  
//  allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:allgroupview.postid!.toInt());  
//  print(allUnpostlikeresponse);
//  //  print( 'asdasdadasd${allpostlikeresponse!.likeData[0].likeCount}');
//   setState(() {
  
// });           

// }
//  //getpostedresponse(ref.read(viewgroupprov));
// GroupPostedDataResponse? postresponse;
//  Future getpostedresponse()async{
//     print(ref.read(viewgroupprov).groupid!);
//  postresponse = await GroupAndChatRepository().getAllGroupPostedData(id:ref.read(viewgroupprov).groupid! );
 
//  //postresponse!.userData.reversed;
//   status=true;
 
//  // print( postresponse!.userData[0].likes.length);
//  if(mounted){
//     setState(() {
    
//   });
//  }
//   }
//  getalldeletepostresponse(ViewGroupData allgroupview)async{
  
//  final allpostresponse=   await GroupAndChatRepository().getAllDeletepostData(id:allgroupview.postid!.toInt());  
//  print( allpostresponse.status);
//   // status=true;
//   setState(() {
  
// });           

// }

// // Future getalldeletepostresponse()async{
  
// //  final allpostresponse=   await GroupAndChatRepository().getAllDeletepostData(id:postresponse!.userData[0].id);  
// //  print( allpostresponse.status);
// //   // status=true;
// //   setState(() {
  
// // });           

// // }
// // liked(){
// //   for (var i = 0; i < allpostlikeresponse!.likeData.length; i++) {
// //      if (allpostlikeresponse!.likeData[i].status==1) {
   
// //     getallLikeresponse(ref.read(viewgroupprov));
// //   } else{
// // //  islike=false;
// //   getallUnLikeresponse(ref.read(viewgroupprov));
// //   }
// //   setState(() {
    
// //   });
// //   }
 
// // }
//   @override
//   Widget build(BuildContext context) {
//     return  explore();
//     //  Scaffold(
//     //   appBar:  buildappbar(context,ref.read(viewgroupprov)),
//     //  body:   explore()
//     // //   RefreshIndicator(
//     // //    onRefresh: ()async { 
//     // //      getpostedresponse();
//     // //     },
//     // //    child: CustomScrollView(
//     // //       physics:  BouncingScrollPhysics(),
//     // //       slivers: 
//     // //         [
//     // //           SliverList(delegate: SliverChildListDelegate(
//     // //             [
               
//     // //                explore()
             
//     // //             ]
//     // //           )
//     // //           ), 
//     // //       ],
//     // //     ),
//     // //  ),
//     //  //explore(),
//     // );
//   }
//     Widget explore(){
//     final  allgroupview=ref.watch(viewgroupprov);
//    if (!status) {
//                  return Container(
//                     height: 50.h,
//                    child: Center(child: CircularProgressIndicator()));
//                }else
//     return
//     postresponse!.userData.length!=0? 

//             // getpostedresponse();
//           ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                      // reverse: true,
//                       itemCount:postresponse!.userData.length,
//                       itemBuilder: (context, index) {
//                      //    allgroupview.postid=  postresponse!.userData[index].id;
//                          //getpostedresponse(ref.read(viewgroupprov));
//       //  getallLikeresponse(ref.read(viewgroupprov));
                      
//                            DateTime? convert = DateTime.tryParse(postresponse!.userData[index].createdAt.toString());
//             //var dateString = DateFormat.jm().format(DateFormat("yy hh:mm:ss").parse('2022-02-14T18:02:15.000Z'));
//             String date = DateFormat('EEE, d/M/y').format(convert!);
//                         return  GestureDetector(
//               onTap: (){
//                 //  print('month');
//               },
//               child: Container(
//                   margin: EdgeInsets.symmetric(vertical: 2.sp,horizontal: 1.sp),
//                 child: Builder(
//                   builder: (context) {
                    
//                      // getpostedresponse(ref.read(viewgroupprov));
//                     return Column(
//                       children: [
//                       DeletePost(
                       
//                         name:postresponse!.userData[index].user.name ,
//                         profileimg:postresponse!.userData[index].user.profilePic ,
//                         postid:postresponse!.userData[index].id ,
//                         otheruserid:postresponse!.userData[index].fromUserId ,),
//                         Container(
//                            child: CachedNetworkImage(
//                         imageUrl:'${postresponse!.userData[index].photos}',
                        
//                       ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
//                         width: double.infinity,
//                                         height: 35.5.h,
//                                            fit: BoxFit.cover,
                                           
//                              imageBuilder: (context, imageProvider) =>Container(
//                               width: double.infinity,
//                       decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: imageProvider,
//                          fit: BoxFit.cover,
                          
//                          // colorFilter:
//                             //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
//                               ),
//                       ),
//                     ),
                                            
//                         progressIndicatorBuilder: (context, url, downloadProgress) => 
//                                 CircularProgressIndicator(value: downloadProgress.progress),
//                         errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
//                        ),
//                           // child:  Image.asset( "Assets/Images/chip 10.jpeg",
                                                
//                           //                       fit: BoxFit.contain,width: double.infinity),
//                         ),
//                          Container(
//                               // height: 18.h,
//                               color: Colors.white,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Column(
//                                           children: [
                                           
//                                          Builder(
//                                            builder: (context) {
//                                              int ?count;
//                                              bool islike =false;
//                                             if(allpostlikeresponse!=null){
//                                                 allpostlikeresponse?.likeData.forEach((element) {
//       if (element.postId==ref.read(viewgroupprov).postid!.toInt()) {
//                  count=element.likeCount;
//                  islike=element.status==0?false:true;
//             }else{
//              count=0;
//               }
//                          });
//                                             } else{
//                                               count=0;
//                                               islike=false; 
//                                             }
//                                              return LIke(
//                                                likes: postresponse!.userData[index].likes,
//                                                index: index,
//                                                count:count! ,islike: islike,
//                                                postid: postresponse!.userData[index].id,
//                                               );
//                                            }
//                                          )
//                                           ],
//                                         ),
//                                         // Container(
//                                         //  // color: Colors.red,
                                         
//                                         //   child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                                         //     children: [
//                                         //       Padding(
//                                         //         padding:  EdgeInsets.only(right:12.0.sp),
//                                         //         child: Icon(Icons.more_horiz,size: 18.sp,),
//                                         //       )
//                                         //     // Text('data')
//                                         //   ],),
//                                         // ),
//                                           // Row(
//                                           //     children: [
//                                           //        Image.asset( "Assets/Images/chat.png",
//                                           //       fit: BoxFit.contain,width: 7.w,),
//                                           //     ],
//                                           //   ),
//                                       ],
//                                     ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Container(
//                                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
//                                         width: 90.w,
//                                         child: Text('${postresponse!.userData[index].message}',
//                                          style: TextStyle(
//                                                  fontWeight: FontWeight.w400,
//                                                  fontFamily: 'Gilroy',
//                                                  fontSize: 10.sp
//                                                ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                     Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text('$date',
//                             style: TextStyle(
//                               color: Color(0x77000000),
//                                                  fontWeight: FontWeight.w400,
//                                                  fontFamily: 'Gilroy',
//                                                  fontSize: 11.sp
//                                                ),
//                             ),
//                           )
//                         ],
//                       )
//                                 ],
//                               ),
//                             ),
                    
//                       ],
//                     );
//                   }
//                 ),
//               ),
//             );
//                       },
//                     )
         
//       :Container(
//               height: 50.h,
//               child: Center(child: Text('No Post')));
//   }
//    AppBar buildappbar(context,ViewGroupData viewdata){
//     return AppBar(
//       toolbarHeight: 8.h,
//       backgroundColor: kBackground,
//     //  flexibleSpace: ,
//         leading: Container(
//           margin: EdgeInsets.only(left: 10.sp),
//           child: GestureDetector(
//           onTap: (){
//            Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
//         ),
//      // centerTitle: true,
//       title: GestureDetector(
//         onTap: (){
//       //      pushNewScreen(
//       //     context,
//       //     screen:MyGroupProfile() ,
//       //     withNavBar: false, // OPTIONAL VALUE. True by default.
//       //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       // );
//         },
//         child: Container(
//           child: Row(
//             children: [
//               Column(
//                 children: [
//          CircleAvatar(
//                          radius: 16.sp,
//                         backgroundColor: Colors.white,
//                         child: ClipOval(
//                           child:
//                            CachedNetworkImage(
//             imageUrl:'${viewdata.groupimage}',
            
//           ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
//              width: 9.5.h,
//                             height: 9.5.h,
//                                fit: BoxFit.cover,
                               
//                  imageBuilder: (context, imageProvider) =>CircleAvatar(
//                         radius: 33.sp,
        
//                         child:  Container(
//           decoration: BoxDecoration(
//           image: DecorationImage(
//               image: imageProvider,
//               fit: BoxFit.cover,
//              // colorFilter:
//                 //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
//                   ),
//           ),
//         ),                 
//                         ),
                                
//             progressIndicatorBuilder: (context, url, downloadProgress) => 
//                     CircularProgressIndicator(value: downloadProgress.progress),
//             errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
//            ),
      
//                         ),
//                       ),
//                 ],
//               ),
//               SizedBox(width: 5.w,),
//               Container(
//                  width: 44.w,
//                 child: Text('${viewdata.groupname}',
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontSize: 13.sp,
//                   color: Color(0xff1A1A1A),
//                   fontFamily: 'Gilroy',
//                   fontWeight: FontWeight.w600
//                 ),),
//               ),
//             ],
//           ),
//         ),
//       ),
      
//       elevation: 1,
//     );
    
//   }
 
// }
// class LIke extends ConsumerStatefulWidget {
//   final int count;
//  final bool islike;
// final int postid;
// final int index;
// final List<Likedata> likes;

//   const LIke({Key? key,required this.count,this.islike =false,required this.postid,required this.index,required this.likes}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _LIkeState();
// }

// class _LIkeState extends ConsumerState<LIke> {
//   @override
//   void initState() { 
//     super.initState();
//      ontaplike();
//    getallresponse();
//   }
//      bool isliked =false ;
//   ontaplike(){
//        if (widget.likes.isNotEmpty) {
//       count=widget.likes[0].likeCount;
//       widget.likes.forEach((element) {
//         if (element.userId==preferences.getInt('Userid')&&element.status==1) {
//           isliked=true;
//         }else{
//           isliked=false;
//         }
//       });
//     }else{
//       count=0;
//       isliked=false;
//     }
//     setState(() {
      
//     });
//   }
//   GroupPostedDataResponse? postresponse;
//  getpostedresponse()async{
//   //  print(allgroupview.groupid!);
//  postresponse = await GroupAndChatRepository().getAllGroupPostedData(id:ref.read(viewgroupprov).groupid! );
//   //status=true;
 
//  // print( postresponse!);
//  if(mounted){
//     setState(() {
    
//   });
//  }
//   }
//    int? postid;

//    int count=0;
//     LikeDataResponse ?allpostlikeresponse;
// Future getallLikeresponse()async{
//  allpostlikeresponse=   await GroupAndChatRepository().getPostlikeData(postid:ref.read(viewgroupprov).postid!.toInt());  
//  //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());  
//  print( 'sdfsdsf${allpostlikeresponse!.likeData.length}');
//  if(mounted){
//     setState(() {
//     isliked=true;
//     allpostlikeresponse!.likeData.forEach((element) {
//       if (element.postId==widget.postid) {
//         print(ref.read(viewgroupprov).postid!.toInt());
//         count=element.likeCount;
//       }
//     });
// }); 
//  }          

// }
// //LikeDataResponse? 
//  UnLikeDataResponse? allUnpostlikeresponse;
// Future getallUnLikeresponse()async{
//   // postresponse!.userData.forEach((element) {
//   //     ref.read(viewgroupprov).postid=  element.id;
//   //   }); 
//  allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!);  
//  print(allUnpostlikeresponse);
//  //  print( 'asdasdadasd${allpostlikeresponse!.likeData[0].likeCount}');
// if (mounted) {
//   setState(() {
   
      
//   isliked=false;
//      allUnpostlikeresponse!.likeData.forEach((element) {
//       if (element.postId==widget.postid) {
//         count=element.likeCount;
//       }
//     });
// });   
// }          

// }
// Future getallresponse()async{
  
//  allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!);  
//  print(allUnpostlikeresponse);
//  //  print( 'asdasdadasd${allpostlikeresponse!.likeData[0].likeCount}');
//   setState(() {
//   // postresponse!.userData.forEach((element) {
//   //     ref.read(viewgroupprov).postid=  element.id;
//   //   });
//     allUnpostlikeresponse!.likeData.forEach((element) {
//       if (element.postId==widget.postid) {
//         count=element.likeCount;
//       }
//     });
// });           

// }
// ontap(){
//     ref.read(viewgroupprov).postid=widget.postid;
// }
//   @override
//   Widget build(BuildContext context) {
//     return                          Builder(
//       builder: (context) {
//    // ontap();

//         return Row(
//                                               children: [
//                                                 GestureDetector(
//                                                   onTap: (){
//                                                  ontap();
//                                                     print(isliked);
//                                                    if(isliked){
//                                                      //  ref.read(viewgroupprov).postid=postresponse.userData[index];
//                                                       ref.read(viewgroupprov).postid=widget.postid;
//                                                      getallUnLikeresponse();
//                                                    }else{
//                                                        ref.read(viewgroupprov).postid=widget.postid;
//                                                       getallLikeresponse();
//                                                    }
//                                                   },
//                                                   child: Icon(Icons.favorite,color:isliked==true?Colors.red: Colors.grey[500],size: 26,)),
                                               
//                                                 SizedBox(width: 5,),
//                                                  Text('$count',
//                                                  style: TextStyle(
//                                                  fontWeight: FontWeight.w600,
//                                                  fontFamily: 'SF Pro Text',
//                                                  fontSize: 11.sp
//                                                ),
//                                                  ),
//                                               ],
//                                             );
//       }
//     );
                                        
//   }
// }
// class DeletePost extends ConsumerStatefulWidget {
//   final int otheruserid;
//   final String profileimg;
//   final String name;
//   final int postid;

//   DeletePost({Key? key,required this.name,required this.otheruserid,required this.postid,required this.profileimg}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _DeletePostState();
// }

// class _DeletePostState extends ConsumerState<DeletePost> {
//    bool status=false;
//   GroupPostedDataResponse? postresponse;
//   // @override
//   // void initState() { 
//   //    getpostedresponse();
//   //    print(widget.postid);
//   //   super.initState();
    
//   // }
//  Future getpostedresponse()async{
//   //  print(allgroupview.groupid!);
//  postresponse = await GroupAndChatRepository().getAllGroupPostedData(id:ref.read(viewgroupprov).groupid! );
 
//  //postresponse!.userData.reversed;
//   status=true;
 
//  // print( postresponse!.userData[0].likes.length);
//  if(mounted){
//     setState(() {
    
//   });
//  }
//   }
//  getalldeletepostresponse(ViewGroupData allgroupview)async{
  
//  final allpostresponse=   await GroupAndChatRepository().getAllDeletepostData(id:widget.postid);  
//  print( allpostresponse.status);
//   // status=true;
//   if (allpostresponse.status=="Your Post Will Be Deleted") {
//    getpostedresponse();
//   } else {
//     print('object111');
//   }
//   setState(() {
  
// });           

// }


//   @override
//   Widget build(BuildContext context) {
//     return   Container(
                        
//                           // height: 50.h,
//                           // color: Colors.yellow,
//                           child: Column(
//                             children: [
//                               //SizedBox(height: 10,),
//                             Container(
//                               color: Colors.white,
//                           width: double.infinity,
//                               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       SizedBox(height: 1.h,),
//                                       Row(
//                                         children: [
//                                           SizedBox(width: 2.5.w,),
//                                          CircleAvatar(
//                                      radius: 16.sp,
//                                     backgroundColor: Colors.white,
//                                     child: ClipOval(
//                                       child:
//                                        CachedNetworkImage(
//                         imageUrl:'${widget.profileimg}',
                        
//                       ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
//                          width: 9.5.h,
//                                         height: 9.5.h,
//                                            fit: BoxFit.cover,
                                           
//                              imageBuilder: (context, imageProvider) =>CircleAvatar(
//                                     radius: 33.sp,
                    
//                                     child:  Container(
//                       decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: imageProvider,
//                           fit: BoxFit.cover,
//                          // colorFilter:
//                             //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
//                               ),
//                       ),
//                     ),                 
//                                     ),
                                            
//                         progressIndicatorBuilder: (context, url, downloadProgress) => 
//                                 Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
//                         errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
//                        ),
              
//                                     ),
//                                   ),
//                                            SizedBox(width: 4.w,),
//                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
//                                            children: [
//                                              SizedBox(height: 10,),
//                                              GestureDetector(
//                                                onTap: (){
//                                                   //  getallLikeresponse(ref.read(viewgroupprov));
//                                                },
//                                                child: Container(
//                                                  height: 40,
//                                                  child: Text('${widget.name}',
//                                                  style: TextStyle(
//                                                    fontWeight: FontWeight.w600,
//                                                    fontFamily: 'SF Pro Text',
//                                                    fontSize: 12.sp
//                                                  ),
//                                                  )),
//                                              ),
//                                            ],
//                                          )
//                                         ],
//                                       ),
//                                       SizedBox(height: 1.h,),
//                                     ],
//                                   ),
//                                     Row(
//                                         children: [
//                                widget.otheruserid== preferences.getInt('Userid')?           PopupMenuButton(
//                         icon: Icon(Icons.more_horiz,color: Colors.black,),
//                         itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//                           // const PopupMenuItem(child: Text('Images',style: TextStyle(
//                           //   fontFamily: 'Gilroy',
//                           //   fontSize: 17,
//                           //   fontWeight: FontWeight.w600,
//                           //   color: Color(0xff591B4C)),)),
//                           PopupMenuItem(
//                             onTap: (){
                             
//       //                  for (var i = 0; i < postresponse!.userData.length; i++) {
//       // allgroupview.postid=  postresponse!.userData[i].id;
//       //    print( postresponse!.userData[i].id);
//       //       }
//                        // allgroupview.postid=  postresponse!.userData[index].id;
//                       //  print( allgroupview.postid);
//                              getalldeletepostresponse(ref.watch(viewgroupprov));
//                               getpostedresponse();
//                             },
//                            // height: 42,
//                             child: Text('Delete Post',style: TextStyle(
//                             fontFamily: 'Gilroy',
//                             fontSize: 17,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xff591B4C)))),

//                         ],
//                       ):Container()
//                     //                      IconButton(onPressed: (){
                                                               
               
//                     // SizedBox(width: 4.w,);
//                     //                      }, icon: Icon(Icons.more_horiz)),
//                     //                       SizedBox(width: 4.w,),
//                                         ],
//                                       )
//                                 ],
//                               ),
//                             ),
                           
//                             ],
//                           ),
//                         );
//   }
// }