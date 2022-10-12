import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:flutter_svg/svg.dart';
import 'AddAddress.dart';
import 'Productinfo.dart';


class UploadQuestion extends ConsumerStatefulWidget {
  const UploadQuestion({Key? key}) : super(key: key);

  @override
  ConsumerState<UploadQuestion> createState() => _UploadQuestionState();
}

class _UploadQuestionState extends ConsumerState<UploadQuestion> {

   bool loader=false;

  Widget build(BuildContext context) {
  
    return Stack(
      children: 
        [Scaffold(
          //appBar: topappbar(context),
         // backgroundColor: Colors.red,
         body: Column(
           children: [
             Expanded(
               child: Column(
                 children: [
                Container(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right:56.0.sp),
                  child: Container(
                    child: Center(
                      child: SvgPicture.asset(
                        "Assets/Images/success.svg",
                  height: 34.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Get Started on Icollekt',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: Color(0xff1A1A1A),
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp,
                      fontFamily: 'Gilroy'
                   ),
                   )
                 ],
               ),
                   //  SizedBox(height: 3.h,),
               
                 // CustomButton(title: 'Showcase only', ontapped:()=> Navigator.pop(context)),
                  //  CustomButton(title: 'For sale', ontapped:(){
                  //    ForSale();
                  //    ref.read(productupload).option='sale';
                  //  } ,nav: false,),
                  //   CustomButton(title: 'Make an offer', ontapped:() {
                  //      ref.read(productupload).option='offer';
                  //    MakeOffer();
                  //   },nav: false,)
                 ],
               ),
             ),
                 InkWell(
                     onTap: (){
                      // uploadImageToDB(context);
                      ref.read(uploadquestion).option='post';
                        pushNewScreen(
                  context,
                  screen:ProductInfo() ,
                  //ShowCaseMinPrice() ,
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
                    // onPressed(function: onpressedtitle);
                  },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      width:100.w,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(5),
                        color: Color(0xff591B4C)
                      ),
                      child: Center(child: Text('Showcase only',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Gilroy",
                        fontSize: 16
                      ),
                      )),
                    ),
                  ),
                   InkWell(
                     onTap: (){
                      // uploadImageToDB(context);
                      
                   ref.read(uploadquestion).option='sale';
                        pushNewScreen(
                  context,
                  screen:AddAddress(),
                  //ShowCaseMinPrice() ,
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
                    // onPressed(function: onpressedtitle);
                  },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      width:100.w,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(5),
                        color: Color(0xff591B4C)
                      ),
                      child: Center(child: Text('For sale',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Gilroy",
                        fontSize: 16
                      ),
                      )),
                    ),
                  ),
                   InkWell(
                     onTap: (){
                      // uploadImageToDB(context);
                        ref.read(uploadquestion).option='offer';
                  
                        pushNewScreen(
                  context,
                  screen: AddAddress(),
                  //ShowCaseMinPrice() ,
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
                    // onPressed(function: onpressedtitle);
                  },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      width:100.w,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(5),
                        color: Color(0xff591B4C)
                      ),
                      child: Center(child: Text('Make an offer',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Gilroy",
                        fontSize: 16
                      ),
                      )),
                    ),
                  ),
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

 AppBar topappbar(context){
    return AppBar(
        backgroundColor: kBackground,
      
      centerTitle: true,
      // title: Image.asset("Assets/Images/Icollekt.png",
      // height: 11.h,
      // ),
      // title: Text('Tags',
      // style: TextStyle(
      //   color: Color(0xff1A1A1A),
      //   fontWeight: FontWeight.w700,
      //   fontSize: 16.sp,
      //   fontFamily: 'Gilroy'
      // ),
      // ),
    //  centerTitle: true,
    //  backgroundColor: Colors.white,
      elevation: 1,
        // leading: GestureDetector(
        // onTap: (){
        // Navigator.pop(context);
        // },
        // child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
    );
  }
}