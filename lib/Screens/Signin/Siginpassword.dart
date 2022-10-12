import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';


class SignInPassword extends ConsumerStatefulWidget  {

  final String? username;
  const SignInPassword({Key? key, this.username}) : super(key: key);

  @override
  _SignInPasswordState createState() => _SignInPasswordState();
}

class _SignInPasswordState extends ConsumerState<SignInPassword> {
    Future getInstance() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
 @override
 void initState() { 
   super.initState();
    getInstance();
 }
   bool _keepLogin = true;
  late SharedPreferences sharedPreferences;

   onPressedLogin(Logindata provider) async {
     SignInModel  login;
       var loginresponse = await AuthRepository().getLoginResponse(
      email:provider.email!,
      //"${ widget.username}",
       password: "${textEditingController.text.toString()}");

 if(loginresponse['result']==false){
     
   login =SignInModel.fromJson(loginresponse);
   preferences.setString('Email', login.userData.email);

     preferences.setString('Name',login.userData.name);
                               preferences.setInt(
                              'Userid', login.userData.id);
       if (_keepLogin) {
        preferences.setBool("Login", true);
      } 
      
     print(login.userData);
      Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) =>   MainPage(
    id: login.userData.id,
  )),
  (Route<dynamic> route) => false,
);
//         return Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) =>  MainPage(
//     id: login.userData.id,
//   )),

// );
       
     }   else if(loginresponse['result']=true){
        // Fluttertoast.showToast(msg: loginresponse.message);
         showToast(loginresponse['message'],
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
          //  displayInfo(),
          SizedBox(height: 100,),
           textlable(),
            SizedBox(height: 20,),
            passwordField(),
            forgotpassword(),
              status==true? next():Container(),
            image(),
           status==false? next():Container(),
             BottomContainer(),

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
        'Sign In',
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



  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: .5),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: TextField(
         onChanged: (value){
          uivalidation(value);
        },
        controller: textEditingController,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            letterSpacing: .5,
          ),
          hintText: 'Password',
          border: InputBorder.none,
        ),
      ),
    );
  }
 Widget textlable(){
    return Row(
      children: [
        Container(
           margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Text("Type in your password",
          style: fonttexttheme
          
          ),
        ),
      ],
    );
  }
 Widget forgotpassword(){
    return Row(
      children: [
        Container(
           margin: const EdgeInsets.symmetric(horizontal: 15),
          child: TextButton(
            onPressed: (){
                Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotUsername(
              // email: widget.username,
              // name: widget.username,
            ),
          ),
        );
            },
            child: Text("I forgot my password",
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color(0xff786900)
            )
            
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
          "Assets/Images/Password logo.svg",
          height: 32.h,
       //   height: 25.h,
        ),
      ),
    );
  }

  TextEditingController textEditingController = new TextEditingController();


  onPressed(Logindata loginpasswdprov) {
    //  if (_keepLogin) {
    //     sharedPreferences.setBool("Login", true);
    //   } else {
    //     sharedPreferences.setBool("Login", false);
    //   }
    if (textEditingController.text.isNotEmpty) {
      if (textEditingController.text.length >= 8){
         onPressedLogin(ref.watch(loginProv));

      }
     
      
      
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

    } else {
       showToast( 'Enter Password',
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

  Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () => onPressed(ref.watch(loginProv)),
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
