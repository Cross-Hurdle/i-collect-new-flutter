import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/upload/ParcelInfo.dart';
import 'package:icollekt/Services/Provider.dart';

class ProductInfo extends ConsumerStatefulWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductInfoState();
}

class _ProductInfoState extends ConsumerState<ProductInfo> {
  TextEditingController  _textcontroller1= TextEditingController();
   TextEditingController  _textcontroller2= TextEditingController();
  validation(){
     if ( _textcontroller1.text.isEmpty) {
      showToast('Enter the Product Name',
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
         print('hiiname');
       showToast('Enter the Product Name',
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
    }else if ( _textcontroller2.text.isEmpty) {
      showToast('Enter the Description',
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
      print('hii55');
    }else if (  _textcontroller2.text.contains(RegExp(r'[a-z]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false) {
        showToast('Enter the Description',
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
               pushNewScreen(
          context,
          screen:ParcelInfo(),
          //AddImage(),
          //ProductInfo(),
          // SellerAddress() ,
          withNavBar:false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final info= ref.watch(productupload);
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
                       child: Text('Product Name',
                       textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w500,
               fontSize: 14.sp,
               fontFamily: 'Gilroy'
             ),
             ),
                     ),
                     ],
                   ),
                 ),
                 textField(),
                   SizedBox(height: 1.h,),
                  description()
                // CustomButton(title: 'Showcase only', ontapped:()=> ForSale()),
                //  CustomButton(title: 'For sale', ontapped:()=> ForSale()),
                //   CustomButton(title: 'Make an offer', ontapped:()=> ForSale())
               ],
             ),
           ),
         ),
         InkWell(
             onTap: (){
               info.productname=_textcontroller1.text;
               info.description=_textcontroller2.text;
               validation();
      //           pushNewScreen(
      //     context,
      //     screen:SellerAddress() ,
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
         // CusomButton(title: 'Next', ontapped:()=> SellerAddress(),nav: false,),
                  SizedBox(height: 50,)
       ],
     ),
    );
    
  }
   Widget description(){
   
    return Container(
       margin: EdgeInsets.only(left: 10,top: 20,right: 8.sp),
         height: 35.h,
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
         keyboardType: TextInputType.multiline,
  maxLines: 10,
  
        controller:  _textcontroller2,
        decoration: InputDecoration(
          
          border: InputBorder.none,
          hintText: ' Description',
          hintStyle: TextStyle(
            color: Color(0xffABB4BD),
            fontFamily: 'Gilroy',
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
        //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
        
      )),
    );
  }
  Widget textField(){
    
    return Container(
     margin: EdgeInsets.only(left: 10,top: 10,right: 8.sp),
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
        controller: _textcontroller1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: ' Product Name',
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
      title: Text('Product Info',
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