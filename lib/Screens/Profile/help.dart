import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends ConsumerStatefulWidget {
  final int? id;
  Help({Key? key,this.id}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends ConsumerState<Help> {
   TextEditingController _searchcontroller= TextEditingController();
   List list = ['What can we help you with?','Customer support ',
   'App bugs','New user help','Post creation help','WHERE is the ask button?','Password change option'];
    onPressedhelp(HelpDatapro help) async {
        if(currentSelectedValue != null){
 var reportresponsevalue = await AuthRepository().gethelp(description:_searchcontroller.text, 
    id:preferences.getInt('Userid')!.toInt(),reason:currentSelectedValue,
     );
     print('updated');
     Navigator.pop(context);
    // help.frommail=reportresponsevalue.fromMail;
    //  help.tomail=reportresponsevalue.toMail;
//      print(_searchcontroller.text);
// print(currentSelectedValue);
// print(widget.id!.toInt());
print(reportresponsevalue.result);
 showToast(reportresponsevalue.message,
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
// print(reportresponsevalue.messages);
//  if(reportresponsevalue.status==1){
 
// print('updated');
        
       
//      }  
//       else if(reportresponsevalue.status==0){

//          return ;
//      }else if(reportresponsevalue.status==-1){

//          return print('helooooooooo');
//      }

  }  else{
    //  Fluttertoast.showToast(msg: 'uploaded s',gravity: ToastGravity.CENTER);
       showToast("Please select question in drop down",
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
   


var currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: buildappbar(context),
       body: SingleChildScrollView(
         child: Column(
           children: [
             SizedBox(height: 1.h,),
           //  Text('${preferences.getInt('ID')}'),
               Container(
       margin: EdgeInsets.symmetric(vertical: 29,horizontal: 10),
            // height: 20,
             width: double.infinity,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
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
      child: 
     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Padding(
           padding:  EdgeInsets.only(left:8.0.sp,top: 5.sp,bottom: 5.sp),
           child: DropdownButton(
    
             isExpanded: false,
             icon: Container(
              // color: Colors.red,
                margin: EdgeInsets.only(left: 20.w),
               child: Icon(Icons.keyboard_arrow_down_sharp, color: Color(0xff1A1A1A), size: 25.sp)),
           //   iconSize: 28,
              elevation: 4,
              underline: Container(),
           hint: Text('Please select type', ),
            style: TextStyle(
              color: Color(0xff1A1A1A),
        fontFamily: 'Gilroy',
        fontSize: 14.sp,
        fontWeight: FontWeight.w700
           ),
           value: currentSelectedValue,
           onChanged: (newValue) {
           setState(() {
                     currentSelectedValue= newValue;
                    });
                    print(currentSelectedValue,);
  },
  items:list.map(( value) {
    return DropdownMenuItem(
            
            value: value,
            child: Text("$value",),
    );
  }).toList(),
  
),
         ),
       ],
     )
    
    ),
             Container(
               margin: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
             height: 40.h,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
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
              child: textField(),
             ),
             SizedBox(height: 4.h,),
            InkWell(
             onTap: (){
                       if(currentSelectedValue != null){
                         if(_searchcontroller.text.isNotEmpty){
 onPressedhelp(ref.watch(helpprov));
   //funcOpenMailComposer(ref.watch(helpprov));
                         }else{
                           showToast('Please enter Message',
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
 
              
  }  else{
    //  Fluttertoast.showToast(msg: 'uploaded s',gravity: ToastGravity.CENTER);
       showToast('Please select question in drop down',
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
   
     
       },
            
              //  _mailto();
              //  subject();
              // launchmail(fromemail: 'jagajagadish619@gmail.com', subject:'hello' , message: 'hiii');
            // onPressed(function: onpressedtitle);
          
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:90.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text('Submit',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          )
           ],
         ),
       ),
    );
  }
   void funcOpenMailComposer(HelpDatapro reportprovdata) async{
print(reportprovdata.tomail.toString());
    final mailtoLink = Mailto(
     to:['janasiva@gmail.com'],
      //[ reportprovdata.tomail.toString()],
     // cc: ['test12@gmail.com','test13@gmail.com'],
     
      subject: currentSelectedValue,
     
      body:  _searchcontroller.text,
    );
  await launch('$mailtoLink');
    if (await canLaunch('$mailtoLink')) {
      await launch('$mailtoLink');
    } else {
      print("No email client found");
    }
}
  AppBar buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
        leading: GestureDetector(
        onTap: (){
         Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      centerTitle: true,
      title: Text('Help',style: TextStyle(
        color: Color(0xff1A1A1A),
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700
      ),),
      // actions: [
      //   GestureDetector(
      //     onTap: (){

      //     },
      //     child: Image.asset("Assets/Images/search.png",
      //        width: 6.w,
      //         ),
      //   ),
      //   SizedBox(width: 4.w,)
      // ],
      elevation: 1,
    );
  }
  
  Widget textField(){
   
    return Container(
       margin: EdgeInsets.only(left: 10,top: 10,right: 8.sp),
        
       
      child: TextField(
         keyboardType: TextInputType.multiline,
  maxLines: 10,
        controller: _searchcontroller,
        decoration: InputDecoration(
          
          border: InputBorder.none,
          hintText: 'Message',
          hintStyle: TextStyle(
            color: Color(0xffABB4BD),
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 14.sp
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
        //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
        
      )),
    );
  }
  
}