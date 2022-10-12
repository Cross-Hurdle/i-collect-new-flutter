// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:icollekt/Exports/Exports.dart';
// import 'package:icollekt/Screens/OtherProfile/otherprofilepage.dart';

// class ProfilePost extends StatelessWidget {
//   const ProfilePost({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildappbar(context),
//       body: 
//        CustomScrollView(
//         physics:  BouncingScrollPhysics(),
//         slivers: 
//           [
//             SliverList(delegate: SliverChildListDelegate(
//               [

//                  explore()
           
//               ]
//             )
//             ),
         
         
         
//         ],
//       ),
//     );
//   }
//     Widget explore(){
//     return  ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
             
//               itemCount:20,
//               itemBuilder: (context, index) {
//                 return post(context);
//               },
//             );
//   }


//       Widget post(context){
//     return GestureDetector(
//       onTap: (){
//         //  print('month');
//       },
//       child: Container(
//           margin: EdgeInsets.symmetric(vertical: 0.sp,horizontal: 1.sp),
//         child: Column(
//           children: [
//             Container(
            
//               // height: 50.h,
//               // color: Colors.yellow,
//               child: Column(
//                 children: [
//                   //SizedBox(height: 10,),
//                 Container(
//                   color: Colors.white,
//               width: double.infinity,
//                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           SizedBox(height: 1.h,),
//                           Row(
//                             children: [
//                               SizedBox(width: 2.5.w,),
//                              CircleAvatar(
//                                radius: 5.5.w,
//                                child: Image.asset( "Assets/Images/pic.png",fit: BoxFit.contain,width: 12.w,),
//                              ),
//                                SizedBox(width: 4.w,),
//                              Column(crossAxisAlignment: CrossAxisAlignment.start,
//                                children: [
//                                  SizedBox(height: 10,),
//                                  GestureDetector(
//                                    onTap: (){
//                                        pushNewScreen(
//           context,
//           screen: Otherprofilepage(),
//           withNavBar: true, // OPTIONAL VALUE. True by default.
//           pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       );
//                                    },
//                                    child: Container(
//                                      height: 40,
//                                      child: Text('joshua_l',
//                                      style: TextStyle(
//                                        fontWeight: FontWeight.w600,
//                                        fontFamily: 'SF Pro Text',
//                                        fontSize: 12.sp
//                                      ),
//                                      )),
//                                  ),
//                                ],
//                              )
//                             ],
//                           ),
//                           SizedBox(height: 1.h,),
//                         ],
//                       ),
//                         Row(
//                             children: [
//                             // Icon(Icons.more_horiz),
//                                 PopupMenuButton(
//                         icon: Icon(Icons.more_horiz,color: Colors.black,),
//                         itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//                           // const PopupMenuItem(child: Text('Images',style: TextStyle(
//                           //   fontFamily: 'Gilroy',
//                           //   fontSize: 17,
//                           //   fontWeight: FontWeight.w600,
//                           //   color: Color(0xff591B4C)),)),
//                            PopupMenuItem(
//                             onTap: (){
     
//                             },
//                            // height: 42,
//                             child: Text('Delete Product',style: TextStyle(
//                             fontFamily: 'Gilroy',
//                             fontSize: 17,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xff591B4C)))),
//                           PopupMenuItem(
//                             onTap: (){
     
//                             },
//                            // height: 42,
//                             child: Text('Selling',style: TextStyle(
//                             fontFamily: 'Gilroy',
//                             fontSize: 17,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xff591B4C)))),

//                         ],
//                       ),
//                               SizedBox(width: 4.w,),
//                             ],
//                           )
//                     ],
//                   ),
//                 ),
               
//                 ],
//               ),
//             ),
//              carousel(),
//              Container(
//                   height: 18.h,
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     // Image.asset( "Assets/Images/Like.png",
//                                     // color: Color(0xff262626),
//                                     // fit: BoxFit.contain,width: 7.w,),
//                                     SizedBox(width: 5,),
//                                      Text('Price \$500',
//                                      style: TextStyle(
//                                      fontWeight: FontWeight.w600,
//                                      fontFamily: 'SF Pro Text',
//                                      fontSize: 11.sp
//                                    ),
//                                      ),
//                                   ],
//                                 ),
                                
//                               ],
//                             ),
//                             // Container(
//                             //  // color: Colors.red,
                             
//                             //   child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                             //     children: [
//                             //       Padding(
//                             //         padding:  EdgeInsets.only(right:12.0.sp),
//                             //         child: Icon(Icons.more_horiz,size: 18.sp,),
//                             //       )
//                             //     // Text('data')
//                             //   ],),
//                             // ),
//                               // Row(
//                               //     children: [
//                               //        Image.asset( "Assets/Images/chat.png",
//                               //       fit: BoxFit.contain,width: 7.w,),
//                               //     ],
//                               //   ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
//                             width: 90.w,
//                             child: Text('The game in Las Vegas was amazing and I want to share some chips. #lasvegas '
//                             '#casinochip #chipcollection #caesarspalace',
//                              style: TextStyle(
//                                      fontWeight: FontWeight.w400,
//                                      fontFamily: 'Gilroy',
//                                      fontSize: 10.sp
//                                    ),
//                             ),
//                           )
//                         ],
//                       ),
//                         Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text('September 19',
//                 style: TextStyle(
//                   color: Color(0x77000000),
//                                      fontWeight: FontWeight.w400,
//                                      fontFamily: 'Gilroy',
//                                      fontSize: 11.sp
//                                    ),
//                 ),
//               )
//             ],
//           )
//                     ],
//                   ),
//                 ),
        
//           ],
//         ),
//       ),
//     );
//   }
//     Widget carousel(){
  
//     return Builder(
//         builder: (context) {
//           final double height = MediaQuery.of(context).size.height;
//           return Stack(
//             alignment: AlignmentDirectional.topEnd,
//             children: 
//               [CarouselSlider(
                
//                 options: CarouselOptions(
                  
//                  // height: height,
//                   viewportFraction: 1.0,
//                   enlargeCenterPage: false,
//                   autoPlay: true,
//                 ),
//                 items:
//                 // images
//                 <String>[
//                   'http://icollekt.jksoftec.com/public/uploads/all/8kfwVEsQD16cotCOWZ1Gz9N8m8GHqmzsOvMMpRHT.jpg',
//                   'http://icollekt.jksoftec.com/public/uploads/all/8kfwVEsQD16cotCOWZ1Gz9N8m8GHqmzsOvMMpRHT.jpg',
//                   'http://icollekt.jksoftec.com/public/uploads/all/8kfwVEsQD16cotCOWZ1Gz9N8m8GHqmzsOvMMpRHT.jpg',
//                   'http://icollekt.jksoftec.com/public/uploads/all/8kfwVEsQD16cotCOWZ1Gz9N8m8GHqmzsOvMMpRHT.jpg',
//                   'http://icollekt.jksoftec.com/public/uploads/all/8kfwVEsQD16cotCOWZ1Gz9N8m8GHqmzsOvMMpRHT.jpg',
//                 // '${oneproductResponse!.product.orgImg}',
//                 // '${oneproductResponse!.product.orgImg}',
//                 // '${oneproductResponse!.product.orgImg}',
//                 // '${oneproductResponse!.product.orgImg}',
//                 ]
//                     .map((item) => Container(
//                           child: Center(
//                               child:  CachedNetworkImage(
//         imageUrl:  item,
//         //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
//         // "${widget.image}",
//                            fit: BoxFit.fill,
//              imageBuilder: (context, imageProvider) => Container(
//     decoration: BoxDecoration(
//       // color: Colors.black12.withOpacity(10),
//       image: DecorationImage(
        
//           image: imageProvider,
//           fit: BoxFit.cover,
//          // colorFilter:
//             //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
//               ),
//     ),
//   ),                 
                            
//         progressIndicatorBuilder: (context, url, downloadProgress) => 
//                 CircularProgressIndicator(value: downloadProgress.progress),
//         errorWidget: (context, url, error) => Icon(Icons.error),
//      ),
//                           //      Image.asset(
//                           //  // '${widget.image}',
//                           //   item,
//                           //   fit: BoxFit.cover,
//                           //   height: height,
//                           // )
//                           ),
//                         ))
//                     .toList(),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 10,right: 10),
//                 decoration: BoxDecoration(
//                   color:Color(0xff591B4C),
//                borderRadius: BorderRadiusDirectional.circular(100)
//                 ),
//                 height: 50,
//                 width: 50,
//                 child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                      Text('Price',
//                       style: TextStyle(
//                         color: Colors.white,
//                                            fontWeight: FontWeight.w400,
//                                            fontFamily: 'Gilroy',
//                                            fontSize: 8.sp
//                                          ),
//                       ),
//                     Center(
//                       child: Text('\$100',
//                       style: TextStyle(
//                         color: Colors.white,
//                                            fontWeight: FontWeight.w400,
//                                            fontFamily: 'Gilroy',
//                                            fontSize: 8.sp
//                                          ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           );
//         },
//       );
//   }
//   buildappbar(context){
//     return AppBar(
//       backgroundColor: kBackground,

//       centerTitle: true,
//       title: Image.asset("Assets/Images/Icollekt.png",
//       height: 11.h,
//       ),
//       actions: [
//         GestureDetector(
//           onTap: (){
//   pushNewScreen(
//           context,
//           screen: Settings(),
//           withNavBar: false, // OPTIONAL VALUE. True by default.
//           pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       );
//           },
//           child: Image.asset("Assets/Images/settings.png",
//              width: 12.w,
//               ),
//         ),
//       ],
//       elevation: 1.3,
//     );
//   }
// }