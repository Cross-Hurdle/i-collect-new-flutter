import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

import '../Profile/Service/ProfileRepositoryService.dart';


class SellerAddress extends ConsumerStatefulWidget {
  const SellerAddress({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerAddressState();
}

class _SellerAddressState extends ConsumerState<SellerAddress> {
TextEditingController _textcontroller1= TextEditingController();
TextEditingController _textcontroller2= TextEditingController();
TextEditingController _textcontroller3= TextEditingController();
TextEditingController textcontroller4= TextEditingController();
TextEditingController _textcontroller5= TextEditingController();
TextEditingController _textcontroller6= TextEditingController();
TextEditingController _textcontroller7= TextEditingController();

validation(){
    if ( _textcontroller1.text.isEmpty) {
      showToast('Enter the Name',
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
      print('hii');
    }else if ( _textcontroller1.text.contains(RegExp(r'[a-z]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false) {
        showToast('Enter the Name',
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
    } else if( _textcontroller2.text.isEmpty){
        showToast('Enter the Address',
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
    } else if( _textcontroller2.text.contains(RegExp(r'[a-z]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
  showToast('Enter the Address',
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
    }else if( _textcontroller3.text.isEmpty){
      showToast('Enter the Phone Number',
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
    } else if(_textcontroller3.text.contains(RegExp(r'[0-9]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
 
 showToast('Enter the Phone Number',
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
    }else if( textcontroller4.text.isEmpty){
       
 showToast('Enter the Country',
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
    } else if( textcontroller4.text.contains(RegExp(r'[a-z]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
 showToast('Enter the Country',
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
    }else if( _textcontroller7.text.isEmpty){
        showToast('Enter the City',
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
    } else if( _textcontroller7.text.contains(RegExp(r'[a-z]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
  showToast('Enter the City',
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
    }else if( _textcontroller5.text.isEmpty){
      showToast('Enter the State',
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
    } else if(_textcontroller5.text.contains(RegExp(r'[a-z]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
  showToast('Enter the State',
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
    }else if( _textcontroller6.text.isEmpty){
       print('hii13');
        showToast('Enter the ZipCode',
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
    } else if(_textcontroller6.text.contains(RegExp(r'^-?[1 -9]+$',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
  showToast('Enter the ZipCode',
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
    }else{
      addEasyPostaddress();
     // addaddress();
     
      //   pushNewScreen(
      //     context,
      //     screen:Success() ,
      //     withNavBar:false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
    }
}
addaddress(String adress_id) async {
    final  addaddressResponse = await ProfileRepository().getaddress(
       address: _textcontroller2.text,
      city: _textcontroller7.text,
      country:textcontroller4.text,
      adrid: adress_id,
      //'U.s', :_textcontroller4.text ,
      state:_textcontroller5.text ,
      phone:_textcontroller3.text ,
      postalcode: _textcontroller6.text,
      name:_textcontroller1.text ,
      );
     print(addaddressResponse["user_id"]);
      Navigator.pop(context);     
      
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
 addEasyPostaddress() async {
 try {
    final  addPostaddressResponse = await ProfileRepository().getEasypostaddress(
      address: _textcontroller2.text,
      city: _textcontroller7.text,
      country:textcontroller4.text,
      //'U.s', :_textcontroller4.text ,
      state:_textcontroller5.text ,
      phone:_textcontroller3.text ,
      postalcode: _textcontroller6.text,
      name:_textcontroller1.text ,
   
      );
       print(addPostaddressResponse["id"]);
       print(addPostaddressResponse["verifications"]['zip4']['success']);
       if (addPostaddressResponse["verifications"]['zip4']['success']==true) {
        addaddress(addPostaddressResponse["id"]);
       //  Navigator.pop(context);   
       } else {
        showToast('Invaid Address',
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
 } catch (e) {
  showToast('Invaid Address',
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
 print('e');
 }
   
     // print(addPostaddressResponse)
    
    //  Navigator.pop(context);     
      
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: topappbar(context),
     // backgroundColor: Colors.red,
     body: Column(
       children: [
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top:38.0,bottom: 20,left: 20),
                   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                     Container(
                      // width: 100.w,
                       child: Text(' Name',
                       textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
               fontFamily: 'Gilroy'
             ),
             ),
                     ),
                     ],
                   ),
                 ),
                 textField( _textcontroller1,'Name',TextInputType.name),
                 Padding(
                   padding: const EdgeInsets.only(top:18.0,bottom: 20,left: 20),
                   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                     Container(
                      // width: 100.w,
                       child: Text(' Address',
                       textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
               fontFamily: 'Gilroy'
             ),
             ),
                     ),
                     ],
                   ),
                 ),
                textField( _textcontroller2,'Address',TextInputType.streetAddress),
                Padding(
                   padding: const EdgeInsets.only(top:18.0,bottom: 20,left: 20),
                   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                     Container(
                      // width: 100.w,
                       child: Text(' Phone',
                       textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
               fontFamily: 'Gilroy'
             ),
             ),
                     ),
                     ],
                   ),
                 ),
                 textField( _textcontroller3,'Phone',TextInputType.phone),
                  Padding(
                   padding: const EdgeInsets.only(top:18.0,bottom: 20,left: 20),
                   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                     Container(
                      // width: 100.w,
                       child: Text(' Country',
                       textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
               fontSize: 13.sp,
               fontFamily: 'Gilroy'
             ),
             ),
                     ),
                     ],
                   ),
                 ),
                  textField( textcontroller4,'Country',TextInputType.text),
               SizedBox(height: 10,),  
                Padding(
                   padding: const EdgeInsets.only(top:18.0,bottom: 20,left: 20),
                   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                     Container(
                      // width: 100.w,
                       child: Text(' City',
                       textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
               fontSize: 13.sp,
               fontFamily: 'Gilroy'
             ),
             ),
                     ),
                     ],
                   ),
                 ),
                  textField( _textcontroller7,'City',TextInputType.text),
               SizedBox(height: 10,), 
            Row(
              children: [
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Text(' State',
                         textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
               fontSize: 13.sp,
               fontFamily: 'Gilroy'
             ),
             ),
                    ),
                    textField5(_textcontroller5,'State',TextInputType.text),
                  ],
                )),
                 Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                      Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Text(' Zip Code',
                         textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
               fontSize: 13.sp,
               fontFamily: 'Gilroy'
             ),
             ),
                    ),
                    textField5(_textcontroller6,'Zip Code',TextInputType.number),
                   ],
                 )),
              ],
            ),
              SizedBox(height: 50,)   
               ],
             ),
           ),
         ),
           InkWell(
             onTap: (){
              //  addressinfo.name=_textcontroller1.text;
              //  addressinfo.address=_textcontroller2.text;
              //  addressinfo.phoneNumber=_textcontroller3.text;
              //  addressinfo.country=_textcontroller4.text;
              //  addressinfo.state=_textcontroller5.text;
              //  addressinfo.zipcode=_textcontroller6.text;
               validation();
            //  addaddress();
      //           pushNewScreen(
      //     context,
      //     screen:AddImage() ,
      //     withNavBar:false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
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
              child: Center(child: Text('Next',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          ),
         //   CustomButton(title: 'Next', ontapped:()=> AddImage(),nav: false,),
            SizedBox(height: 50,)
       
       ],
     ),
    );
    
  }
  Widget textField(TextEditingController _controller, String placeholder ,TextInputType type){
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
          // width: 51.w,
           height: 15.w,
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
      child: TextField(
        controller: _controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: ' $placeholder',
          hintStyle: TextStyle(
            color: Color(0xffABB4BD),
            fontFamily: 'Gilroy',
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
        
      )));
  }
  
   Widget textField5(TextEditingController _controller, String placeholder,TextInputType type){
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
          // width: 51.w,
           height: 15.w,
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
      child: TextField(
        controller: _controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: ' $placeholder',
          hintStyle: TextStyle(
            color: Color(0xffABB4BD),
            fontFamily: 'Gilroy',
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
        
      )));
  }
   
 AppBar topappbar(context){
    return AppBar(
      title: Text('Add Address',
      style: TextStyle(
        color: Color(0xff1A1A1A),
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        fontFamily: 'Gilroy'
      ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
        leading: GestureDetector(
        onTap: (){
        Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    );
  
  }
}
