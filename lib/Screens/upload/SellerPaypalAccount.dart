import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Productinfo.dart';

class SellerPaypalAccount extends ConsumerStatefulWidget {
  const SellerPaypalAccount({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerPaypalAccountState();
}

class _SellerPaypalAccountState extends ConsumerState<SellerPaypalAccount> {
  TextEditingController  _textcontroller1= TextEditingController();
   TextEditingController  _textcontroller2= TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: topappbar(context),
     // backgroundColor: Colors.red,
     body: Column(
       children: [
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
               
                //  textField(),
                //    SizedBox(height: 1.h,),
                //   description()
                // CustomButton(title: 'Showcase only', ontapped:()=> ForSale()),
                //  CustomButton(title: 'For sale', ontapped:()=> ForSale()),
                //   CustomButton(title: 'Make an offer', ontapped:()=> ForSale())
               ],
             ),
           ),
         ),
          InkWell(
             onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>SafeArea(
                          top: true,
                          child: WebView(
                             javascriptMode: JavascriptMode.unrestricted,
                            initialUrl: 'https://www.paypal.com/tw/signin?locale.x=en_TW',
                          ),
                        )
                        //  UsePaypal(
                        //     sandboxMode: true,
                        //     clientId:
                        //         "AW1TdvpSGbIM5iP4HJNI5TyTmwpY9Gv9dYw8_8yW5lYIbCqf326vrkrp0ce9TAqjEGMHiV3OqJM_aRT0",
                        //     secretKey:
                        //         "EHHtTDjnmTZATYBPiGzZC_AZUfMpMAzj2VZUeqlFUrRJA_C0pQNCxDccB5qoRQSEdcOnnKQhycuOWdP9",
                        //     returnURL: "https://samplesite.com/return",
                        //     cancelURL: "https://samplesite.com/cancel",
                        //     transactions: const [
                        //       {
                        //         "amount": {
                        //           "total": '10.12',
                        //           "currency": "USD",
                        //           "details": {
                        //             "subtotal": '10.12',
                        //             "shipping": '0',
                        //             "shipping_discount": 0
                        //           }
                        //         },
                        //         "description":
                        //             "The payment transaction description.",
                        //         // "payment_options": {
                        //         //   "allowed_payment_method":
                        //         //       "INSTANT_FUNDING_SOURCE"
                        //         // },
                        //         "item_list": {
                        //           "items": [
                        //             {
                        //               "name": "A demo product",
                        //               "quantity": 1,
                        //               "price": '10.12',
                        //               "currency": "USD"
                        //             }
                        //           ],

                        //           // shipping address is not required though
                        //           "shipping_address": {
                        //             "recipient_name": "Jane Foster",
                        //             "line1": "Travis County",
                        //             "line2": "",
                        //             "city": "Austin",
                        //             "country_code": "US",
                        //             "postal_code": "73301",
                        //             "phone": "+00000000",
                        //             "state": "Texas"
                        //           },
                        //         }
                        //       }
                        //     ],
                        //     note: "Contact us for any questions on your order.",
                        //     onSuccess: (Map params) async {
                        //       print("onSuccess: $params");
                        //     },
                        //     onError: (error) {
                        //       print("onError: $error");
                        //     },
                        //     onCancel: (params) {
                        //       print('cancelled: $params');
                        //     }),
                      ),
                    )
                  },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width:95.w,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                color: Color(0xff591B4C)
              ),
              child: Center(child: Text('Connect to Paypal',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          ),
         // CusomButton(title: 'Next', ontapped:()=> SellerAddress(),nav: false,),
                  SizedBox(height: 50,),
         InkWell(
             onTap: (){
              //  info.productname=_textcontroller1.text;
              //  info.description=_textcontroller2.text;
              //  validation();
                pushNewScreen(
          context,
          screen:ProductInfo(),
          //AddImage() ,
          withNavBar:false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
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
              child: Center(child: Text('Continue',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 16
              ),
              )),
            ),
          ),
         // CusomButton(title: 'Next', ontapped:()=> SellerAddress(),nav: false,),
                  SizedBox(height: 50,)
       ],
     ),
    );
    
  }
   Widget description(){
   
    return Container(
       margin: EdgeInsets.only(left: 10,top: 20,right: 8.sp),
         height: 35.h,
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
         keyboardType: TextInputType.multiline,
  maxLines: 10,
  
        controller:  _textcontroller2,
        decoration: InputDecoration(
          
          border: InputBorder.none,
          hintText: ' Description',
          hintStyle: TextStyle(
            color: Color(0xffABB4BD),
            fontFamily: 'Gilroy',
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
        //  suffixIcon:  Image.asset("Assets/Images/searchright.png",
        
      )),
    );
  }
  Widget textField(){
    
    return Container(
     margin: EdgeInsets.only(left: 10,top: 10,right: 8.sp),
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
        controller: _textcontroller1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: ' Product Name',
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
      title: Text('Connect to Paypal',
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