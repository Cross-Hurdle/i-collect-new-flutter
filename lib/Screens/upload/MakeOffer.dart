import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/upload/EndTime.dart';
import 'package:icollekt/Services/Provider.dart';

class MakeOffer extends ConsumerStatefulWidget {
  const MakeOffer({Key? key}) : super(key: key);

  @override
  ConsumerState<MakeOffer> createState() => _MakeOfferState();
}

class _MakeOfferState extends ConsumerState<MakeOffer> {
   TextEditingController _searchcontroller= TextEditingController();
    bool loader=false;

    validation(context){
     if ( _searchcontroller.text.isEmpty) {
      showToast('Enter the Minimum Price',
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
    }else if (_searchcontroller.text.contains(RegExp(r'[0-9]',unicode: true,dotAll: true ,multiLine: true,caseSensitive: false),)==false) {
         print('hiiname');
       showToast('Enter the Minimum Price',
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
      MaterialPageRoute(builder: (context) => EndTime()),
    );
     // uploadImageToDB(context);
        //   Navigator.of(context).popUntil((route) => route.isFirst);   
    }
  }
  @override
  
  Widget build(BuildContext context) {
   final info= ref.watch(productupload);
    return Stack(
      children: 
        [Scaffold(
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
                           child: Text('Minimum Price:',
                           textAlign: TextAlign.start,
                 style: TextStyle(
                   color: Color(0xff1A1A1A),
                   fontWeight: FontWeight.w700,
                   fontSize: 15.sp,
                   fontFamily: 'Gilroy'
                 ),
                 ),
                         ),
                         ],
                       ),
                     ),
                     textField()
                    // CustomButton(title: 'Showcase only', ontapped:()=> ForSale()),
                    //  CustomButton(title: 'For sale', ontapped:()=> ForSale()),
                    //   CustomButton(title: 'Make an offer', ontapped:()=> ForSale())
                   ],
                 ),
               ),
             ),
                InkWell(
                 onTap: (){
                   info.minprice=_searchcontroller.text;
                   validation(context);
                   // Navigator.of(context).popUntil((route) => route.isFirst);
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
            //  Navigator.of(context).popUntil((route) => route.isFirst);
              //  CustomButton(title: 'Next', ontapped:()=> MakeOffer(),nav: false,),
                SizedBox(height: 50,)
           
           ],
         ),
        ),
         if (loader)  Container(
            color: Colors.black.withOpacity(0.5),
            height: double.infinity,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          )
      ],
    );
    
  }

  Widget textField(){
   
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
        controller: _searchcontroller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'USD\$',
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
      title: Text('Make an Offer',
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