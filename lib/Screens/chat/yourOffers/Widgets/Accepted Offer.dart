import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/exports.dart';
import 'package:icollekt/Screens/cart/Provider/CartProvider.dart';
import 'package:icollekt/Screens/cart/SelectBuyerAddress.dart';

class AcceptedOffer extends ConsumerStatefulWidget {
  final int? id;
  final String? title;
  final String? thumbnail;
  final DateTime? time;
   final String? enddate;
   final String? profilepic;
    final String? productname;
     final int? price;
     final int? offerprice;
  final int? status;
  const AcceptedOffer({Key? key,this.id, this.title, this.thumbnail, this.time, this.enddate, this.profilepic, this.productname, this.price, this.offerprice, this.status,}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AcceptedOfferState();
}

class _AcceptedOfferState extends ConsumerState<AcceptedOffer> {

  @override
  Widget build(BuildContext context) {
           return  GestureDetector(
            child: Container(
              width: double.infinity,
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
                  SizedBox(height: 10,),
                  Container(
                    //color: Colors.red,
                    child: Row(children: [

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
                                width: 180,
                                child: Text(widget.title!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: "Gilroy",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: .5,
                                  fontSize: 16,
                                  // color: Color.fromARGB(255, 21, 106, 25),
                                ),
                                )),
                    ],),
                  ),
                                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Column(
                                            //   crossAxisAlignment: CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 130,
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
                          width: 130,
                                child: CachedNetworkImage(
                                 imageUrl:widget.thumbnail!,
                                width: 7.h,
                                                   //  height: 9.h,
                                 fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) =>Container(
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
                                                 fit: BoxFit.cover,      
                                                     ),
                                                   ),
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
                                              ],
                                            ),
                                            SizedBox(width:20),
                                          
                                                  Container(
                                                    width:50.w,
                                          //    color:Colors.red,
                                                   child: Column(
                                                             mainAxisAlignment: MainAxisAlignment.start,
                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                                             children: [
                                                                SizedBox(height: 10,),
                                                             Text('Your offer: \$ ${widget.offerprice}',
                                                             style: TextStyle(
                                                                       fontFamily: "Gilroy",
                                                                     fontWeight: FontWeight.bold,
                                                                     letterSpacing: .5,
                                                                     fontSize: 14,
                                                                     // color: Color.fromARGB(255, 21, 106, 25),
                                                                   ),
                                                             ),
                                                             SizedBox(height: 5,),
                                                              Text('Current offer: \$${widget.price}',
                                                              style: TextStyle(
                                                                       fontFamily: "Gilroy",
                                                                     fontWeight: FontWeight. w500,
                                                                     letterSpacing: .5,
                                                                     color: Colors.grey,
                                                                     fontSize: 13,
                                                                     // color: Color.fromARGB(255, 21, 106, 25),
                                                                   ),
                                                              ),
                                                              SizedBox(height: 7,),
                                                               Row(
                                                                 children: [
                                                                  Container(
                                                                      decoration: BoxDecoration(
                                                                       border: Border.all(
                                                                     color: Color.fromARGB(255, 41, 102, 43),
                                                                        width: 2,
                                                            ),
                                                         borderRadius: BorderRadius.circular(50),
                                                        ),
                                                                   child: Padding(
                                                                     padding: const EdgeInsets.all(2.0),
                                                                     child: Icon(Icons.done,size: 9,   color: Color.fromARGB(255, 21, 106, 25),),
                                                                   )),
                                                                    SizedBox(width: 5,),
                                                                   Text('Accepted',
                                                                   style: TextStyle(
                                                                       fontFamily: "Gilroy",
                                                                     fontWeight: FontWeight.bold,
                                                                     letterSpacing: 1,
                                                                     fontSize: 13,
                                                                      color: Color.fromARGB(255, 21, 106, 25),
                                                                   ),
                                                                   ),
                                                                 ],
                                                               ),
                                                               // SizedBox(height: 10,),
                                                               //  Text('Buy before 16 June at 7PM',
                                                               //       style: TextStyle(
                                                               //           fontFamily: "Gilroy",
                                                               //         fontWeight: FontWeight.w400,
                                                               //         letterSpacing: .5,
                                                               //         fontSize: 16,
                                                               //          color: Color.fromARGB(255, 21, 106, 25),
                                                               //       ),
                                                               //       ),
                                                                     SizedBox(height: 6,),
                                                              Container(
                                                              // width: 40.w,
                                                                child: Text('Buy before ${widget.enddate} at 7PM',
                                                                  style: TextStyle(
                                                                      fontFamily: "Gilroy",
                                                                    fontWeight: FontWeight.bold,
                                                                    letterSpacing: .5,
                                                                    fontSize: 11.5,
                                                                     color: Color.fromARGB(255, 21, 106, 25),
                                                                  ),
                                                                  ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                    
                                                                  InkWell(
                                                          onTap: (){
                                                            print('sId: ${widget.id}');
                                                             ref.read(cartProvider).sellerid=widget.id;
                                                            ref.read(cartProvider).sellername=widget.productname;
                                                            pushNewScreen(
                                                               context,
                                                             screen: SelectBuyerAddress() ,
                                                             withNavBar: true, // OPTIONAL VALUE. True by default.
                                                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                                              );
                                                       },
                                                         child: Container(
                                                           margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                                                           width:50.w,
                                                           height: 40,
                                                           decoration: BoxDecoration(
                                                             borderRadius: BorderRadiusDirectional.circular(5),
                                                             color: Color(0xff591B4C)
                                                           ),
                                                           child: Center(child: Text('Buy now',
                                                           style: TextStyle(
                                                             color: Colors.white,
                                                             fontWeight: FontWeight.w600,
                                                             fontFamily: "Gilroy",
                                                             fontSize: 13
                                                           ),
                                                           )),
                                                         ),
                                                       ), 
                                                             ],
                                                           ),
                                                         
                                                          ]),
                                     ),
                       ],
                   ),
                ],
               ),
            )
           );
         
  }
}