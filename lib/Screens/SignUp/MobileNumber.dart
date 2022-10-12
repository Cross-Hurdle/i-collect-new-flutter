import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';
class SignUpMobileNumber extends ConsumerStatefulWidget{

  const SignUpMobileNumber({Key? key,})
      : super(key: key);

  @override
  _SignUpMobileNumberState createState() => _SignUpMobileNumberState();
}

class _SignUpMobileNumberState extends ConsumerState<SignUpMobileNumber> {

  List list = ['91',"61","55","86","53","45","20","33"];
 
  TextEditingController textEditingController = new TextEditingController();

 
 void initState() {
   
    super.initState();
  }
//    signup() async {
//     final  signupResponse = await AuthRepository().getsignupResponse(
//   name:"${widget.username}",
//   password: "${widget.password}",
//   email: "${widget.email}",
//   phone: "+${ _selectedDialogCountry.phoneCode.toString()} ${textEditingController.text.toString()}",
//   sendby: "email",
//     );
//      if(signupResponse.result==false){
//        // Fluttertoast.showToast(msg: signupResponse.message);
//        print("${ _selectedDialogCountry.phoneCode.toString()}${textEditingController.text.toString()}");
//          showToast(signupResponse.message,
//      textStyle: TextStyle(color: Colors.black),
//      backgroundColor: Colors.grey[300],
//                     context: context,
                    
//                     borderRadius: BorderRadius.circular(10),
//                     animation: StyledToastAnimation.size,
//                     reverseAnimation: StyledToastAnimation.size,
//                     axis: Axis.horizontal,
//                     position: StyledToastPosition.center,
//                     animDuration: Duration(milliseconds: 400),
//                     duration: Duration(seconds: 2),
//                     curve: Curves.linear,
//                     reverseCurve: Curves.linear);
//             print(signupResponse.userData.name);
//         return  
//         Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => SignUpPOTP(
//             // code: signup().signupResponse.userData.verificationCode,
//             id: signupResponse.userData.id,
//             email: widget.email,
//             username: widget.username,
//             password: widget.password,
//             number: textEditingController.text,
//           ),),
 
// );
      
//      }   else if(signupResponse.result==true){
//         showToast(signupResponse.message,
//      textStyle: TextStyle(color: Colors.black),
//      backgroundColor: Colors.grey[300],
//                     context: context,
                    
//                     borderRadius: BorderRadius.circular(10),
//                     animation: StyledToastAnimation.size,
//                     reverseAnimation: StyledToastAnimation.size,
//                     axis: Axis.horizontal,
//                     position: StyledToastPosition.center,
//                     animDuration: Duration(milliseconds: 400),
//                     duration: Duration(seconds: 2),
//                     curve: Curves.linear,
//                     reverseCurve: Curves.linear);
//          //Fluttertoast.showToast(msg: signupResponse.message);
//          return ;
//      }
          
//       print(signup().signupResponse.userData.verificationCode);
//   //  SharedPreferences preferences= await SharedPreferences.getInstance();     //  print( "name  :${uploadImageResponse.result}");
//   //   var userid = preferences.getInt("$user_id");
  
//    } 
   String dropdownValue = 'One';
var currentSelectedValue;
 Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('90');
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
            Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: .5),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(
        children: [
          
           GestureDetector(
             onTap: _openCountryPickerDialog,
             child: Container(
                // width:19.w,
                //  child:ListTile(
                //   onTap: _openCountryPickerDialog,
                //   title: _buildDialogItem(_selectedDialogCountry),
                // ),
              child:   Row(
                   children: [
                     _buildDialogItem(_selectedDialogCountry),
                    // Text('${ _buildDialogItem(_selectedDialogCountry)}'),
                    //Icon(Icons.keyboard_arrow_down_sharp, color: kGoldText, size: 28),
                   ],
                 )
           //      DropdownButton(
           //        isExpanded: false,
           //        icon: Icon(Icons.keyboard_arrow_down_sharp, color: kGoldText, size: 28),
           //         iconSize: 28,
           //         elevation: 4,
           //         underline: Container(),
           //      hint: Text('+91'),
           //      value: currentSelectedValue,
           //      onChanged: (newValue) {
           //      setState(() {
           //                currentSelectedValue= newValue;
           //               });
           //               print(currentSelectedValue,);
           //   },
           //   items:list.map(( value) {
           //     return DropdownMenuItem(
                 
           //       value: value,
           //       child: Text("+$value"),
           //     );
           //   }).toList(),
             
           // )
               
               ),
           ),
          Expanded(
            child: TextField(
               onChanged: (value){
          uivalidation(value);
        },
              keyboardType: TextInputType.number,
              controller: textEditingController,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  letterSpacing: .5,
                ),
                hintText: 'Number',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    ),
    //  ListTile(
    //               onTap: _openCountryPickerDialog,
    //               title: _buildDialogItem(_selectedDialogCountry),
    //             ),
    //      Text('${ _buildDialogItem(_selectedDialogCountry)}'),
             status==true? next():Container(),
            image(),
           status==false? next():Container(),
             BottomContainer()
          ],
        ),
      ),
    );
  }
 
   Widget _buildDialogItem(Country country)
   
    {
    return  Row(
        children: <Widget>[
          
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
        
         // Flexible(child: Text(country.name))
        ],
      );
    }
     
 void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
              // CountryPickerUtils.getCountryByName('us'),
              // Text(country.name)
            ],
          ),
        ),
      );
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
              'Step 3 of 7',
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
              "What's your phone number",
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
              "To make sure you're not a robot or alien, we need to send a verification code",
              style: TextStyle(fontSize: 10.sp, letterSpacing: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  


  Widget image() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "Assets/Images/Number1.png",
          
        ),
      ),
    );
  }

  onPressed(SignupData  phoneprovider) {
    
   // signup();
    if (textEditingController.text.isNotEmpty) {
      phoneprovider.phone="+${ _selectedDialogCountry.phoneCode.toString()} ${textEditingController.text.toString()}";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpEmail(
            // code: signup().signupResponse.userData.verificationCode,
            
          ),
        ),
      );
    } else {
       showToast('Enter Phone Number',
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
     // Fluttertoast.showToast(msg: 'Enter Number');
    }
  }

  Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: () => onPressed(ref.watch(signupprov)),
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
