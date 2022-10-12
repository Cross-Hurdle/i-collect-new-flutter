


import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';



class FirebaseApi{
  static UploadTask? uploadfile(String destination ,File file){
    try {  
       final ref = FirebaseStorage.instance.ref(destination);

       return ref.putFile(file);
    } on FirebaseException {
      return null;
    }
  }
  static UploadTask? uploadBytes(String destination ,Uint8List data){
    try {  
       final ref = FirebaseStorage.instance.ref(destination);

       return ref.putData(data);
    } on FirebaseException {
      return null;
    }
  }
}
class OrderDetails extends ConsumerStatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends ConsumerState<OrderDetails> {
  // File?file;
  // UploadTask?task;
  
  @override
  Widget build(BuildContext context) {
   // final fileName = file !=null? basename(file!.path):"No file Choosen";
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
          toporderDetails(),
           cart(),
          Container(),
          bottomOrderInformation(),
        
          botton()
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
  Widget botton(){
    return Row(
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: MaterialButton(
          onPressed: (){
           // uploadfile();
           // Navigator.of(context).popUntil((route) => route.isFirst);
          //          Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const  Home()),
          // );
          //          pushNewScreen(
          //         context,
          //         screen:MyOrder() ,
          //         withNavBar: false, // OPTIONAL VALUE. True by default.
          //         pageTransitionAnimation: PageTransitionAnimation.cupertino,
          //     );
          },
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.sp),
            child: Text(
              'Reorder',
               overflow: TextOverflow.clip,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
               // letterSpacing: .5,
              ),
            ),
          ),
               // minWidth: 50.w,
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
             side: BorderSide(color:  kPrimaryColor,width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
          ),
              ),
            ),
        ),
 Expanded(
   child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: MaterialButton(
          onPressed: (){
          // selectFile();
           // Navigator.of(context).popUntil((route) => route.isFirst);
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
              padding:  EdgeInsets.symmetric(vertical: 10.sp),
            child: Text(
              'Leave feedback',
               overflow: TextOverflow.clip,
              style: TextStyle(
                color: kBackground,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
               // letterSpacing: .5,
              ),
            ),
          ),
         // minWidth: 50.w,
          elevation: 5,
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
          ),
        ),
      ),
 )
      ],
    );
  }
  Widget bottomOrderInformation(){
    return Container(
       margin: EdgeInsets.only(left: 4.w,right: 4.w, top: 4.h,bottom: 2.h),
      child: Column(
        children: [
           Row(
           children: [
             Container(
                       width: 53.w,
                       child: Text("Order information",
              overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                           fontWeight: FontWeight.w400,
                              fontFamily: "Gilroy",
                             fontSize: 14.5.sp,
                              color: Color(0xff1A1A1A)
                             ),
                         ),
                     ),
             
           ],
         ),
        OrderInformation(details: "3 Newbridge Court ,Chino Hills, New York, USA", title: "Shipping Address:"),
         OrderInformation(details: "**** **** **** 3947", title: "Payment method:"),
          OrderInformation(details: "3 days Free Delivery ", title: "Delivery Time:"),
           OrderInformation(details: "10%, Personal promo code", title: "Discount:"),
            OrderInformation(details: "₹1615", title: "Total Amount:"),

        ],
      ),
    );
  }
  Widget toporderDetails(){
   //  final fileName = file !=null? basename(file!.path):"No file Choosen";
    return Column(
      children: [
        // Text(fileName ),
        //   task!=null? builduploadstaus(task!):Container(),
        Row(
          children: [
           Container(
                 margin: EdgeInsets.only(left: 4.w,right: 4.w, top: 4.h,bottom: 2.h),
             child: Text("Order ID#1947034",
          overflow: TextOverflow.ellipsis,
                style: TextStyle(
                 fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                   fontSize: 14.sp,
                    color: Color(0xff1A1A1A)
                   ),
               ),
           ),         
          ],
        ),
         Container(
              margin: EdgeInsets.only(left: 9.w,right: 4.w, bottom: 2.h),
           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Container(
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
                 Container(
                   child: Text("Delivered",
            overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                       fontWeight: FontWeight.w600,
                          fontFamily: "Gilroy",
                         fontSize: 11.sp,
                          color: Color(0xff55D85A)
                         ),
                     ),
                 ),
            ],
        ),
         ),
      Row(
          children: [
           Container(
                 margin: EdgeInsets.only(left: 4.w,right: 4.w, top: 0.h,bottom: 2.h),
             child: Text("3 items",
          overflow: TextOverflow.ellipsis,
                style: TextStyle(
                 fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                   fontSize: 13.sp,
                    color: Color(0xff1A1A1A)
                   ),
               ),
           ),         
          ],
        ),
      ],
    );
  }
  Widget cart(){
    return  GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                // crossAxisSpacing: 5.0,
                // mainAxisSpacing: 5.0,
                mainAxisExtent: 16.h,
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
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 28.w,
                            width: 28.w,
                            child:  ClipRRect(
                                borderRadius: BorderRadius.only(
         topLeft: Radius.circular(10.0),
         topRight: Radius.zero,
         bottomLeft: Radius.circular(10.0),
         bottomRight: Radius.zero,
                     ),
                              child: Image.asset( "Assets/Images/Chip 1.jpeg",fit: BoxFit.cover,))),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.all(11.0),
                                              child: Container(
                                                //color: Colors.red,
                                                width: 50.w,
                                                child: Text("Tropicana \$1 casino chip",
                                                      overflow: TextOverflow.ellipsis,
                                                       style: TextStyle(
                                                         fontWeight: FontWeight.w600,
                                                         fontFamily: "Gilroy",
                                                         fontSize: 16,
                                                         color: Color(0xff1A1A1A)
                                                       ),
                                                       ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(left:11.0,top: 9.sp),
                                          child: Text("Price: \$1.00",
                                                 style: TextStyle(
                                                   fontWeight: FontWeight.w400,
                                                   fontFamily: "Gilroy",
                                                   fontSize: 16,
                                                   color: Colors.grey
                                                 ),
                                                 ),
                                        ),
                                      ],
                                    ),
                                      ],
                                    ),
                                    // Row(mainAxisAlignment: MainAxisAlignment.start,
                                    //   children: [
                                    //     Text("Price: \$1.00",
                                    //            style: TextStyle(
                                    //              fontWeight: FontWeight.w600,
                                    //              fontFamily: "Gilroy",
                                    //              fontSize: 16,
                                    //              color: Color(0xff1A1A1A)
                                    //            ),
                                    //            ),
                                    //   ],
                                    // ),
                                   
                                  ],
                                ),
                              ),
                            ),
//                          Container(
//                           // margin: EdgeInsets.only(right: 5.sp),
//                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                              children: [
//                                 SizedBox(height: 1.h,),
//                                Text("Quantity",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontFamily: "Gilroy",
//                                         fontSize: 9.sp,
//                                         color: Color(0xff1A1A1A)
//                                       ),
//                                       ),
//                                 SizedBox(height: 1.5.h,),
//                               Container(
//                               height: 3.5.h,
//                               //width: 11.w,
//                                  decoration: BoxDecoration(
                     
//                color: Colors.white,
//                  boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               spreadRadius: 1,
//               blurRadius: 5,
//               offset: Offset(2, 2), // changes position of shadow
//             ),
//               ],
//               ),
//                                 child:  DropdownButton(
//        isExpanded: false,
//        icon: Icon(Icons.arrow_upward_outlined, color: kGoldText, size: 15.sp),
//         iconSize: 15.sp,
//         elevation: 4,
//         underline: Container(),
//      hint: Padding(
//         padding: const EdgeInsets.only(left:7,right: 7),
//        child: Text('1'),
//      ),
//      value: currentSelectedValue,
//      onChanged: (newValue) {
//      setState(() {
//                currentSelectedValue= newValue;
//               });
//               print(currentSelectedValue,);
//   },
//   items:list.map(( value) {
//     return DropdownMenuItem(
      
//       value: value,
//       child: Text("$value"),
//     );
//   }).toList(),
  
// ),
//                               )
//                              ],
//                               ),
//                          ),
                        SizedBox(width: 7.w,)
                        ],
                    ),
                  ),
                  // Container(
                  //  color: Colors.blue,
                  //   child: Image.asset("Assets/Images/chip 10.jpeg",fit: BoxFit.cover, ),
                  // ),
                );
              },
            );
  }
   AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      automaticallyImplyLeading: true,
       leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xff1A1A1A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      centerTitle: true,
      title: Text("Order Details",
       style: TextStyle(
        fontWeight: FontWeight.w600,
         fontFamily: "Gilroy",
    fontSize: 15.6.sp,
     color: Color(0xff1A1A1A)
      ),),
    //   actions: [
    //     Image.asset("Assets/Images/Share.png",
    //  width: 12.w,
    //   ),
    //   ],
      elevation: 1,
    );
  }
  // Future selectFile()async{
  //   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  //    if (result ==null) return;
  //      final path = result.files;
  //    setState(() {
  //      file =File(path.toString());
  //    });
  // }
  // Future uploadfile()async{
  //   if(file==null)return;

  //   final filename = basename(file!.path);
  //   final destination ='files/$filename';

  //  task= FirebaseApi.uploadfile(destination,file!);
  //  setState(() {
     
  //  });
  //   if(task == null) return;

  //   final snapshot = await task!.whenComplete(() {});
  //   final urlDownloader = await snapshot.ref.getDownloadURL();

  //   print("Url link $urlDownloader");
  // }
  // Widget builduploadstaus(UploadTask task)=> StreamBuilder<TaskSnapshot>(
  //   stream: task.snapshotEvents,
  //   builder: (context,snapshots){
  //      if (snapshots.hasData) {
  //        final snap = snapshots.data;
  //        final progress = snap!.bytesTransferred/snap.totalBytes;
  //        return Text('$progress');
  //      } else {
  //        return Container();
  //      }
  //   },
  // );
}
class OrderInformation extends ConsumerStatefulWidget {
  final String title;
  final String details;
  OrderInformation({Key? key,required this.details,required this.title}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderInformationState();
}

class _OrderInformationState extends ConsumerState<OrderInformation> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          SizedBox(height: 3.h,),
         Row(
           children: [
             Expanded(
               child: Container(
                // color: Colors.red,
                         width: double.infinity,
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("${widget.title}",
                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                 fontWeight: FontWeight.w400,
                                    fontFamily: "Gilroy",
                                   fontSize: 12.sp,
                                    color: Color(0xff1A1A1A)
                                   ),
                               ),
                           ],
                         ),
                       ),
             ),
              Expanded(
                child: Container(
                  // color: Colors.blue,
                   width: double.infinity,
                  child:  Text("${widget.details}",
              // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                             fontWeight: FontWeight.w400,
                                fontFamily: "Gilroy",
                               fontSize: 12.sp,
                                color: Color(0xff1A1A1A)
                               ),
                           ),
                ),
              )
           ],
         )
      ],
    );
  }
  
}