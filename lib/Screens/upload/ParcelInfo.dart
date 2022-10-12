import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

class ParcelInfo extends ConsumerStatefulWidget {
  const ParcelInfo({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ParcelInfoState();
}

class _ParcelInfoState extends ConsumerState<ParcelInfo> {
  TextEditingController  _textcontroller1= TextEditingController();
   TextEditingController  _textcontroller2= TextEditingController();
   TextEditingController  _textcontroller3= TextEditingController();
   TextEditingController  _textcontroller4= TextEditingController();
   validation(){
    if( _textcontroller1.text.isEmpty){
      showToast('Enter the Weight',
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
    } else if(_textcontroller1.text.contains(RegExp(r'[0-9]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
 
 showToast('Enter the Weight',
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
    }else if( _textcontroller2.text.isEmpty){
      showToast('Enter the Height',
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
    } else if(_textcontroller2.text.contains(RegExp(r'[0-9]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
 
 showToast('Enter the Height',
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
      showToast('Enter the Width',
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
 
 
 showToast('Enter the Width',
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
   else if( _textcontroller4.text.isEmpty){
      showToast('Enter the Length',
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
    } else if(_textcontroller4.text.contains(RegExp(r'[0-9]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false){
 
 
 showToast('Enter the Length',
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
    else{
      ref.read(productupload).height=_textcontroller2.text;
      ref.read(productupload).width=_textcontroller3.text;
      ref.read(productupload).length=_textcontroller4.text;
      ref.read(productupload).weight=_textcontroller1.text;
      pushNewScreen(
          context,
          screen:AddImage(),
          //AddImage() ,
          withNavBar:false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }
   }
  @override
 Widget build(BuildContext context) {
  // final info=ref.read(productupload);
   return Scaffold(
      appBar: topappbar(context),
     // backgroundColor: Colors.red,
     body: Column(
       children: [
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
               
               textField(_textcontroller1,'Weight','Parcel Weight','kilogram'),
                textField(_textcontroller2,'Height','Height','inches'),
                 textField(_textcontroller3,'Width','Width','inches'),
                  textField(_textcontroller4,'Length','Length','inches'),
                    SizedBox(height: 50,),
               ],
             ),
           ),
         ),
         
         // CusomButton(title: 'Next', ontapped:()=> SellerAddress(),nav: false,),
                  SizedBox(height: 20,),
         InkWell(
             onTap: (){
              validation();
              //  info.productname=_textcontroller1.text;
              //  info.description=_textcontroller2.text;
              //  validation();
                
            // onPressed(function: onpressedtitle);
          },
            child: Container(
           //   margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:95.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text('Continue',
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
    Widget textField(TextEditingController controller,String placeholder,String field,String size){
    
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
       //   height: 100,
          child: Row(
            children: [
              SizedBox(width: 15,),
              Text(field,style:  TextStyle(
               // color: Color(0xffABB4BD),
                fontFamily: 'Gilroy',
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),),
              Text('  ($size)  *required',style:  TextStyle(
               color: Color(0xffABB4BD),
               fontStyle: FontStyle.italic,
                fontFamily: 'Gilroy',
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),),
            ],
          )),
          SizedBox(height: 10,),
        Container(
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
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: placeholder,
              
              hintStyle: TextStyle(
                color: Color(0xffABB4BD),
                fontFamily: 'Gilroy',
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),
              contentPadding: EdgeInsets.only(left: 10,top: 18),
            
          ))),
      ],
    );
  }
 AppBar topappbar(context){
    return AppBar(
      title: Text('Parcel Details',
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