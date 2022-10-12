import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Screens/upload/Productinfo.dart';
import '../../Exports/Exports.dart';
import '../../Services/Provider.dart';
import '../Profile/Service/ProfileRepositoryService.dart';
import 'SellerAddress.dart';
import 'package:icollekt/Model/AddressListModle.dart';

import 'SellerPaypalAccount.dart';



class AddAddress extends ConsumerStatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddAddressState();
}

class _AddAddressState extends ConsumerState<AddAddress> {

 void initState() {
   ref.read(addressProv).selected.clear();
    addaddresslist();
    super.initState();
  }
  bool feature =false;
    bool status=false;
    FocusNode focusNode =FocusNode();

  List selectionIndex = [];
    //late TabController _tabController;#
    AddressList?  addaddressResponse;
    addaddresslist() async {
    addaddressResponse = await ProfileRepository().getaddresslistResponse( );
     print(addaddressResponse!.addressList.length);
     //Navigator.pop(context); 
      addaddressResponse!.addressList.reversed.forEach(
        (element) {
         
             filteredData.add(
            element
            );

        },
        
      );
     status=true;    
      setState(() {
        
      });
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
   
   // AllGroupDataResponseModle ?  allgroupdatamodleResponse;
  List <AddressListElement>filteredData = [];
  //List selectionIndex = [];
  void filter(String? val) {
    List <AddressListElement>sample=[];


    if (val!.isNotEmpty) {

     addaddressResponse!.addressList.reversed.forEach(
        (element) {

          if (element.name.toLowerCase().contains(val)) {
            sample.add(
            element
            );
             
          } else {
            
            // print(filteredData);
          }
        },
      );
     
    } else {
      print('empty');
      addaddressResponse!.addressList.reversed.forEach(
        (element) {
         
           sample.add(
             element
            );
       
        },
      );
    }
    filteredData=sample;

     setState(() {});
    //  for (int i = 0; i < filteredData.length; i++) {
    //   selectionIndex.add(
    //     {"Index": i, "Id":filteredData[i]['Id'], "IsSelected": false},
    //   );
    // }

    // ref.read(hastagProv).selectedhastagIndex = selectionIndex;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
      final provider=ref.watch(addressProv);
    return Scaffold(
       backgroundColor: Color(0xffF9F2FF),
     appBar:buildappbar() ,
     body: RefreshIndicator(
       onRefresh: ()async{
         filteredData.clear();
       addaddresslist();
       
       },
       child: Column(
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
            screen:  SellerAddress(),
            //AddImage() ,
            withNavBar:false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
        ).then((value) {
            filteredData.clear();
          addaddresslist();
        } );
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
                // validation();
                 // imageupload.productimage=
                // TumbnaileImage();
                 if (provider.id!=0) {
              ref.watch(productupload).id=provider.id;
              print(ref.watch(productupload).id);
                                         pushNewScreen(
            context,
            screen:
            //SellerPaypalAccount(),
            ProductInfo(),
            // Success(),
            //SellerAddress(),
            //AddImage() ,
            withNavBar:false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                     ).then((value) {
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
      itemCount:filteredData.length,
      itemBuilder: ((context, index) {
        print('Address Id ${ filteredData[index].id}');
       return SellerAddressContainer(
         id: filteredData[index].id,
         address:filteredData[index].address,
         addresslist: addaddressResponse!.addressList,
         phone:filteredData[index].phone,
         state:filteredData[index].city,
         country:filteredData[index].country,
         portal:filteredData[index].postalCode,
       name: filteredData[index].name,);
    })):Container(
               
                child: Center(child: Text('No address')));
               }
  }
  // addresslist(){
  //   return
  // }
    Widget textField(){
  //  TextEditingController _searchcontroller= TextEditingController();
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
                 
               setState(() {
                 
               });
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
class SellerAddressContainer extends ConsumerStatefulWidget {
  final int id;
  final List addresslist;
  final String name;
 final String  phone;
 final String state;
 final String country;
 final String portal;
 final String address;
  const SellerAddressContainer({Key? key, required this.addresslist,
  required this.id,
    required this.name,
    required this.phone,
    required this.state,
    required this.country,
    required this.address,
    required this.portal,}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerAddressContainerState();
}

class _SellerAddressContainerState extends ConsumerState<SellerAddressContainer> {
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

