import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';


class ForgotverifyOTP extends ConsumerStatefulWidget {
  // final  id;
  // final int? code;
  // final String? email;
  // final String? username;
  // final String? password;
  // final String? number;
  const ForgotverifyOTP(
      {Key? key,  })
      : super(key: key);

  @override
  _ForgotverifyOTPState createState() => _ForgotverifyOTPState();
}

class _ForgotverifyOTPState extends ConsumerState<ForgotverifyOTP> {
  TextEditingController textEditingController = new TextEditingController();
@override
 
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
 signotp(ForgotpasswordData forgotidprovider) async {
    final  signupResponse = await AuthRepository().getotp(code: textEditingController.text,id: forgotidprovider.id );
     if(signupResponse.result==false){
        showToast(signupResponse.message,
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
        //Fluttertoast.showToast(msg: signupResponse.message);

        return  Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ForgotPassword()
        ),
      );
     }   else if(signupResponse.result==true){
       showToast(signupResponse.message,
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
         //Fluttertoast.showToast(msg: signupResponse.message);
         return ;
     }
          
      
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
 resendotp(ForgotpasswordData forgotidprovider1) async {
    final  signupResponse = await AuthRepository().resendotp(id:forgotidprovider1.id,email: '${forgotidprovider1.email}',
    sendby: "email",
     );
    //  print(widget.number);
    //  print(widget.id);
     if(signupResponse.result==false){
       showToast(signupResponse.message,
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
      //  Fluttertoast.showToast(msg: signupResponse.message);

        return  ;
       
     }   else if(signupResponse.result==true){
       showToast(signupResponse.message,
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
        // Fluttertoast.showToast(msg: signupResponse.message);
         return ;
     }
          
      
  //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
  //   var userid = preferences.getInt("$user_id");
  
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackground,
      appBar: buildAppBar(),
      body: Container(
        child: Column(
          children: [
              SizedBox(height: 20,),
          displayInfo(ref.watch(forgotpasswordprov)) ,
           SizedBox(height: 20,),
            otpField(),
            reSend(),
            image(),
            next(),
             BottomContainer()
          ],
        ),
      ),
    );
  }
 Widget displayInfo(ForgotpasswordData emailprovider1) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: kBackground,
        boxShadow: [
          BoxShadow(
            color: kShadow,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Text(
              "Enter the code",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              "We've sent a 5-digit code to your Email ${emailprovider1.email}",
              style: TextStyle(fontSize: 10.sp, letterSpacing: 1.5),
            ),
          ),
        ],
      ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.keyboard_arrow_left,
          size: 30.sp,
          color: kBlack,
        ),
      ),
      centerTitle: true,
      title: Text(
        'OTP Verify',
        style: TextStyle(
          color: kBlack,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      elevation: 0,
    );
  }

  // Widget displayInfo1() {
  //   return Container(
  //     width: 100.w,
  //     margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //     decoration: BoxDecoration(
  //       color: kBackground,
  //       boxShadow: [
  //         BoxShadow(
  //           color: kShadow,
  //           blurRadius: 20,
  //           offset: Offset(0, 10),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
         
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
  //           child: Text(
  //             "Enter the code",
  //             style: TextStyle(
  //               fontSize: 14.sp,
  //               fontWeight: FontWeight.w600,
  //               letterSpacing: 1.5,
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
  //           child: Text(
  //             "We've sent a 5-digit code to your Email " ,
  //             style: TextStyle(fontSize: 10.sp, letterSpacing: 1.5),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget otpField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: .5),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: textEditingController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            letterSpacing: .5,
          ),
          hintText: 'Code',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget reSend() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't get your Code?",
          style: TextStyle(
            color: Color(0xff807210),
            fontSize: 12.sp,
            letterSpacing: 1.5,
          ),
        ),
         TextButton(
           onPressed: (){
            resendotp(ref.watch(forgotpasswordprov));
           },
           child: Text(
            "Resend code",
            style: TextStyle(
              color: Color(0xff807210),
              fontSize: 12.sp,
              letterSpacing: 1.5,
            ),
                 ),
         ),
      ],
    );
  }

  Widget image() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          "Assets/Images/code.svg",
          height: 32.h,
        ),
      ),
    );
  }

  onPressed() {
     //resendotp();
     signotp(ref.watch(forgotpasswordprov));
    if (textEditingController.text.isNotEmpty) {
      if (textEditingController.text.length == 5){

      }
       
      else
        Fluttertoast.showToast(msg: 'OTP must be 5 digits');
    } else {
      Fluttertoast.showToast(msg: 'Enter OTP');
    }
    // print(widget.email);
    // print(widget.username);
    // print(widget.password);
    // print(widget.number);
  }

  Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'Continue',
            style: TextStyle(
              color: kBackground,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
            ),
          ),
        ),
        minWidth: 100.w,
        elevation: 5,
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
        ),
      ),
    );
  }
}
