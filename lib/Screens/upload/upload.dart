import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';


class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  // onPressed({@required String? function}) {
  //   Widget? routeNavigation;

  //   if (function == "Add image") {
  //     routeNavigation = AddImage();
  //   } else if (function == "Hashtags") {
  //   } else if (function == "Title") {
  //     routeNavigation = SignInUsername();
  //   } else if (function == "Price") {
  //     routeNavigation = SignUpEmail();
  //   }
  //   pushNewScreen(
  //         context,
  //         screen:routeNavigation! ,
  //         withNavBar: false, // OPTIONAL VALUE. True by default.
  //         pageTransitionAnimation: PageTransitionAnimation.cupertino,
  //     );
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(builder: (context) => routeNavigation!),
  //   // );
  // }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: topappbar(),
      body: Column(
        children: [
          SizedBox(height: 50,),
          UploadCustomBotton(title: "Add Image", onpressedtitle:"Add image" ),
          UploadCustomBotton(title: "Hashtags", onpressedtitle:"Hashtags" ),
          UploadCustomBotton(title: "Title", onpressedtitle:"Title" ),
          UploadCustomBotton(title: "Price", onpressedtitle:"Price" ),
        //  Text( '${preferences.getString('Name')}')
        ],
      ),
    );
  }

  AppBar topappbar(){
    return AppBar(
      leading: GestureDetector(
        onTap: (){
         
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      backgroundColor: kBackground,

      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      actions: [
      SvgPicture.asset("Assets/Images/shop.svg",
             width: 7.w,
              ),
      
        SizedBox(width: 2.w,)
      ],
      elevation: 1,
    );
  }
}

class UploadCustomBotton extends StatelessWidget {
 final String title;
 final String onpressedtitle;
   UploadCustomBotton({Key? key, required this.title, required this.onpressedtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    onPressed({@required String? function}) {
    Widget? routeNavigation;

    if (function == "Add image") {
      routeNavigation = AddImage();
    } else if (function == "Hashtags") {
      routeNavigation = Hashtags();
    } else if (function == "Title") {
      routeNavigation = UploadQuestion();
    } else if (function == "Price") {
      routeNavigation = ForSale();
    }
    pushNewScreen(
          context,
          screen:routeNavigation! ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
  }
    return   InkWell(
             onTap: (){
            onPressed(function: onpressedtitle);
          },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:double.infinity,
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