import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Home/HomePage/Data/Model/HomePage_Modle.dart';
import 'package:icollekt/Model/ProductlikeModle.dart';
import 'package:icollekt/Model/producatunlikeModle.dart';




// ignore: must_be_immutable
class Toppicks extends ConsumerStatefulWidget {
  String?image;
  String ? price;
  String? title;
  String ? hastags;
  String? description;
  List? productlist;
  bool? status;
  List<LikeProduct>? likelist;
  int? likecount;
  var producttype;
  var id;
  Toppicks({
    Key? key,
    this.price,
    this.likecount,
    this.likelist,
    this.status,
    this.title,
    this.image,
    this.hastags,
    this.description,
    this.productlist,
    this.producttype,
    this.id
  }) : super(key: key);

  @override
  ConsumerState<Toppicks> createState() => _ToppicksState();
}

class _ToppicksState extends ConsumerState<Toppicks> {
 bool  isliked  =false;
 int  count=0;
 @override
 void initState() { 
   super.initState();
     print('image:  ${widget.id}');
 }
    ProductlikeModle ?allproductlikeresponse;
 getallLikeresponse()async{
allproductlikeresponse=   await AuthRepository().getproductlikeData(productid: widget.id);
 //allUnpostlikeresponse=   await GroupAndChatRepository().getPostUnlikeData(postid:ref.read(viewgroupprov).postid!.toInt());  
//  print( 'sdfsdsf${allpostlikeresponse!.likeData[0].status}');
//  print( 'asdasdadasd${widget.commentid}');
//  print(allpostlikeresponse!.likeData[0].likecount);
 if(mounted){
    setState(() {
      print('object');
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
ProductUnlikeModle? allUnproductlikeresponse;
 getallUnLikeresponse()async{
  // postresponse!.userData.forEach((element) {
  //     ref.read(viewgroupprov).postid=  element.id;
  //   }); 
 allUnproductlikeresponse=  await AuthRepository().getproductUnlikeData(productid:widget.id);
 print(allUnproductlikeresponse);
  // print( 'asdasdadasd${widget.commentid}');
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
        if (widget.likelist!.isNotEmpty) {
      count=widget.likelist![0].likes;
      widget.likelist!.forEach((element) {
        if (element.userId==preferences.getInt('Userid')&&element.status==1) {
          isliked=true;
           //  print('111100${      element.status}');
        }else{
           // print('1111${      element.status}');
          isliked=false;
        }
      });
      print('object1');
    }else{
      count=0;
      isliked=false;
       print('object2');
    }
   
   } catch (e) {
     print(e);
   }
   // var country;
    return InkWell(
      onTap: (){
         print('image:  ${widget.id}');
       Navigator.push(context, MaterialPageRoute(builder: (context) {
         
         return ProductCards(
       likecount: widget.likecount,
         title: widget.title,
            price: widget.price,
           image: widget.image,
           description: widget.description,
           hastag: widget.hastags,
           productlist: widget.productlist,
           producttype:widget.producttype,
           id:widget.id
       );
       }));
      //   pushNewScreen(
      //     context,
      //     screen: ProductCards(),
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
    
      },
      child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Colors.white
              ),
              margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
              child: Stack(
                   alignment: AlignmentDirectional.centerEnd,
                  children: 
                    [ Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisSize: MainAxisSize.min,
                      // verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        // Container(
                        //   width: double.infinity,
                        //   child: Image.asset("${widget.image}",fit: BoxFit.fill,
                        //   //  height: 215.0,
                        //     ),
                        // ),
        //               Container(
        //                 height: 26.h,
        //                  decoration: BoxDecoration(
        //                  //  borderRadius: BorderRadius.circular(20),
                          
        //                    ),
        //                  width: double.infinity,
        //                 child: ClipRRect(
        //                     borderRadius: BorderRadius.only(
        //  topLeft: Radius.circular(10.0),
        //  topRight: Radius.circular(10.0),
        //  bottomLeft: Radius.zero,
        //  bottomRight: Radius.zero,
        //        ),
        //                   child: Image(
        //                     image:
        //                     NetworkImage( 
        //                       "${widget.image}"
        //                       //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                            
        //                     ),
        //                      fit: BoxFit.cover,
        //                      alignment: Alignment.topCenter,
        //                   ),
        //                 )
                       Stack(
                         children: 
                            [Container(
                            height: 20.h,
                             decoration: BoxDecoration(
                             //  borderRadius: BorderRadius.circular(20),
                              
                               ),
                             width: double.infinity,
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: 
                                [
                                  
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.zero,
                                      bottomRight: Radius.zero,
                                            ),
                                  child: 
                                  CachedNetworkImage(
                                     imageUrl:  
                                     //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                                     "${widget.image}",
                                   fit: BoxFit.fill,
                                          imageBuilder: (context, imageProvider) => Container(
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                       image: imageProvider,
                                       fit: BoxFit.cover,
                                      // colorFilter:
                                         //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                           ),
                                 ),
                                                       ),                 
                                    
                                     progressIndicatorBuilder: (context, url, downloadProgress) => 
                                             Center(child: 
                                     SizedBox( width: 30, height: 30, child: CircularProgressIndicator(value: downloadProgress.progress))),
                                            // CircularProgressIndicator(value: downloadProgress.progress),
                                     errorWidget: (context, url, error) => Container(
                                       color: Colors.grey,
                                       child: Center(child: Icon(Icons.error)),
                                     ),
                                  ),
                                ),
                                 Builder(
                                   builder: (context) {
                                     return 
                                     GestureDetector(
                                       onTap: (){
        setState(() {
                                                
                                              });  
                                       print(isliked);
                                        if(isliked){
                                              getallUnLikeresponse();   
                                             // isliked=false;              
                                         }else{
                                             // isliked=true;
                                               getallLikeresponse();
                                                            //    ref.read(viewgroupprov).postid=widget.postid;
                                                                //  getallLikeresponse();
                                            }
                                       },
                                       child:isliked==true? Padding(
                                         padding:  EdgeInsets.only(top: 13.0,right: 11),
                                         child: SvgPicture.asset("Assets/Images/Tag.svg",width: 12.w,),
                                       )
                                       :
                                       Padding(
                                         padding:  EdgeInsets.only(top: 13.0,right: 11),
                                         child:CircleAvatar(
                                           backgroundColor: Colors.grey[900],radius: 18,
                                           child: Image.asset("Assets/Images/Layer 1.png",)),
                                          // CircleAvatar(
                                          //  backgroundColor: Colors.grey[900],radius: 17,),
                                       ),
                                     );
                                    //  IconButton(
                                    //    onPressed: (){
                                    //       setState(() {
                                                
                                    //           });  
                                    //    print(isliked);
                                    //     if(isliked){
                                    //           getallUnLikeresponse();   
                                    //          // isliked=false;              
                                    //      }else{
                                    //          // isliked=true;
                                    //            getallLikeresponse();
                                    //                         //    ref.read(viewgroupprov).postid=widget.postid;
                                    //                             //  getallLikeresponse();
                                    //         }
                                    //    },
                                    //    icon: Icon(Icons.favorite),color:isliked==true?Colors.red: Colors.white,iconSize: 26,);
                                   }
                                 ),
                              ],
                            ),),
                            
                          ],
                       ),
  //                       CachedNetworkImage(
  //       imageUrl:  
  //       //"http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
  //       "${widget.image}",
  //                          fit: BoxFit.fill,
  //            imageBuilder: (context, imageProvider) => Container(
  //   decoration: BoxDecoration(
  //     image: DecorationImage(
  //         image: imageProvider,
  //         fit: BoxFit.cover,
  //         colorFilter:
  //             ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
  //   ),
  // ),                 
                            
  //       progressIndicatorBuilder: (context, url, downloadProgress) => 
  //               CircularProgressIndicator(value: downloadProgress.progress),
  //       errorWidget: (context, url, error) => Icon(Icons.error),
  //    ),
                        //  SvgPicture.network(
                        //    "${widget.image}",
                        //    fit: BoxFit.fill,
                        //     placeholderBuilder: (BuildContext context) => new Container(
                              
                        //         padding: const EdgeInsets.all(60.0),
                        //         child: const CircularProgressIndicator()),
                        //   ),
                      
                        new Padding(
                          padding: EdgeInsets.only(left: 9.0.sp),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 4.h,),
                             Row(
                               children: [
                                 Container(
                                   width: 44.w,
                                   child: Text("${widget.title}",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w600,
                                     fontFamily: "Gilroy",
                                     fontSize: 11.5.sp,
                                     color: Color(0xff1A1A1A)
                                   ),
                                   )),
                               ],
                             ),
                             SizedBox(height: 10,),
                             Row(mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Text("USD\$${widget.price}.00",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w600,
                                     fontFamily: "Gilroy",
                                     fontSize: 11.5.sp,
                                     color: Color(0xff1A1A1A)
                                   ),),
                                   SizedBox(width: 3.w,)
                               ],
                             )
                            ],
                          ),
                        )
                      ],
                    ),
                  
                  // isliked==true?   Positioned(
                  //             top: 23.5.h,
                  //             right: 1.50.w,
                  //             child:SvgPicture.asset("Assets/Images/Tag.svg",width: 12.w,),
                  //             //  CircleAvatar(
                  //             //   radius: 18.sp,
                  //             //   backgroundColor: Color(0xff2A2C36),
                  //             //   child:  Column(mainAxisAlignment: MainAxisAlignment.center,
                  //             //     children: [
                  //             //       SizedBox(height: 1.h,),
                  //             //       SvgPicture.asset("Assets/Images/Tag.svg",),
                  //             //     ],
                  //             //   ),
                  //             // ),
                  //           ):Container()
                  ],
              ),
            ),
    );
  }
}

