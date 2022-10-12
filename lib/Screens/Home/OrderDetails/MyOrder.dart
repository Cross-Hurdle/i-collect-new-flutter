import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

import 'orderDetails.dart';

class MyOrder extends ConsumerStatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyOrderState();
}

class _MyOrderState extends ConsumerState<MyOrder> {
  bool delivered =true;
  bool processing = false;
  bool cancelled =false;
   String deliverystatus ='Delivered';
      orderdeliver(){
      if (deliverystatus=="Delivered") {
      return Colors.green;
      
    } else if(deliverystatus=="Processing") {
      return Colors.orange;
    }else if(deliverystatus=="Cancelled"){
    return Colors.red;
    }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:  RefreshIndicator(
        onRefresh:()async{

        },
        child: CustomScrollView(
          
          physics:  BouncingScrollPhysics(),
          slivers: 
            [
              SliverList(delegate: SliverChildListDelegate(
                [
                   Column(
        children: [
          Row(
            children: [
          Container(
             margin: EdgeInsets.only(left: 4.w,right: 4.w, bottom: 0.h,top: 2.h),
                        // width: 33.w,
                         child: Text("My Orders",
            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              letterSpacing: .5,
                             fontWeight: FontWeight.w700,
                          fontFamily: "Gilroy",
                         fontSize: 16.sp,
                          color: Color(0xff1A1A1A)
                         ),
                           ),
                   ),
            ],
          ),
         topselect(),
         orders()
        ],
      )
                ]
              )
              ), 
          ],
        ),
      ),
    );
  }
  Widget topselect(){
    return Row(
      children: [
        SizedBox(width: 10,),
 Expanded(
   child: Container(
       // margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: MaterialButton(
          onPressed: (){
               cancelled=false;
            processing=false;
            delivered=true;
            deliverystatus='Delivered';
            setState(() {
              
            });
          //  Navigator.of(context).popUntil((route) => route.isFirst);
    //          Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const  Home()),
    // );
        //      pushNewScreen(
        //     context,
        //     screen:Home() ,
        //     withNavBar: false, // OPTIONAL VALUE. True by default.
        //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 4.sp),
            child: Text(
              'Delivered',
                overflow: TextOverflow.clip,
              style: TextStyle(
                color:delivered==true? kBackground:Color(0xff1A1A1A),
                fontSize:10.sp,
                fontWeight:delivered==true? FontWeight.w400:FontWeight.w500,
               // letterSpacing: .5,
              ),
            ),
          ),
         // minWidth: 50.w,
          elevation: 5,
          color:delivered==true? kPrimaryColor:Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
          ),
        ),
      ),
 ),
  SizedBox(width: 10,),
 Expanded(
   child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: MaterialButton(
          onPressed: (){
             cancelled=false;
            processing=true;
            delivered=false;
             deliverystatus='Processing';
            setState(() {
              
            });
         //  Navigator.of(context).popUntil((route) => route.isFirst);
    //          Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const  Home()),
    // );
        //      pushNewScreen(
        //     context,
        //     screen:Home() ,
        //     withNavBar: false, // OPTIONAL VALUE. True by default.
        //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
          },
          child: Padding(
             padding:  EdgeInsets.symmetric(vertical: 4.sp),
            child: Text(
              'Processing',
              overflow: TextOverflow.clip,
              style: TextStyle(
                color:processing==true? kBackground:Color(0xff1A1A1A),
                fontSize:10.sp,
                fontWeight:processing==true? FontWeight.w400:FontWeight.w500,
               // letterSpacing: .5,
              ),
            ),
          ),
         // minWidth: 50.w,
          elevation: 5,
          color:processing==true? kPrimaryColor:Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
          ),
        ),
      ),
 ),
 SizedBox(width: 10,),
 Expanded(
   child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: MaterialButton(
          onPressed: (){
            cancelled=true;
            processing=false;
            delivered=false;
            deliverystatus='Cancelled';
            setState(() {
              
            });
       //     Navigator.of(context).popUntil((route) => route.isFirst);
    //          Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const  Home()),
    // );
        //      pushNewScreen(
        //     context,
        //     screen:Home() ,
        //     withNavBar: false, // OPTIONAL VALUE. True by default.
        //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
        // );
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 4.sp),
            child: Text(
              'Cancelled',
                overflow: TextOverflow.clip,
              style: TextStyle(
                color:cancelled==true? kBackground:Color(0xff1A1A1A),
                fontSize:10.sp,
                fontWeight:cancelled==true? FontWeight.w400:FontWeight.w500,
                //letterSpacing: .5,
              ),
            ),
          ),
         // minWidth: 50.w,
          elevation: 5,
          color: cancelled==true? kPrimaryColor:Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
          ),
        ),
      ),
 ),
  SizedBox(width: 10,),
      ],
    );
  }
   AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackground,
      automaticallyImplyLeading: true,
       leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff1A1A1A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      
     
    );
  }
  Widget orders(){
   
  //  orderdeliver(String delivery){
  //     if (delivery=="Delivered") {
  //     delivery ="Delivered";
      
  //   } else if(delivery=="Processing") {
  //     delivery="processing";
  //   }else if(delivery=="Cancelled"){
  //    delivery="cancelled";
  //   }
  //  }
  // getColor(deliverystatus) {
  //   if (deliverystatus == 'Order Placed')
  //     return Colors.greenAccent;
  //   else if (deliverystatus == 'Picked Up')
  //     return Colors.yellow;
  //   else if (deliverystatus == 'Delivered')
  //     return Colors.green;
  //   else if (deliverystatus == 'Cancelled')
  //     return kPrimaryColor;
  //   else
  //     return Colors.orange;
  // }

    return  GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                // crossAxisSpacing: 5.0,
                // mainAxisSpacing: 5.0,
                mainAxisExtent: 26.h,
              ),
              itemCount:3,
              
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
      //                                  pushNewScreen(
      //     context,
      //     screen: ProfilePost(),
      //     withNavBar: true, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
                                   },
                  child:    Container(
                    margin: EdgeInsets.all(10),
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
                    child: Column(
                      children: [
                        Container(
              margin: EdgeInsets.only(left: 3.w,right: 4.w, bottom: 2.h,top: 2.h),
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Container(
               child: Row(
                 children: [
                   Container(
                        // width: 33.w,
                         child: Text("Order ID #1947034",
            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                             fontWeight: FontWeight.w500,
                          fontFamily: "Gilroy",
                         fontSize: 12.sp,
                          color: Color(0xff1A1A1A)
                         ),
                           ),
                   ),
                  // SizedBox(width: 10,),
                        
                 ],
               ),
             ),
                 Container(
                   child: Text("05-12-2019",
            overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                           fontWeight: FontWeight.w400,
                        fontFamily: "Gilroy",
                             fontSize: 12.sp,
                        color: Color(0xff1A1A1A)
                             ),
                         ),
                 ),
            ],
        ),
         ),
         Container(
              margin: EdgeInsets.only(left: 3.w,right: 4.w, bottom: 2.h),
           child: Container(
             child: Row(
               children: [
                 Container(
                   width: 33.w,
                   child: Text("Tracking number:",
            overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                       fontWeight: FontWeight.w500,
                          fontFamily: "Gilroy",
                         fontSize: 12.sp,
                          color: Color(0xff1A1A1A)
                         ),
                     ),
                 ),
                // SizedBox(width: 10,),
                   Container(
                     child: Text("IW3475453455",
            overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                         fontWeight: FontWeight.w400,
                            fontFamily: "Gilroy",
                           fontSize: 11.sp,
                            color: Color(0xff1A1A1A)
                           ),
                       ),
                   ),
               ],
             ),
           ),
         ),
         Container(
              margin: EdgeInsets.only(left: 3.w,right: 4.w, bottom: 2.h),
           child: Container(
             child: Row(
               children: [
                 Container(
                   width: 33.w,
                   child: Text("Total Amount:",
            overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                       fontWeight: FontWeight.w500,
                          fontFamily: "Gilroy",
                         fontSize: 12.sp,
                          color: Color(0xff1A1A1A)
                         ),
                     ),
                 ),
                // SizedBox(width: 10,),
                   Container(
                     child: Text("\$300",
            overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                         fontWeight: FontWeight.w400,
                            fontFamily: "Gilroy",
                           fontSize: 11.sp,
                            color: Color(0xff1A1A1A)
                           ),
                       ),
                   ),
               ],
             ),
           ),
         ),
         // SizedBox(height: 3.h,),
         Container(
             margin: EdgeInsets.only(left: 3.w,right: 4.w, bottom: 2.h),
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Container(
                // color: Colors.red,
                  // margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                   child: MaterialButton(
               onPressed: (){
                // Navigator.of(context).popUntil((route) => route.isFirst);
              //           Navigator.push(
              //    context,
              //    MaterialPageRoute(builder: (context) => const  Home()),
              //  );
                        pushNewScreen(
                       context,
                       screen:OrderDetails() ,
                       withNavBar: false, // OPTIONAL VALUE. True by default.
                       pageTransitionAnimation: PageTransitionAnimation.cupertino,
                   );
               },
               child: Padding(
                 padding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 3.w),
                 child: Text(
                   'Details',
                   style: TextStyle(
                     color: kPrimaryColor,
                     fontSize: 10.sp,
                     fontWeight: FontWeight.w400,
                     letterSpacing: .5,
                   ),
                 ),
               ),
                    // minWidth: 50.w,
               elevation: 5,
               color: Colors.white,
               shape: RoundedRectangleBorder(
                  side: BorderSide(color:  kPrimaryColor,width: 1),
                 borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
               ),
                   ),
                 ),
                Container(
                  // color: Colors.blue,
                 //  width: double.infinity,
                  child:  Text("$deliverystatus",
                // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                             fontWeight: FontWeight.w600,
                                fontFamily: "Gilroy",
                               fontSize: 12.sp,
                                color: orderdeliver()
                               ),
                           ),
                )
             ],
           ),
         )
                      ],
                    ),
                  ),
                 
                );
              },
            );
  }
}