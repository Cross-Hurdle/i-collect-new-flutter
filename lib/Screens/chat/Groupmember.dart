// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:icollekt/Exports/Exports.dart';

// class GroupMember extends ConsumerStatefulWidget {
//   const GroupMember({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _GroupMemberState();
// }

// class _GroupMemberState extends ConsumerState<GroupMember> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //height: 100,
//       child: ListView.builder(
//         itemCount: 10,
//         itemBuilder: (context,index){
//         return Container(
//           child: Row(
//                    children: [
//                       SizedBox(width: 3.w,),
//                       Stack(
//                         alignment: AlignmentDirectional.center,
//                         children: 
//                                           [CircleAvatar(
//                          radius: 26,
//                         backgroundColor: Colors.white,
//                         child: ClipOval(
//                           child:
//                            CachedNetworkImage(
//                               imageUrl:'',
//                               //'${widget.image}',
                              
//                             ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
//                                width: 9.5.h,
//                             height: 9.5.h,
//                                fit: BoxFit.cover,
                               
//                                    imageBuilder: (context, imageProvider) =>CircleAvatar(
//                         radius: 33.sp,
                        
//                         child:  Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: imageProvider,
//                                 fit: BoxFit.cover,
//                                // colorFilter:
//                                   //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
//                                     ),
//                           ),
//                         ),                 
//                         ),
                                
//                               progressIndicatorBuilder: (context, url, downloadProgress) => 
//                                       CircularProgressIndicator(value: downloadProgress.progress),
//                               errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
//                            ),
                      
//                         ),
//                                           ),
//             //               Builder(
//             //   builder: (context) {
                
//             //     if (isSelected){
                  
//             //     //  provider.selected.add(widget.name);
//             //     //  print( provider.selected);
//             //       // provider.selected.add(isSelected);
//             //       return  
//             //       CircleAvatar(
//             //         radius: 26, 
//             //          backgroundColor: Color(0xff591B4C).withOpacity(0.4),
//             //         child: Container(
//             //           // height: double.infinity,
//             //           // width:30,
//             //          // color: Colors.black.withOpacity(0.7),
//             //           alignment: Alignment.center,
//             //           child: SvgPicture.asset( "Assets/Images/tick.svg",height: 16,)
//             //         ),
//             //       );
//             //       }
//             //     else{
//             //      // provider.selected.remove(widget.name);
//             //      // print( provider.selected);
//             //      // provider.selected.remove(isSelected);
//             //       return Container();
//             //     }
                  
//             //   },
//             // ),
                          
                              
//                                         ],
//                       ),
//                      SizedBox(width: 3.w,),
//                      Container(
//                        width: 50.w,
//                        child: Text('widget.name',
//                         overflow: TextOverflow.ellipsis,
//                          style: TextStyle(
//             color: Color(0xff343339),
//             fontWeight: FontWeight.w700,
//             fontFamily: "Gilroy",
//             fontSize: 13.sp
//                          ),
//                          ),
//                      ),
//                        SizedBox(height: 1.h,),
         
//                    ],
//                  ),
//         );
//       }),
//     );
//   }
// }










// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:icollekt/Exports/Exports.dart';
// // import 'package:icollekt/Screens/chat/EditMessage.dart';
// // import 'package:icollekt/Screens/chat/EditSubject.dart';
// // import 'package:icollekt/Services/Provider.dart';

// // import 'Groupmember.dart';

// // class AboutGroup extends ConsumerStatefulWidget {
// //   const AboutGroup({Key? key}) : super(key: key);

// //   @override
// //   ConsumerState<ConsumerStatefulWidget> createState() => _AboutGroupState();
// // }

// // class _AboutGroupState extends ConsumerState<AboutGroup> {
// //   @override
// //   void initState() {
// //    getGroupprofilepic(ref.read(viewgroupprov));
// //     super.initState();
// //   }
// //  var subject='' ;
// //    var message='' ;
// //  var pic='';
// //  var groupname='';
// //  var id=0;
// //  var count=0;
// //     getGroupprofilepic(ViewGroupData viewdata)async{  
// //   final viewgroupResponse = await GroupAndChatRepository().getViewGroupData(
// //     id:viewdata.groupid!
// //       );
// //   // print('Idddddddd${ viewdata.groupid}');
// //   print(viewgroupResponse.data.groupBanner);
// //     try {
// //       pic=viewgroupResponse.data.groupImage;
// //       groupname=viewgroupResponse.data.groupBanner;
// //        subject=viewgroupResponse.data.subject;
// //        message= viewgroupResponse.data.message;
// //        id=viewgroupResponse.data.id;
// //        count=viewgroupResponse.usercount;
// //     } catch (e) {
// //       print(e);
// //     } 
// //     if (mounted) {
// //        setState(() {
     
// //    });
// //     }
  
// // }
// //   @override
// //   Widget build(BuildContext context) {
// //    final groupdata= ref.watch(viewgroupprov);
// //     return Scaffold(
// //       appBar: buildappbar(context) ,
// //       body: CustomScrollView(
        
// //         physics:  BouncingScrollPhysics(),
// //         slivers: 
// //           [
// //             SliverList(delegate: SliverChildListDelegate(
// //               [
// //               Builder(
// //       builder: (context) {
// //         getGroupprofilepic(ref.read(viewgroupprov));
// //         return Column(
// //           children: [
// //              SizedBox(height: 5.h,),
// //            Container(
// //              margin: EdgeInsets.symmetric(horizontal: 4.w),
// //              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                children: [
// //                  Container(
// //                  //  width: 200,
// //                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
// //                      children: [
// //                        Text('Subject',
// //                        style: TextStyle(
// //                          fontSize: 12.sp,
// //                          fontWeight: FontWeight.w600,
// //                          color: Color(0xff591B4C)
// //                        ),
// //                        ),
// //                         SizedBox(height: 1.h,),
// //                        Container(
// //                          width: 70.w,
// //                          child: Text('$subject',
// //                           overflow: TextOverflow.ellipsis,
// //                          style: TextStyle(
// //                            fontSize: 12.sp,
// //                            fontWeight: FontWeight.w400,
// //                            color: Colors.black
// //                          ),
// //                          ),
// //                        )
// //                      ],
// //                    ),
// //                  ),
// //                   GestureDetector(
// //                     onTap: (){
// //                         groupdata.groupname=subject; 
// //                       pushNewScreen(
// //               context,
// //               screen: EditSubject() ,
// //               withNavBar: false, // OPTIONAL VALUE. True by default.
// //               pageTransitionAnimation: PageTransitionAnimation.cupertino,
// //           );
// //                     },
// //                     child: Text('Edit',
// //                          style: TextStyle(
// //                            fontSize: 12.sp,
// //                            fontWeight: FontWeight.w400,
// //                            color: Color(0xff591B4C)
// //                          ),
// //                          ),
// //                   ),
// //                   //  Text('Edit',
// //                   //      style: TextStyle(
// //                   //        fontSize: 12.sp,
// //                   //        fontWeight: FontWeight.w400,
// //                   //        color: Color(0xff591B4C)
// //                   //      ),
// //                   //      ),
// //                ],
// //              ),
// //            ),
// //              SizedBox(height: 2.5.h,),
// //           Container(
// //              margin: EdgeInsets.symmetric(horizontal: 4.w),
// //              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                children: [
// //                  Container(
// //                  //  width: 200,
// //                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
// //                      children: [
// //                        Text('Message',
// //                        style: TextStyle(
// //                          fontSize: 12.sp,
// //                          fontWeight: FontWeight.w600,
// //                          color: Color(0xff591B4C)
// //                        ),
// //                        ),
// //                         SizedBox(height: 1.h,),
// //                        Container(
// //                          width: 70.w,
// //                          child: Text('$message',
// //                           overflow: TextOverflow.ellipsis,
// //                          style: TextStyle(
// //                            fontSize: 12.sp,
// //                            fontWeight: FontWeight.w400,
// //                            color: Colors.black
// //                          ),
// //                          ),
// //                        )
// //                      ],
// //                    ),
// //                  ),
              
// //                   GestureDetector(
// //                     onTap: (){
// //                         groupdata.groupmessage=message; 
// //                       pushNewScreen(
// //               context,
// //               screen: EditMessage() ,
// //               withNavBar: false, // OPTIONAL VALUE. True by default.
// //               pageTransitionAnimation: PageTransitionAnimation.cupertino,
// //           );
// //                     },
// //                     child: Text('Edit',
// //                          style: TextStyle(
// //                            fontSize: 12.sp,
// //                            fontWeight: FontWeight.w400,
// //                            color: Color(0xff591B4C)
// //                          ),
// //                          ),
// //                   ),
// //                   //  Text('Edit',
// //                   //      style: TextStyle(
// //                   //        fontSize: 12.sp,
// //                   //        fontWeight: FontWeight.w400,
// //                   //        color: Color(0xff591B4C)
// //                   //      ),
// //                   //      ),
// //                ],
// //              ),
// //            ),
// //              SizedBox(height: 2.5.h,),
// //            Container(
// //              margin: EdgeInsets.symmetric(horizontal: 4.w),
// //              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                children: [
// //                  Container(
// //                  //  width: 200,
// //                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
// //                      children: [
// //                        Text('Members',
// //                        style: TextStyle(
// //                          fontSize: 12.sp,
// //                          fontWeight: FontWeight.w600,
// //                          color: Color(0xff591B4C)
// //                        ),
// //                        ),
// //                         SizedBox(height: 1.h,),
// //                     groupdata.count==null? Text('0',
// //                        style: TextStyle(
// //                          fontSize: 12.sp,
// //                          fontWeight: FontWeight.w400,
// //                          color: Colors.black
// //                        ),
// //                        ):  Text('$count',
// //                        style: TextStyle(
// //                          fontSize: 12.sp,
// //                          fontWeight: FontWeight.w400,
// //                          color: Colors.black
// //                        ),
// //                        )
// //                      ],
// //                    ),
// //                  ),
// //                   //  Text('Edit',
// //                   //      style: TextStyle(
// //                   //        fontSize: 12.sp,
// //                   //        fontWeight: FontWeight.w400,
// //                   //        color: Color(0xff591B4C)
// //                   //      ),
// //                   //      ),
// //                ],
// //              ),
// //            ),
// //             SizedBox(height: 3.h,),
// //             Row(
// //               children: [

// //               ],
// //             ),
// //             //GroupMember()
// //           ],
// //         );
// //       }
// //       ),
// //      // GroupMember()
// //               ]
// //             )
// //             ), 
// //         ],
// //       ),
      
// //     );
// //   }
// //   AppBar buildappbar(context){
// //     return AppBar(
// //       backgroundColor: kBackground,
// //         leading: GestureDetector(
// //         onTap: (){
// //          Navigator.pop(context);
// //         },
// //         child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
// //       centerTitle: true,
// //       title: Text('About',style: TextStyle(
// //         color: Color(0xff1A1A1A),
// //         fontFamily: 'Gilroy',
// //         fontWeight: FontWeight.w700
// //       ),),
// //       actions: [
        
// //       ],
// //       elevation: 1,
// //     );
// //   }
// // }