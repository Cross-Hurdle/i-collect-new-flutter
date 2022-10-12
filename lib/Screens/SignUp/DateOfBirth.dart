import 'package:flutter/cupertino.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/DoBResponse.dart';
import 'package:icollekt/Screens/SignUp/Collection.dart';
import 'package:intl/intl.dart';
class DateOfBirth extends StatefulWidget {
  final String? username;
  final String? email;
  final String? password;
  final int id;
  const DateOfBirth(
      {Key? key, this.username, this.email, required this.id, this.password})
      : super(key: key);

  @override
  _DateOfBirthState createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  TextEditingController textEditingController = new TextEditingController();
     DateTime _datetime = DateTime.now();
   onPresseddob() async {
  DobResponse dob;
       var dobresponse = await AuthRepository().getDOBResponse(dob: textEditingController.text,
        id: widget.id);

 if(dobresponse['result']==false){
  dob = DobResponse.fromJson(dobresponse);
print(dob.result);
print(dob.result);
  print(widget.id) ;
        return Navigator.push(
  context,
  MaterialPageRoute(builder: (context) =>  
    Collection(
          email: widget.email,
          username: widget.username,
          password: widget.password,
          number: widget.id,
        ),),

);
    
     }   else if(dobresponse['result']=true){
       print(dobresponse['result']);
        // Fluttertoast.showToast(msg: loginresponse.message);
         showToast(dobresponse['message'],
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
  @override
 

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
            dateOfBirthField(),
            datePicker(),
          
            next(),
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
              'Step 6 of 7',
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
              "Hey ${preferences.getString('Name')}. What's your date of birth?",
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
              "We want to keep it personalized for you. We won't show it on your profile",
              style: TextStyle(fontSize: 10.sp, letterSpacing: 1.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
            child: Text(
              "Why do I need to give my date of birth?",
              style: TextStyle(
                fontSize: 10.sp,
                letterSpacing: 1.5,
                color: kGoldText,
              ),
            ),
          ),
        ],
      ),
    );
  }

 
  Widget datePicker() {
 
   // final DateFormat formatter = DateFormat('yyyy-MM-dd');
  //  _datetime = DateFormat('')
    return Expanded(
      child: Container(
        height: 200,
        alignment: Alignment.center,
        child: CupertinoDatePicker(
         maximumYear: 2022,
                mode: CupertinoDatePickerMode.date,
                dateOrder: DatePickerDateOrder.dmy,
                onDateTimeChanged: (value) {
                  _datetime =value;
                DateFormat.yMMMMEEEEd().format(_datetime);
               var date= DateFormat.yMMMMd().format(_datetime);
                 // print( DateFormat.yMMMMd().format(_datetime));
                  textEditingController.text = '$date';
                 // print(textEditingController.text );
                },
                
                initialDateTime: _datetime ,
              ),
      ),
    );
  }
 Widget dateOfBirthField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: .5),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: TextField(
       controller: textEditingController,
      
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            letterSpacing: .5,
          ),
          hintText: 'Date of Birth',
          border: InputBorder.none,
        ),
      ),
    );
  }

  onPressed() {
    if(textEditingController.text.isNotEmpty){
onPresseddob();
    }else{
showToast('Enter the Date of Birth',
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
    
    //print(textEditingController.text );
 
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) =>
    //   ),
    // );
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
