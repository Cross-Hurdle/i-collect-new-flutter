import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
// import "package:flutter_slidable/flutter_slidable.dart";
import 'package:icollekt/Screens/Home/OrderDetails/MyOrder.dart';
import 'package:icollekt/Screens/OtherProfile/otherprofilepage.dart';
import 'package:icollekt/Services/Provider.dart';
import 'Model/AddToCartListModle.dart';
import 'Provider/CartProvider.dart';
import 'SelectBuyerAddress.dart';
import 'Service/CartRepository.dart';
class Cart extends ConsumerStatefulWidget {
  final int? id;
  const Cart({ Key? key ,this.id}) : super(key: key);

  @override
   ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  List list = ['1',"2","3","4","5","6","7","8"];
  String dropdownValue = '1';
  bool edit = false;
 bool status=false;
 @override
 void initState() { 
   super.initState();
   getAddtocartProduct();
 }
  AddToCartListModle ? addToCartListModle;
 Future getAddtocartProduct()async{  
 addToCartListModle = await CartRepository().getAddTOCartProduct();
status =true;
print('object');
print(addToCartListModle!.cartData.length);
  setState(() {
    
  });
}
 Future cartDelete()async{  
final cartResponse = await CartRepository().cartDelete(
  userid:  preferences.getInt('Userid'),
  sellerid: ref.read(cartProvider).sellerid);
 print(cartResponse['message']);
  if(cartResponse['result']==true){
   
 
         showToast(cartResponse['message'],
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
         return ;
       
     }   else if(cartResponse['result']=false){
       
     }
  setState(() {
    
  });
}
 Future cartProductDelete()async{  
final cartResponse = await CartRepository().cartProductDelete(
  userid:  preferences.getInt('Userid'),
productid: ref.read(cartProvider).productid);
print('object111111111');
 print(cartResponse['message']);
  if(cartResponse['result']==true){
   
 
         showToast(cartResponse['message'],
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,   
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
         return ;
       
     }   else if(cartResponse['result']=false){
       
     }
  setState(() {
    
  });
}
var currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF9F2FF),
      appBar: buildAppBar() ,
      body:  
       CustomScrollView(
        physics:  BouncingScrollPhysics(),
        slivers: 
          [
            SliverList(delegate: SliverChildListDelegate(
              [
                SizedBox(height: 1.h,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text('My Orders', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: "Gilroy",
                 fontSize: 15.sp,
                 color: Color(0xff1A1A1A)
                   ),)
                  ],
                ),
                SizedBox(height: 1.h,),
                 CustomButton(title: 'My Orders', ontapped: ()=>MyOrder(), nav: false),
                 Divider(),
                  SizedBox(height: 1.h,),
                cart(),
              ]
            )
            ),
        ],
      ),
    );
  }

  Widget cart(){
    
       if (!status) {
                 return Container(
                    height: 50.h,
                   child: Center(child: CircularProgressIndicator())
                   );
               }else{
                if (addToCartListModle!.cartData.length!=0){         
                
   return 
   
     StreamBuilder(
       stream: getAddtocartProduct().asStream(),
       builder: (context, snapshot) {
         return ListView.builder(
                  physics:  BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:addToCartListModle!.cartData.length,
                  
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                          //                                  pushNewScreen(
                          //     context,
                          //     screen: ProfilePost(),
                          //     withNavBar: true, // OPTIONAL VALUE. True by default.
                          //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          // );
                                           },
                          child:    Container(
                          //  height: 170,
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
                                child:   Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                         Row(
                                           children: [
                                              CircleAvatar(
                                             radius: 20,
                                             backgroundColor: Colors.white,
                                            child: ClipOval(
                                            child: CachedNetworkImage(
                                            imageUrl:addToCartListModle!.cartData[index].data.profile,
                                             width: 6.h,
                                             height: 6.h,
                                             fit: BoxFit.cover,
                                             imageBuilder: (context, imageProvider) =>CircleAvatar(
                                             radius: 31.sp,
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
                                          CircularProgressIndicator(value: downloadProgress.progress),
                                         errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                                            ),
                                          ),
                                          ),
                                          SizedBox(width: 10,),
                                             Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(addToCartListModle!.cartData[index].data.name ,style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Gilroy",
                                                 fontSize: 10.6.sp,
                                                 color: Color(0xff1A1A1A)
                                                 ),),
                                                 SizedBox(height: 7,),
                                                 Text('${addToCartListModle!.cartData[index].data.product.length} items',style: TextStyle(
                                              //  fontWeight: FontWeight.w600,
                                                fontFamily: "Gilroy",
                                               //  fontSize: 15.6.sp,
                                                 color: Color(0xff1A1A1A)
                                                 ),)
                                              ],
                                             ),
                                           ],
                                         ),
                                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text('\$ ${addToCartListModle!.cartData[index].data.price}',style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Gilroy",
                                                 fontSize: 10.6.sp,
                                                 color: Color(0xff1A1A1A)
                                                 ),),
                                             Text('+ \$ 50 Shipping',style: TextStyle(
                                               // fontWeight: FontWeight.w600,
                                                fontFamily: "Gilroy",
                                               //  fontSize: 15.6.sp,
                                                 color: Color(0xff1A1A1A)
                                                 ),),
                                          ],
                                         )
                                        ],
                                      ),
                                    ),
                                    
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                       height: 180,
                                                          width: double.infinity,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ListView.builder(
                                                       scrollDirection: Axis.horizontal,
                                                        shrinkWrap: true,
                                                        itemCount: addToCartListModle!.cartData[index].data.product.length,
                                                         physics:  BouncingScrollPhysics(),
                                                        itemBuilder: ((context, i) {
                                                         // print(addToCartListModle!.cartData[index].data.product.length);
                                                        return Stack(
                                                          alignment: AlignmentDirectional.topEnd,
                                                          children: [
     
                                                            Container(
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
                                                             // color: Colors.red,
                                                            //  height: 180,
                                                              width: 150,
                                                                child: CachedNetworkImage(
                                                             imageUrl:addToCartListModle!.cartData[index].data.product[i].thumbnailImg,
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
                                           fit: BoxFit.cover,      
                                                   ),
                                                 ),
                                           ),
                                          
                                               ],
                                             ),
                                
                                          progressIndicatorBuilder: (context, url, downloadProgress) => 
                                          Container(
                                              height: 180,
                                              width: 150,
                                            child: Center(child: CircularProgressIndicator(value: downloadProgress.progress))),
                                         errorWidget: (context, url, error) => 
                                       //  Icon(Icons.error)
                                          Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
                                            ),
                                                            ),
                                                         edit==true?    InkWell(
                                                              onTap: (){
                                                                ref.read(cartProvider).productid=addToCartListModle!.cartData[index].data.product[i].id;
                                                              cartProductDelete();
                                                              },
                                                               child: Container(
                                                                 decoration: BoxDecoration(
                                                               borderRadius: BorderRadius.circular(50),
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
                                                                margin: EdgeInsets.only(right: 10),
                                                                child: Center(child:Icon(Icons.remove)
                                                                // IconButton(icon: Icon(Icons.remove),onPressed: (){},)
                                                                ),
                                                               // color: Colors.green,
                                                                width: 33,
                                                                height: 33
                                                                ,),
                                                             ):Container()
                                                          ],
                                                        );
                                                      })),
                                         edit==false?    Builder(
                                           builder: (context) {
                                            if (addToCartListModle!.cartData[index].data.product.length<=1) {
                                              
                                            
                                             return InkWell(
                                              onTap: (){
                                                 ref.watch(otherprofile).name=addToCartListModle!.cartData[index].data.name;
                 ref.watch(otherprofile).dp=addToCartListModle!.cartData[index].data.profile;
                 // ref.watch(otherprofile).bg=widget.name[index]['bgimg'];
                  ref.read(otherprofile).id=addToCartListModle!.cartData[index].data.id;
                                                 pushNewScreen(
                             context,
                            screen: Otherprofilepage() ,
                             withNavBar: false, // OPTIONAL VALUE. True by default.
                             pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                                              },
                                               child: Container(
                                                    height: 180,
                                                    width: 150,
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
                                                 child: Center(child: Icon(Icons.add,size: 22.sp,color: Colors.grey,)),
                                                  ),
                                             );
                                            }
                                            else{
                                              return Container();
                                            }
                                           }
                                         ):Container()
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                  
                          ),
                          // Container(
                          //  color: Colors.blue,
                          //   child: Image.asset("Assets/Images/chip 10.jpeg",fit: BoxFit.cover, ),
                          // ),
                        ),
                       edit==false?  InkWell(
                             onTap: (){
                                ref.read(cartProvider).sellerid=addToCartListModle!.cartData[index].data.id;
                                   ref.read(cartProvider).sellername=addToCartListModle!.cartData[index].data.name;
                              pushNewScreen(
                             context,
                            screen:
                             SelectBuyerAddress() ,
                             withNavBar: false, // OPTIONAL VALUE. True by default.
                             pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                                   // onPressed(function: onpressedtitle);
                                     },
                           child: Container(
                             margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                             width:100.w,
                              height: 50,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadiusDirectional.circular(5),
                                color: Color(0xff591B4C)
                              ),
                           child: Center(child: Text('Checkout',
                             style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.w600,
                             fontFamily: "Gilroy",
                              fontSize: 15
                              ),
                             )),
                           ),
                          ):
                           InkWell(
                             onTap: (){
                                ref.read(cartProvider).sellerid=addToCartListModle!.cartData[index].data.id;
                              cartDelete();
                            //   pushNewScreen(
                            //  context,
                            // screen: SelectBuyerAddress() ,
                            //  withNavBar: false, // OPTIONAL VALUE. True by default.
                            //  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            //     );
                                   // onPressed(function: onpressedtitle);
                                     },
                           child: Container(
                             margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                             width:100.w,
                              height: 50,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadiusDirectional.circular(5),
                                color: Color(0xff591B4C)
                              ),
                           child: Center(child: Text('Delete',
                             style: TextStyle(
                            color: Colors.white,
                              fontWeight: FontWeight.w600,
                             fontFamily: "Gilroy",
                              fontSize: 15
                              ),
                             )),
                           ),
                          )
                       //  CustomButton(title: 'Checkout', ontapped: ()=>SelectBuyerAddress(), nav: false),
                      ],
                    );
                  },
                );
       }
     );
                }
                else{
                  return Container(
                    height: 200,
                    child: Center(child: Text('Empty Cart',
                     style: TextStyle(
                       // color: Colors.white,
                          fontWeight: FontWeight.w600,
                         fontFamily: "Gilroy",
                          fontSize: 16
                          ),
                    )),
                  );
                }
               }
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
      title: Text("Cart",
       style: TextStyle(
        fontWeight: FontWeight.w600,
         fontFamily: "Gilroy",
    fontSize: 15.6.sp,
      color: Color(0xff591B4C)
      ),),
      actions: [
        InkWell(
          onTap: (){
          
          //  edit=true;
            if (edit) {
               edit=false;
            } else {
               edit=true;
            }
            setState(() {
              
            });
          },
          child:   Center(
            child:edit==false? Text('Edit',
             style: TextStyle(
            fontWeight: FontWeight.w600,
             fontFamily: "Gilroy",
            fontSize: 14.sp,
             color: Color(0xff591B4C)
              ),): Text('Done',
             style: TextStyle(
            fontWeight: FontWeight.w600,
             fontFamily: "Gilroy",
            fontSize: 14.sp,
             color: Color(0xff591B4C)
              ),)
          ),
        ),
        SizedBox(width: 15,)
    //     Image.asset("Assets/Images/Share.png",
    //  width: 12.w,
    //   ),
      ],
      elevation: 1,
    );
  }
}
void doNothing(BuildContext context) {}