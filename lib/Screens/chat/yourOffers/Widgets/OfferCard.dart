import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

import '../service/MakeanOfferRepository.dart';




class OfferList extends ConsumerStatefulWidget {
  // final List? name;
  // final int? index;
  // final String? type;
  final int? id;
  final String? title;
  final String? thumbnail;
  final DateTime? time;
   final String? profilepic;
    final String? productname;
     final int? price;
  final int? status;
  const OfferList( {Key? key,
  //  this.name,
  //   this.type,
  //   this.index,
  this.id,
    this.title,
   this.thumbnail, this.time, this.profilepic, this.productname, this.price, this.status,}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OfferListState();
}

class _OfferListState extends ConsumerState<OfferList> {
  String followstatus="Accepted";
  int pending=0;
  int accept=1;
  int decline=2;
  bool status=false;
  bool option=false;
  String offerstate="offer";
   String offerstate1="offer";
   int? statenumber;
    Future getpendingoffer()async{  
final offerstatus = await MakeAnRepository().offerstaus(id: widget.id!, status: statenumber);
print(offerstatus['Message']);
print(statenumber);
status =true;

// print(makeoffer!.makeOffer.length);
  setState(() {
    
  });
}
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         GestureDetector(
             onTap:(){
           
             } ,
             child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              // width: 51.w,
             //  height: 16.w,
              decoration: BoxDecoration(
                boxShadow: [
                          BoxShadow(
                           color: Colors.black12,
                            spreadRadius: 1,
                           blurRadius: 5,
                            offset: Offset(2, 2), // changes position of shadow
                               ),
                              ],
                borderRadius: BorderRadius.circular(9),
                color: Colors.white,
                
              ),
               child: Column(
                 children: [
                   Container(
                     height: 16.w,
                     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             CircleAvatar(
                                   radius: 22,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child:
                                     CachedNetworkImage(
                                        imageUrl:widget.profilepic!,
                                       
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
                                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                        errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                                     ),
                                
                                  ),
                                                    ),
                             SizedBox(width: 10,),
                             Container(
                              width: 120,
                              child: Text(widget.title!,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                letterSpacing: .5,
                               fontFamily: "Gilroy",
                              color: Color(0xff1A1A1A),
                                fontSize: 11.sp
                              ),
                              )),
                           ],
                         ),
                         Row(
                           children: [
                             Text(timeAgo(widget.time!)),
                             SizedBox(width: 20,)
                           ],
                         )
                        
                       ],
                     ),
                   ),
                   Container(
                 //    color: Colors.green,
                  height: 36.w,
                   width: double.infinity,
                   child: Row(
                    children: [
                       Container(
                      margin: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                            color: Colors.white,
                           boxShadow: [
                          BoxShadow(
                           color: Colors.black12,
                            spreadRadius: 0,
                           blurRadius: 5,
                            offset: Offset(2, 2), // changes position of shadow
                               ),
                              ],
                           ),
                          width: 150,
                            child: CachedNetworkImage(
                             imageUrl:widget.thumbnail!,
                            width: 7.h,
                                       //  height: 9.h,
                             fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) =>Stack(
                              children: [
                              Container(
                                  decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(9),
                                   color: Colors.white,
                                  boxShadow: [
                                   BoxShadow(
                                    color: Colors.black12,
                                   spreadRadius: 1,
                                    blurRadius: 5,
                                       offset: Offset(2, 2), // changes position of shadow
                                                ),
                                              ],
                                        image: DecorationImage(
                                        image: imageProvider,
                                       fit: BoxFit.fill,      
                                           ),
                                         ),
                                       ),
                                    ],
                                     ),
                                      progressIndicatorBuilder: (context, url, downloadProgress) => 
                                      Container(
                                        decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(9),
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
                                        child: Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
                                     errorWidget: (context, url, error) => 
                                   //  Icon(Icons.error)
                                      Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                                        )
                                 ),
                                Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10,),
                                    Row(children: [
                                      Text('Product name: ',
                                      style:  TextStyle(
                                      fontWeight: FontWeight.w600,
                                        letterSpacing: .5,
                                          fontFamily: "Gilroy",
                                       color: Color(0xff1A1A1A),
                                          fontSize: 11.sp
                                         ),
                                      ),
                                        SizedBox(width: 10,),
                                      Container(
                                        width: 20.w,
                                        child: Text(widget.productname!,
                                        overflow: TextOverflow.ellipsis,
                                         style:  TextStyle(
                                        fontWeight: FontWeight.w400,
                                          letterSpacing: .5,
                                            fontFamily: "Gilroy",
                                         color: Color(0xff1A1A1A),
                                            fontSize: 11.sp
                                           ),
                                        ),
                                      )
                                    ],),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                      Text('Offer Price: ',
                                       style:  TextStyle(
                                      fontWeight: FontWeight.w600,
                                        letterSpacing: .5,
                                          fontFamily: "Gilroy",
                                       color: Color(0xff1A1A1A),
                                          fontSize: 11.sp
                                         ),
                                      ),
                                        SizedBox(width: 10,),
                                      Text('${widget.price!} \$',
                                       style:  TextStyle(
                                      fontWeight: FontWeight.w400,
                                        letterSpacing: 1,
                                          fontFamily: "Gilroy",
                                       color: Color(0xff1A1A1A),
                                          fontSize: 11.sp
                                         ),
                                      )
                                    ],),
                                  ],
                                )
                            ],
                        ),
                   ),
                   Container(
                  
                  height: 16.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                  ),
                   width: double.infinity,
                   child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.status==1?Text('Accepted        ',
                      style: TextStyle(
                         fontFamily: "Gilroy",
                         letterSpacing: .9,
                         fontStyle: FontStyle.italic
                         
                      )):Container(),
                       widget.status==2?Text('Rejected        ',
                      style: TextStyle(
                         fontFamily: "Gilroy",
                         letterSpacing: .9,
                         fontStyle: FontStyle.italic
                         
                      )):Container(),
                   option==true?   Text('$offerstate        ',
                      style: TextStyle(
                         fontFamily: "Gilroy",
                         letterSpacing: .9,
                         fontStyle: FontStyle.italic
                         
                      ),
                       ):
                      //  Text('Declined    ',
                      // style: TextStyle(
                      //    fontFamily: "Gilroy",
                      //    letterSpacing: .9,
                      //    fontStyle: FontStyle.italic
                         
                      // ),
                      // ),
                         widget.status==0?  Row(mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               InkWell(
                                onTap: (){
                          // followstatus="Following";
                               status= true;
                             //  option=true;
                          setState(() {
                        
                                });
                                
                                if (status) {
                                       offerstate="Accepted";
                                       offerstate1="Accept";
                                      status=false;
                                } 
                                 confiramtiondialogbox(offerstate1);
                                // else {
                                //      offerstate="Declined";
                                //       status= true;
                                // }
                                },
                                 child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 15),
                                 height: double.infinity,
                                 decoration: BoxDecoration(
                                       color: Color(0xff591B4C),
                                       borderRadius: BorderRadius.circular(7)
                                 ),
                                      width: 90,
                                      child: Center(child: Text('Accept',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                       fontFamily: "Gilroy",
                                       letterSpacing: .9,
                                       fontSize: 9.sp,
                                      ),
                                      )),
                                 ),
                               ),
                                 SizedBox(width: 10,),
                            InkWell(
                            onTap: (){
                          // followstatus="Following";
                         //  status= false;
                          setState(() {
                        
                            });
                         
                             if (status==false) {
                                   offerstate="Declined";
                                     offerstate1="Decline";
                                   status= false;
                            } 
                            confiramtiondialogbox(offerstate1);
                            //  option=true;
                            // else {
                            //      offerstate="Declined";
                            //       status= true;
                            // }
                            },
                             child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 15),
                             height: double.infinity,
                             decoration: BoxDecoration(
                                   color: Color(0xff591B4C),
                                   borderRadius: BorderRadius.circular(7)
                             ),
                                  width: 90,
                                  child: Center(child: Text('Decline',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                   fontFamily: "Gilroy",
                                   letterSpacing: .9,
                                   fontSize: 9.sp,
                                  ),
                                  )),
                             ),
                           ),
                       SizedBox(width: 10,),
                             ],
                           ):Container()
                         
                    ],
                   ),
                   )
                 ],
               ),
             ),
           )
        
      ],
    );
  }
  confiramtiondialogbox(String text){
    return   showDialog(
              context: context,
              builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Confirmation"),
                    content: Container(
                      width: double.infinity,
                      child: Text("Make Sure You Want to $text this Offer?")),
                    contentTextStyle: TextStyle(
                       fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                             color: Color(0xff1A1A1A),
                            fontSize: 11.sp
                    ),
                    actions: [
                      InkWell(
                                onTap: (){
                          // followstatus="Following";
                          if (text =="Accept") {
                            statenumber=1;
                             getpendingoffer();
                             Navigator.pop(context);
                              // if (status) {
                              //          offerstate="Accepted";
                              //         status=false;
                              //         if (widget.status==1) {
                              //             option=true;
                              //         } else {
                              //           option=false;
                              //         }

                              //         Navigator.pop(context);
                              //   } 
                              //   else{
                              //       status= true;
                              //   if (widget.status==1) {
                              //             option=true;
                              //         } else {
                              //           option=false;
                              //         }
                              //  Navigator.pop(context);
                              //   }
                          } else if(text =="Decline"){
                             statenumber=2;
                              getpendingoffer();
                              Navigator.pop(context);
                            //   if (status==false) {
                            //        offerstate="Declined";
                            //        status= false;
                            //         if (widget.status==2) {
                            //               option=true;
                            //           } else {
                            //             option=false;
                            //           }
                            //          Navigator.pop(context);
                            // } 
                            
                          }
                             
                          setState(() {
                        
                                });
                                // confiramtiondialogbox();
                              
                                // Navigator.pop(context);
                                // else {
                                //      offerstate="Declined";
                                //       status= true;
                                // }
                                },
                                 child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 15),
                               //  height: double.infinity,
                               height: 35,
                                 decoration: BoxDecoration(
                                       color: Color(0xff591B4C),
                                       borderRadius: BorderRadius.circular(7)
                                 ),
                                      width: 93,
                                      child: Center(child: Text('$text',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                       fontFamily: "Gilroy",
                                       letterSpacing: .10,
                                       fontSize: 10.sp,
                                      ),
                                      )),
                                 ),
                               ),
                                 SizedBox(width: 6,),
                            InkWell(
                            onTap: (){
                          // followstatus="Following";
                         //  status= false;
                          setState(() {
                        
                            });
                         
                        //      if (status==false) {
                        //            offerstate="Declined";
                        //            status= false;
                        //     } 
                        //  //   confiramtiondialogbox();
                        //      option=true;
                             Navigator.pop(context);
                            // else {
                            //      offerstate="Declined";
                            //       status= true;
                            // }
                            },
                             child: Container(
                                height: 35,
                                  margin: EdgeInsets.symmetric(vertical: 15),
                            // height: double.infinity,
                             decoration: BoxDecoration(
                                   color: Color(0xff591B4C),
                                   borderRadius: BorderRadius.circular(7)
                             ),
                                  width: 93,
                                  child: Center(child: Text('Cancel',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                   fontFamily: "Gilroy",
                                   letterSpacing: .9,
                                   fontSize: 10.sp,
                                  ),
                                  )),
                             ),
                           ),
                       SizedBox(width: 10,),
                    ],
                  );
              }
            );
  }
}