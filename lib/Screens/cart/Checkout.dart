import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/cart/payment%20Gateway/makepayment.dart';
import 'package:icollekt/Screens/cart/payment%20Gateway/paypalPayment.dart';
import 'package:icollekt/Screens/cart/widget/TotalPrice.dart';
import '../Home/Success/Success.dart';
import 'Model/CheckoutModle.dart';
import 'Provider/CartProvider.dart';
import 'Service/CartRepository.dart';

class Checkout extends ConsumerStatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckoutState();
}

class _CheckoutState extends ConsumerState<Checkout> {
  @override
  void initState() { 
    super.initState();
    getcheckoutProduct();
  }
  String?payPal;
  bool status =false;
  CheckoutSummaryModle ? checkoutSummaryModle;
 Future getcheckoutProduct()async{  
  final prov=ref.read(cartProvider);
 checkoutSummaryModle = await CartRepository().getcartSummary(prov.addressid,prov.sellerid );
status =true;
print('object');
print(checkoutSummaryModle!.cartSummary[0].product.length);
  setState(() {
    
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color(0xffF9F2FF),
      appBar:buildAppBar(),
      body:Builder(
        builder: (context) {
           if (!status) {
                 return Container(
                    height: 50.h,
                   child: Center(child: CircularProgressIndicator())
                   );
               }else{
                if (checkoutSummaryModle!.cartSummary[0].product.length!=0){                
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        
                          children: [
                           title(),
                            SizedBox(height: .5.h,),
                              Container(
                                child: ListView.builder(
                                   physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                itemCount: checkoutSummaryModle!.cartSummary[0].product.length,
                                 itemBuilder: ((context, index) {
                                return produtlist(index);
                              })),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Shipping Address',
                                    style: TextStyle(
                                          decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Gilroy',
                                                letterSpacing: 1,
                                                color: Colors.black,
                                                fontSize: 13.5.sp
                                              ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text('Edit',
                                   style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Gilroy",
                                           fontSize: 11.sp,
                                           color: Color(0xff591B4C)
                                           ),),
                                        ),
                                          SizedBox(width: 20,),
                                      ],
                                    )
                                  ],
                                )),
                                 Container(
                                  width: double.infinity,
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
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    SizedBox(width: 20,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         SizedBox(height: 20,),
                                        Row(
                                          children: [
                                              Text('Name: ' ,
                                             style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: 'Gilroy',
                                                        letterSpacing: .5,
                                                        color: Colors.black,
                                                        fontSize: 12.sp
                                                      ),
                                            ),
                                            Text('${checkoutSummaryModle!.cartSummary[0].buyerAddress[0].name}' ,
                                             style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Gilroy',
                                                    //    letterSpacing: .5,
                                                        color: Colors.black,
                                                        fontSize: 12.sp
                                                      ),
                                            ),
                                          ],
                                        ),
                                          SizedBox(height: 5,),
                                         Row(
                                           children: [
                                              Text('Phone no: ' ,
                                             style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: 'Gilroy',
                                                        letterSpacing: .5,
                                                        color: Colors.black,
                                                        fontSize: 11.sp
                                                      ),
                                            ),
                                             Text(' ${checkoutSummaryModle!.cartSummary[0].buyerAddress[0].phone},',
                                      
                                       style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Gilroy',
                                                      //  letterSpacing: .5,
                                                        color: Colors.black,
                                                        fontSize: 11.sp
                                                      ),
                                        ),
                                           ],
                                         ),
                                           SizedBox(height: 5,),
                                         Row(
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                              Text('Address: ' ,
                                             style: TextStyle(
                                                  decoration: TextDecoration.none,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: 'Gilroy',
                                                        letterSpacing: .5,
                                                        color: Colors.black,
                                                        fontSize: 11.sp
                                                      ),
                                            ),
                                             Container(
                                              width: 60.w,
                                               child: Text('${checkoutSummaryModle!.cartSummary[0].buyerAddress[0].address}, ${checkoutSummaryModle!.cartSummary[0].buyerAddress[0].city}, ${checkoutSummaryModle!.cartSummary[0].buyerAddress[0].country} ${checkoutSummaryModle!.cartSummary[0].buyerAddress[0].postalCode}'
                            
                                        ,
                                        style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'Gilroy',
                                                         // letterSpacing: .5,
                                                          color: Colors.black,
                                                          fontSize: 11.sp
                                                        ),
                                        ),
                                             ),
                                           ],
                                         ),
                                          SizedBox(height: 20,),
                                      ],
                                    ),
                                  ],
                                )),
                                //  Container(
                                //   margin: EdgeInsets.all(10),
                                //    child: Text('Coupon Offer',
                                //       style: TextStyle(
                                //             decoration: TextDecoration.none,
                                //                   fontWeight: FontWeight.w600,
                                //                   fontFamily: 'Gilroy',
                                //                   letterSpacing: 1,
                                //                   color: Colors.black,
                                //                   fontSize: 13.5.sp
                                //                 ),
                                //       ),
                                //  ),
                                //  CouponOffer(),
                                   Container(
                                  margin: EdgeInsets.all(10),
                                   child: Text('Bill Details',
                                      style: TextStyle(
                                            decoration: TextDecoration.none,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Gilroy',
                                                  letterSpacing: 1,
                                                  color: Colors.black,
                                                  fontSize: 13.5.sp
                                                ),
                                      ),
                                 ),
                                TotalPrice(
                                  originalprice:checkoutSummaryModle!.cartSummary[0].grandTotal.toString() ,
                                  discount:checkoutSummaryModle!.cartSummary[0].discount.toString(),
                                  tax: checkoutSummaryModle!.cartSummary[0].tax.toString(),
                                  grandtotal:checkoutSummaryModle!.cartSummary[0].grandTotal.toString() ,
                                ),
                               
                              //  Container(
                              //   margin: EdgeInsets.all(10),
                              //   child: Text('Payment Method',
                              //   style: TextStyle(
                              //         decoration: TextDecoration.none,
                              //               fontWeight: FontWeight.w600,
                              //               fontFamily: 'Gilroy',
                              //               letterSpacing: 1,
                              //               color: Colors.black,
                              //               fontSize: 13.5.sp
                              //             ),
                              //   )),
                            //      Container(
                            //     margin: EdgeInsets.all(10),
                            //     child: Row(
                            //       children: [
                            //         Radio(
                            //   value: "PayPal", 
                            // groupValue: payPal, 
                            //  onChanged: (value){
                            //    setState(() {
                            //       payPal = value.toString();
                            //         });
                            //      }),
                            //         Text('PayPal',
                            //         style: TextStyle(
                            //               decoration: TextDecoration.none,
                            //                     fontWeight: FontWeight.w500,
                            //                     fontFamily: 'Gilroy',
                            //                     letterSpacing: 1,
                            //                     color: Colors.black,
                            //                     fontSize: 12.5.sp
                            //                   ),
                            //         ),
                            //       ],
                            //     )),
                                Divider(thickness: 1,),
                                 SizedBox(height: 20,),
                                 Row(mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.lock_sharp),
                                   ],
                                 ),
                                 SizedBox(height: 10,),
                                 Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Container(
                                              width: 60.w,
                                               child: Text('All in-app purchases are covered by Buyer Protection.',
                                      textAlign: TextAlign.center,
                                        style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'Gilroy',
                                                         // letterSpacing: .5,
                                                          color: Colors.black,
                                                          fontSize: 12.sp
                                                        ),
                                        ),
                                             ),
                                  ],
                                 ),
                                  SizedBox(height: 20,),
                                payment(context),
                                  SizedBox(height: 10,),
                                 Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Container(
                                              width: 70.w,
                                               child: Text('This Payment will be processed by PayPal',
                                      textAlign: TextAlign.center,
                                        style: TextStyle(
                                                    decoration: TextDecoration.none,
                                                          fontWeight: FontWeight.w400,
                                                          fontFamily: 'Gilroy',
                                                          letterSpacing: .5,
                                                          color: Color.fromARGB(255, 73, 73, 73),
                                                          fontSize: 10.sp
                                                        ),
                                        ),
                                             ),
                                  ],
                                 ),
                                 SizedBox(height: 10.h,),
                             ],
                         ),
                        ),
                      ),
                    ],
                  );
                }else{
                  return Container();
                }
        }
   } )
           );
         
  }
     Widget  payment(BuildContext context){
      final checkout= ref.watch(checkoutProvider);
               return  InkWell(
                             onTap: (){
                               checkout.product=checkoutSummaryModle!.cartSummary[0].product;
                              checkout.grandtotal=checkoutSummaryModle!.cartSummary[0].grandTotal.toString();
                               checkout.sellername=checkoutSummaryModle!.cartSummary[0].grandTotal.toString();
                                checkout.buyername=checkoutSummaryModle!.cartSummary[0].buyerAddress[0].name.toString();
                                checkout.street=checkoutSummaryModle!.cartSummary[0].buyerAddress[0].address.toString();
                                checkout.country=checkoutSummaryModle!.cartSummary[0].buyerAddress[0].country.toString();
                                 checkout.pincode=checkoutSummaryModle!.cartSummary[0].buyerAddress[0].postalCode.toString();
                                checkout.state=checkoutSummaryModle!.cartSummary[0].buyerAddress[0].city.toString();
                                 checkout.phonenumber=checkoutSummaryModle!.cartSummary[0].buyerAddress[0].phone.toString();
                        //        Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //      PaypalPayment(
                        //       onFinish: (number) async {

                        //         // payment done
                        //         print('order id: '+number);

                        //       },
                        //     ),
                        //   ),
                        // );
                            Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => PaypalPayment(
                              onFinish: (number) async {

                                // payment done
                               // print('order id: ${1} ');

                              },
                            ),
                       // MakePayment()
     
                      ),
                    );
                                     },
                           child: Container(
                             margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                             width:100.w,
                              height: 50,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadiusDirectional.circular(5),
                                color: Color(0xff591B4C)
                              ),
                           child: Center(child: Text('Pay With PayPal',
                             style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.w600,
                             fontFamily: "Gilroy",
                              fontSize: 15
                              ),
                             )),
                           ),
                          );
               }
 Widget title(){
    return  Row(
                     children: [
                       Container(
                         margin: EdgeInsets.all(10),
                         width: 90.w,
                         child: RichText(
                         text: TextSpan(
                         text: '',
                         style: DefaultTextStyle.of(context).style,
                         
                          children:  <TextSpan>[
                             TextSpan(text: checkoutSummaryModle!.cartSummary[0].product.length.toString(),
                                  // '#casinochip #chipcollection #caesarspalace',\
                                 // textAlign: T,
                                 
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Gilroy',
                                            letterSpacing: 1,
                                            color: Colors.black,
                                            fontSize: 13.sp
                                          ),
                                   ),
                          TextSpan(text: '  item from ',
                                  // '#casinochip #chipcollection #caesarspalace',\
                                 // textAlign: T,
                                    style: TextStyle(
                                         decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Gilroy',
                                            color: Color.fromARGB(255, 96, 95, 95),
                                            letterSpacing: 1,
                                            fontSize: 11.sp
                                          ),
                                   ),
                            TextSpan(text:  ref.read(cartProvider).sellername,
                            style: TextStyle(
                                         decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w500,
                                             color: Colors.black,
                                            fontFamily: 'Gilroy',
                                            letterSpacing: 1,
                                            fontSize: 11.sp
                                          ),
                            ),
                          ],
                         ),
                          ),
                       ),
                     ],
                   );
  }
  Widget produtlist(int index){              
           return 
     Container(
    margin: EdgeInsets.all(10),
   // height: 100,
    width: double.infinity,
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
    child: Row( crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(6),
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
                         width: 100,
                       child: CachedNetworkImage(
                              imageUrl:checkoutSummaryModle!.cartSummary[0].product[index].thumbnailImg,
                               height: 100,
                                         width: 10,
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
                                      fit: BoxFit.cover,      
                                              ),
                                            ),
                                      ),
                                     
                                          ],
                                        ),
                           
                                     progressIndicatorBuilder: (context, url, downloadProgress) => 
                                     Container(
                                         height: 100,
                                         width: 100,
                                       child: Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
                                    errorWidget: (context, url, error) => 
                                   // Icon(Icons.error)
                                     Container(
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(11),
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
                                        height: 100,
                                       //  width: 20,
                                         child: Icon(Icons.error),
                                       //child: Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.fill,)
                                       ),
                                       ),
                                                       ),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                       SizedBox(height: 20,),
                                             Container(
                                        width: 50.w,
                                          child: Text(checkoutSummaryModle!.cartSummary[0].product[index].name,
                                        overflow: TextOverflow.ellipsis,
                                             style: TextStyle(
                                      decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Gilroy',
                                            letterSpacing: 1,
                                            color: Colors.black,
                                            fontSize: 11.sp
                                          ),
                                              )),
                                              
                                               SizedBox(height: 10,),
                                                Text(' \$${checkoutSummaryModle!.cartSummary[0].product[index].unitPrice}.00 ',
                                        overflow: TextOverflow.ellipsis,
                                                   style: TextStyle(
                                      decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Gilroy',
                                            letterSpacing: 1,
                                            color: Colors.black,
                                            fontSize: 11.sp
                                          ),
                                                    ),
                                          ],
                                       ),
                                ],
                              ),
                             ],
                          ),
                     );
                // }else{
                //   return Container();
                // }
              // }
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
      title: Text("Checkout",
       style: TextStyle(
        fontWeight: FontWeight.w600,
         fontFamily: "Gilroy",
    fontSize: 15.6.sp,
        color: Color(0xff591B4C)
      ),),
      actions: [
        
      ],
      elevation: 1,
    );
  }
}