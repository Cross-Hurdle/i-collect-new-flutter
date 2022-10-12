import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';

class SignUpPassword extends ConsumerStatefulWidget{
  // final String? email;
  // final String? username;
  const SignUpPassword({Key? key, }) : super(key: key);

  @override
  _SignUpPasswordState createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends ConsumerState<SignUpPassword> {
  
  TextEditingController textEditingController = new TextEditingController();
  validation(){
bool emailValid = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(textEditingController.text.toString());
  if(emailValid==false){
print('invalid');
showToast('Invalid password ',
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
     Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpMobileNumber(
              // email: widget.email,
              // username: widget.username,
              // password: textEditingController.text,
            ),
          ),
        );
    //signup(ref.watch(signupprov));
    print('valid');
  }
}
 bool status = false;
  uivalidation(String value){
    if ( value.isEmpty) {
      status =false;
    } else {
      status =true;
    }
    setState(() {
      
    });
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
            displayInfo(),
            passwordField(),
              status==true? next():Container(),
           // _buildCountryPickerDropdown(filtered: true),
            image(),
              status==false? next():Container(),
           // next(),
             BottomContainer()
          ],
        ),
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
        'Get Started',
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

  Widget displayInfo() {
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
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              'Step 2 of 7',
              style: TextStyle(
                color: kGoldText,
                fontSize: 16.sp,
                letterSpacing: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Choose your password",
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
              "How will you guard your treasure? 8 characters, one symbol  or number included",
              style: TextStyle(fontSize: 10.sp, letterSpacing: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordField() {
    return Container(
     // height: 7.5.h,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        //color: Colors.red,
        border: Border.all(color: Colors.grey.shade300, width: .5),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: TextField(
           onChanged: (value){
          uivalidation(value);
        },
        obscureText: false,
        controller: textEditingController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            letterSpacing: .5,
          ),
          hintText: 'Password',
          border: InputBorder.none,
        //  prefixIcon: Container(
        //    color: Colors.red,
        //    child:   _buildCountryPickerDropdown(filtered: true),)
        ),
      ),
    );
  }

 Widget image() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          "Assets/Images/Password logo.svg",
          height: 32.h,
       //   height: 25.h,
        ),
      ),
    );
  }


 
  onPressed(SignupData passwdprovider) {
    if (textEditingController.text.isNotEmpty) {
      passwdprovider.password=textEditingController.text;
      if (textEditingController.text.length >= 8)
      validation();
       
      else
       showToast('Must be 8 or more characters',
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
      //  Fluttertoast.showToast(msg: 'Must be 8 or more characters');
    } else {
       showToast('Enter Password',
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
     // Fluttertoast.showToast(msg: 'Enter Password');
    }
  }

  Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () =>  onPressed(ref.watch(signupprov)),
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
