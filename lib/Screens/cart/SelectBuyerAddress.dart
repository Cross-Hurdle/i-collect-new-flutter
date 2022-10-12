import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Model/AddressListModle.dart';
import 'package:icollekt/Services/Provider.dart';
import '../../Exports/Exports.dart';
import '../Profile/Service/ProfileRepositoryService.dart';
import 'AddAddress.dart';
import 'Checkout.dart';
import 'Provider/CartProvider.dart';

class SelectBuyerAddress extends ConsumerStatefulWidget {
  const SelectBuyerAddress({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectBuyerAddressState();
}

class _SelectBuyerAddressState extends ConsumerState<SelectBuyerAddress> {

 void initState() {
    addaddresslist();
   // getallgroupdata();
    //focusNode.requestFocus();
    //_tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  bool feature =false;
    bool status=false;
    FocusNode focusNode =FocusNode();
     List filteredData = [];
    List filteredData1=[];
  List selectionIndex = [];
    //late TabController _tabController;#
    AddressList?  addaddressResponse;
    addaddresslist() async {
    addaddressResponse = await ProfileRepository().getaddresslistResponse( );
     print(addaddressResponse!.addressList.length);
     //Navigator.pop(context); 
     status=true;    
      setState(() {
        
      });
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
   // AllGroupDataResponseModle ?  allgroupdatamodleResponse;
void filter(String? val) {
    List sample=[];
    List sample2=[];


    if (val!.isNotEmpty) {
    // ref.watch(getAllTimeCollectionNotifier).when(
    //        initial: (){
    //                     return Container(
    //                 height: 50.h,
    //                child: Center(child: CircularProgressIndicator()));
    //        }, 
    //        loading: (){
    //               return Container(
    //                 height: 50.h,
    //                child: Center(child: CircularProgressIndicator()));
    //        }, error: (){
    //          return
    //       Container(
    //           height: 50.h,
    //           child: Center(child: Text('No ALLTime Collection')));
    //        },
    //        nodata: (){
    //          return
    //          Container(
    //           height: 50.h,
    //           child: Center(child: Text('No ALLTime Collection')));
    //        },
    //         data: (data){
    //           data.alltime.reversed.forEach(
    //     (element) {
          
    //       if (element.name.toLowerCase().contains(val)) {
    //            feature=true;
    //            // _tabController = TabController(length: 2, vsync: this);
    //         sample2.add(
    //           {
    //          "Id": element.id,
    //         "name": element.name,
    //         // "image":  element.orgImg,
    //         // "message":element.description
           
    //           },
    //         );
             
    //       } else {
    //         // print(filteredData);
    //       }
    //     },
    //   );
    //         //  return
    //         //     Container(child: SearchBar(name:data.alltime))
             
    
    //        });
       addaddressResponse!.addressList.reversed.forEach(
        (element) {
          
          if (element.address.toLowerCase().contains(val)) {
               feature=true;
               // _tabController = TabController(length: 2, vsync: this);
            sample.add(
              {
             "Id": element.id,
            "address": element.address,
            // "image":  element.groupImage,
            // "message":element.message
           
              },
            );
             
          } else {
            // print(filteredData);
          }
        },
      );
     
    } else {
      feature=false;
      print('empty');
      //  allgroupdatamodleResponse!.finalData.reversed.forEach(
      //   (element) {
         
      //      sample.add(
      //         {
              
      //         "Id": element.id,
      //       "name": element.subject,
      //       "image":  element.groupImage,
      //       "message":element.message
           
      //         },
      //       );
       
      //   },
      // );
    }
     filteredData1=sample2;
    filteredData=sample;
    // filteredData.reversed;
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
     final prov=ref.read(cartProvider);
     final adressprov=ref.read(addressProv);
    return Scaffold(
       backgroundColor: Color(0xffF9F2FF),
     appBar:buildappbar() ,
     body: Column(
       children: [
         Expanded(
           child: SingleChildScrollView(
           child: Column(
             children: [
             textField(),
             Column(
               children: [
                  InkWell(
             onTap: (){
              // validation();
             // imageupload.productimage=
              // TumbnaileImage();
              pushNewScreen(
          context,
          screen: BuyerAddress(),
          //AddImage() ,
          withNavBar:false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:95.w,
              height: 50,
              decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(5),
              color: Color(0xff591B4C)
              ),
              child: Center(child: Text('Add New Address',
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: "Gilroy",
              fontSize: 16
              ),
              )),
            ),
          ),
            address()
        
               ],
             )
             ],
           ),)),
           InkWell(
             onTap: (){
                if (adressprov.id!=0) {
                    prov.addressid=adressprov.id;
            //  ref.watch(productupload).id=provider.id;
              print(ref.watch(productupload).id);
                            Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Checkout(),)).then((value) {
            filteredData.clear();
          addaddresslist();
        } );
        
                        }else{
                          showToast('Select least one Address',
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
                        }
           
      //           Navigator.of(context).push(
      //                 MaterialPageRoute(
      //                   builder: (BuildContext context) => Checkout(),
      // //                   UsePaypal(
      // //                       sandboxMode: true,
      // //                       clientId:
      // //                           "AUU8IiB0De8c41cDCr5YPhHzc0eydU77wxpjoJSbRPJM6wzwkZ6Fg7UYlMmr5Gm_kgFUlsqomP3pT_P6",
      // //                       secretKey:
      // //                           "EN8-rCwj6XCZjtrj20C96Qt5BN6hvQFfiMGG2xdVacweGyRjFUddV2ddux_oCxEGAphTY0gouCaTuRTv",
      // //                       returnURL: "https://samplesite.com/return",
      // //                       cancelURL: "https://samplesite.com/cancel",
      // //                       transactions: const [
      // //                         {
      // //                           "amount": {
      // //                             "total": '10.12',
      // //                             "currency": "USD",
      // //                             "details": {
      // //                               "subtotal": '10.12',
      // //                               "shipping": '0',
      // //                               "shipping_discount": 0
      // //                             }
      // //                           },
      // //                           "description":
      // //                               "The payment transaction description.",
      // //                           // "payment_options": {
      // //                           //   "allowed_payment_method":
      // //                           //       "INSTANT_FUNDING_SOURCE"
      // //                           // },
      // //                           "item_list": {
      // //                             "items": [
      // //                               {
      // //                                 "name": "A demo product",
      // //                                 "quantity": 1,
      // //                                 "price": '10.12',
      // //                                 "currency": "USD"
      // //                               }
      // //                             ],

      // //                             // shipping address is not required though
      // //                             "shipping_address": {
      // //                               "recipient_name": "Jane Foster",
      // //                               "line1": "Travis County",
      // //                               "line2": "",
      // //                               "city": "Austin",
      // //                               "country_code": "US",
      // //                               "postal_code": "73301",
      // //                               "phone": "+00000000",
      // //                               "state": "Texas"
      // //                             },
      // //                           }
      // //                         }
      // //                       ],
      // //                       note: "Contact us for any questions on your order.",
      // //                       onSuccess: (Map params) async {
      // //                          pushNewScreen(
      // //     context,
      // //     screen: Success(),
      // //     //SellerAddress(),
      // //     //AddImage() ,
      // //     withNavBar:false, // OPTIONAL VALUE. True by default.
      // //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // // );
      // //                         print("onSuccess: $params");
      // //                       },
      // //                       onError: (error) {
      // //                         print("onError: $error");
      // //                       },
      // //                       onCancel: (params) {
      // //                         print('cancelled: $params');
      // //                       }),
      //                 ),
              //      );
              // validation();
               // imageupload.productimage=
              // TumbnaileImage();
               
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:95.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text('Confirm',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          ),
       ],
     ),
    );
  }
  address(){
       if (!status) {
                 return Container(
                    height: 50.h,
                   child: Center(child: CircularProgressIndicator()));
               }else{   return 
          addaddressResponse!.addressList.isNotEmpty?   ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount:addaddressResponse!.addressList.length,
      itemBuilder: ((context, index) {
       return AddressContainer(
         address: addaddressResponse!.addressList[index].address,
         addresslist: addaddressResponse!.addressList,
         phone:addaddressResponse!.addressList[index].phone,
         state:addaddressResponse!.addressList[index].city,
         country:addaddressResponse!.addressList[index].country,
         portal:addaddressResponse!.addressList[index].postalCode,
       name: addaddressResponse!.addressList[index].name,
        id: addaddressResponse!.addressList[index].id,);
    })):Container(
               
                child: Center(child: Text('No address')));
               }
  }
  // addresslist(){
  //   return
  // }
    Widget textField(){
   // TextEditingController _searchcontroller= TextEditingController();
    return GestureDetector(
      onTap: (){
        
    // pushNewScreen(
    //       context,
    //       screen:SearchScreen(),
    //       withNavBar: true, // OPTIONAL VALUE. True by default.
    //       pageTransitionAnimation: PageTransitionAnimation.fade,
    //   );
      },
      child: Container(
        //  margin: EdgeInsets.symmetric(horizontal: 20),
         width: double.infinity,
         height: 90,
         
         decoration: BoxDecoration(
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
        child: Container(
           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            // width: 51.w,
             height: 14.w,
            decoration: BoxDecoration(
             // borderRadius: BorderRadius.circular(9),
              color: Color(0xffFAF7F7),
              
            ),
            // child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text('Search',style: TextStyle(
            //         color: Colors.white,
            //        fontSize: 14.sp
            //       ),),
            //     ),
            //     Image.asset("Assets/Images/searchright.png",
            //     ),
            //   ],
            // ),
          child: TextField(
           // controller: _searchcontroller,
             focusNode: focusNode,
              onChanged: (text) {
                 
               
              text = text.toLowerCase();
              filter(text);

            },
            decoration: InputDecoration(
              
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp
              ),
              contentPadding: EdgeInsets.only(left: 10,top: 18),
              suffixIcon:  Image.asset("Assets/Images/searchright.png",
            ),
          )),
        )),
    );
  }
  buildappbar(){
    return AppBar(
       leading: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(height: 10,),
           GestureDetector(
            onTap: (){
             Navigator.pop(context);
            // prov.selected.clear();
            //  prov.selected.clear();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
         ],
       ),
      backgroundColor: kBackground,

      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      // actions: [
      //   GestureDetector(
      //     onTap: (){
      //        pushNewScreen(
      //     context,
      //     screen: Cart() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
      //     },
      //     child: SvgPicture.asset("Assets/Images/shop.svg",
      //        width: 7.w,
      //         ),
      
        
      //   ),
      //   SizedBox(width: 2.w,)
      // ],
      elevation: 0,
    );
  }
}

class AddressContainer extends ConsumerStatefulWidget {
  final int id;
  final List addresslist;
  final String name;
 final String  phone;
 final String state;
 final String country;
 final String portal;
 final String address;
  const AddressContainer({Key? key, required this.addresslist,
  required this.id,
    required this.name,
    required this.phone,
    required this.state,
    required this.country,
    required this.address,
    required this.portal,}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddressContainerState();
}

class _AddressContainerState extends ConsumerState<AddressContainer> {
  addressdelete(var addressid) async {
    final addressResponse = await ProfileRepository().getaddressdelete(addressid);
    // print(addaddressResponse!.addressList.length);
     //Navigator.pop(context); 
     print(addressid);
     setState(() {
       
     });
      print(addressResponse['message']);
        print(addressResponse['status']);
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
 bool select = false;
  onSelect(AddressData prov) {

  if (prov.selected.contains(widget.id)) {
    prov.selected.remove(widget.id);
   
  } else {
    if (prov.selected.length<1) {
       prov.selected.add(widget.id);
        select=true;
          print(select);
    }else{
       select=false;
       print(select);
  //      if (prov.selected.contains(widget.id)) {
  //   prov.selected.remove(widget.id);
  // }
       // prov.selected.remove(widget.id);
        setState(() {
          
        });
      // if (widget.id!=widget.id) {
      //   prov.selected.remove(widget.id);
      // }
     //  prov.selected.remove(widget.id);
    //   print('no');
        showToast('max one Address',
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
    }
    
  }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final provider=ref.watch(addressProv);
    return  GestureDetector(
         onTap: (){
          provider.selectaddress(widget.id);
           //  onSelect(provider);
        print(provider.id);
        //  selectedItem = !selectedItem;
        //  widget.selectedItem(selectedItem);
      
         },
         child: Builder(
           builder: (context) {
               if (provider.id==widget.id){
             // provider.selected.add(isSelected);
              return  Container(
                 margin: EdgeInsets.all(10),
                 decoration: BoxDecoration(
          color: Colors.white,
                borderRadius: BorderRadius.circular(10),
          
           border: Border.all(
                  color:Color(0xff591B4C),
                  width: 1.5,
                ),
                
           boxShadow: [
      // BoxShadow(
      //   color: Colors.black12,
      //   spreadRadius: 1,
      //   blurRadius: 5,
      //   offset: Offset(2, 2), // changes position of shadow
      // ),
        ],
        ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   //
                   Row(
                     children: [
                       SizedBox(width: 20,),
                       Container(
                       //  color: Colors.green,
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                              SizedBox(height: 20,),
                             Row(
                               children: [
                                 Container(
                                   child: Text(widget.name,
                                   style: TextStyle(fontFamily: 'Gilroy',
                                   fontSize: 18,
                                   fontWeight: FontWeight.w600,color: Color(0xff3C3C3C)),
                                   ),
                                 ),
                                 SizedBox(),
                               
                               ],
                             ),
                              SizedBox(height: 20,),
                               Container(
                                  width:70.w,
                                 child: Text('${widget.address},${widget.state} ${widget.country}.${widget.portal}',
                                 style: TextStyle(fontFamily: 'Gilroy',
                            // fontSize: 18,
                             fontWeight: FontWeight.w400,color: Color(0xff3C3C3C)),
                                 ),
                               ),
                                SizedBox(height: 10,),
                                 Text('Phone: ${widget.phone}',
                                 style: TextStyle(fontFamily: 'Gilroy',
                            // fontSize: 18,
                             fontWeight: FontWeight.w400,color: Color(0xff3C3C3C)),
                                 ),
                                SizedBox(height: 20,),
                           ],
                         ),
                       ),
                     ],
                   ),
                  //  Column(mainAxisAlignment: MainAxisAlignment.start,
                  //    children: [
                  //        InkWell(
                  //          onTap: (){

                  //          },
                  //          child: Container(
                  //            margin: EdgeInsets.only(top: 20,right: 10),
                  //          //  alignment: AlignmentDirectional.topEnd,
                  //            //color: Colors.red,
                  //            child: Icon(Icons.delete)),
                  //        )
                  //    ],
                  //  )
                 ],
               ),
              );}
            else
             return Container(
               margin: EdgeInsets.all(10),
              //  width:100,
              // height: 200,
               decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
               ),
               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       SizedBox(width: 20,),
                       Column(crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            SizedBox(height: 20,),
                           Text(widget.name,
                           style: TextStyle(fontFamily: 'Gilroy',
                           fontSize: 18,
                           fontWeight: FontWeight.w600,color: Color(0xff3C3C3C)),
                           ),
                            SizedBox(height: 20,),
                             Container(
                                width:70.w,
                               child: Text('${widget.address},${widget.state} ${widget.country}.${widget.portal}',
                               style: TextStyle(fontFamily: 'Gilroy',
                          // fontSize: 18,
                           fontWeight: FontWeight.w400,color: Color(0xff3C3C3C)),
                               ),
                             ),
                              SizedBox(height: 10,),
                               Text('Phone: ${widget.phone}',
                               style: TextStyle(fontFamily: 'Gilroy',
                          // fontSize: 18,
                           fontWeight: FontWeight.w400,color: Color(0xff3C3C3C)),
                               ),
                              SizedBox(height: 20,),
                         ],
                       ),
                     ],
                   ),
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                         InkWell(
                           onTap: (){
                             print('hi');
                                addressdelete(widget.id);
                           },
                           child: Container(
                             margin: EdgeInsets.only(top: 20,right: 10),
                           //  alignment: AlignmentDirectional.topEnd,
                             //color: Colors.red,
                             child: Icon(Icons.delete)),
                         )
                     ],
                   )
                 ],
               ),
              
             );
           }
         ),
       ); 
  }
}
