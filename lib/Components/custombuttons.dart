import 'package:icollekt/Exports/Exports.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  final  ontapped;
  bool nav;
  CustomButton({ Key? key, required this.title, required this.ontapped ,required this.nav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
             onTap: (){
                pushNewScreen(
          context,
          screen: ontapped() ,
          withNavBar: nav, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:100.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 15
              ),
              )),
            ),
          );
  }
}
// ignore: must_be_immutable
class CustomButton1 extends StatelessWidget {
  final String title;
  final  ontapped;
  bool nav;
  CustomButton1({ Key? key, required this.title, required this.ontapped ,required this.nav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
             onTap: (){
                pushNewScreen(
          context,
          screen: ontapped() ,
          withNavBar: nav, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
            // onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:45.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          );
  }
}
