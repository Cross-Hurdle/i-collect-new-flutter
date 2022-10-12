import 'package:icollekt/Exports/Exports.dart';

class MainRoute extends StatefulWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
     bool isLoading = false;
   GoogleAuth googleAuth = GoogleAuth();
   FBAuth fbAuth =FBAuth();
  onPressed({@required String? function}) {
    Widget? routeNavigation;

    if (function == "Google") {
    } else if (function == "Facebook") {
    } else if (function == "SignUp") {
      routeNavigation = SignUpUsername();
      //SignUpMobileNumber();
     // SignUpEmail();
    } else if (function == "SignIn") {
      routeNavigation =
    //  Signin();
       SignInUsername();
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => routeNavigation!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Container(
        child: Column(
          children: [
            iCollektImage(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    continueWithGoogle(),
                    SizedBox(height: 15),
                    continueWithFacebook(),
                    SizedBox(height: 15),
                    signUp(),
                    SizedBox(height: 25),
                    alreadyHaveAccount(),
                    SizedBox(height: 10),
                    termsANDconditions(),
                    BottomContainer(),

                    //SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container iCollektImage() {
    return Container(
      //color: Colors.yellow,
      height: 40.h,
      width: 100.w,
      alignment: Alignment.center,
      child: Image.asset(
        "Assets/Images/Icollekt.png",
        height: 20.h,
      ),
    );
  }

  Widget continueWithGoogle() {
  //     bool isLoading = false;

  // bool _keepLogin = false;
    return MaterialButton(
           onPressed: () async{
 setState(() => isLoading = true);

                            try {
                              await googleAuth.signInwithGoogle(
                                context: context,
                              );
 //preferences.setBool("Login", false);
                              // if (_keepLogin) {
                              // else {
                              //  preferences.setBool("Login", false);
                              // }
                            } catch (e) {
                              setState(() => isLoading = false);
                            }     
                           
              
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Container(
          width: 60.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "Assets/Images/Google.png",
                height: 14.sp,
              ),
              Text(
                'Continue with Google',
                style: TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  letterSpacing: .5,
                ),
              ),
            ],
          ),
        ),
      ),
      minWidth: 100.w,
      elevation: 5,
      color: kBackground,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
      ),
    );
  }

  Widget continueWithFacebook() {
   
    return MaterialButton(
      onPressed: () async{
 setState(() => isLoading = true);

                            try {
                              await fbAuth.signInwithfacebook(
                                context: context,
                              );

                              // if (_keepLogin) {
                              //   sharedPreferences.setBool("Login", true);
                                
                              // } else {
                              //   sharedPreferences.setBool("Login", false);
                              // }
                            } catch (e) {
                              setState(() => isLoading = false);
                            }     
                           
              
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          'Continue with FaceBook',
          style: TextStyle(
            color: kBackground,
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            letterSpacing: .5,
          ),
        ),
      ),
      minWidth: 100.w,
      elevation: 5,
      color: kFacebook,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(1000.0)),
      ),
    );
  }

  Widget signUp() {
    return MaterialButton(
      onPressed: () => onPressed(function: "SignUp"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Text(
          'Sign Up',
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
    );
  }

  Widget alreadyHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
            color: kGoldText,
            fontSize: 12.sp,
            letterSpacing: 1,
          ),
        ),
        SizedBox(width: 8),
        TextButton(
          onPressed: ()=>onPressed(function: "SignIn"),
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 12.sp,
              letterSpacing: 1,
              color: kGoldText,
              decoration: TextDecoration.underline,
              decorationThickness: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget termsANDconditions() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Text.rich(
        TextSpan(
          text: 'By continuing you agree to our ',
          style: TextStyle(
            fontSize: 9.sp,
            color: kGoldText,
            letterSpacing: 1,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                fontSize: 9.sp,
                color: kGoldText,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            TextSpan(
              text: '\nicollekt services are subject to our Privacy Policy',
              style: TextStyle(
                fontSize: 9.sp,
                color: kGoldText,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
