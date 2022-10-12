import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';

class StartSelling extends ConsumerStatefulWidget {
  const StartSelling({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartSellingState();
}

class _StartSellingState extends ConsumerState<StartSelling> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(right:56.0.sp),
            child: Container(
              child: Center(
                child: SvgPicture.asset(
                  "Assets/Images/success.svg",
            height: 32.h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('Get Started on Icollekt',
             textAlign: TextAlign.center,
             style: TextStyle(
               color: Color(0xff1A1A1A),
                fontWeight: FontWeight.w800,
                fontSize: 15.sp,
                fontFamily: 'Gilroy'
             ),
             )
           ],
         ),
        
           SizedBox(
            height: 8.h,
          ),
         next()
        ],
      )
      );
  }
   Widget next() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: MaterialButton(
        onPressed: (){
        //  Navigator.of(context).popUntil((route) => route.isFirst);
  //          Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => const  Home()),
  // );
           pushNewScreen(
          context,
          screen:UploadQuestion(),
          //AddAddress(),
          //ProductInfo() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'Get Started',
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