import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Screens/Home/Success/Success.dart';
import 'package:icollekt/Screens/cart/payment%20Gateway/paypalService.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Provider/CartProvider.dart';
import 'PaymentApi Service/PaymentService.dart';


class PaypalPayment extends ConsumerStatefulWidget {
  final Function onFinish;

  PaypalPayment({required this.onFinish});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends ConsumerState<PaypalPayment> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? checkoutUrl;
  String? executeUrl;
  String? accessToken;
  PaypalServices services = PaypalServices();

  // you can change default currency according to your need
  Map<dynamic,dynamic> defaultCurrency = {"symbol": "USD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "USD"};

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL= 'cancel.example.com';


  @override
  void initState() {
   // print( ref.read(checkoutProvider).product!);
    super.initState();
   
 if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
            await services.createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"];
            executeUrl = res["executeUrl"];
          });
        }
      } catch (e) {
        print('exception: '+e.toString());
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        // ignore: deprecated_member_use
        _scaffoldKey.currentState!.showSnackBar(snackBar);
      }
    });
  }
//Api service
Future  payment(
   {
    required  sellerid,
      required  productid,
       required String paymentid,
        required String payerId,
         required String paymentmethord,
          required String createdtime,
           required String amount,
           required String productname
   }
)async{
    final pay= await PaymentService().getpaymentResponse( amount: '', createdtime: '', payerId: '', paymentid: '', paymentmethord: '', productid: null, productname: '', sellerid: null);
    print(pay['payerId']);
    setState(() {
      
    });
    print('dddddddddddddddddddddddddddddddddd');
     }
    //  payment(){
    // final pay= PaymentService().getpaymentResponse(name: '');
    // print(pay);
    // print('dddddddddddddddddddddddddddddddddd');
    //  }
  // item name, price and quantity
  String itemName = 'iPhone X';
  String itemPrice = '500';
  int quantity = 1;

  Map<String, dynamic> getOrderParams() {
     final checkout= ref.read(checkoutProvider);
     List items=[];
    // List items = 
    // [
    //   {
    //     "name": itemName,
    //     "quantity": quantity,
    //     "price": itemPrice,
    //     "currency": defaultCurrency["currency"]
    //   },
    //    {
    //     "name": itemName,
    //     "quantity": quantity,
    //     "price": itemPrice,
    //     "currency": defaultCurrency["currency"]
    //   },
    //    {
    //     "name": itemName,
    //     "quantity": quantity,
    //     "price": itemPrice,
    //     "currency": defaultCurrency["currency"]
    //   },
    //    {
    //     "name": itemName,
    //     "quantity": quantity,
    //     "price": itemPrice,
    //     "currency": defaultCurrency["currency"]
    //   }
    // ];
//  for (var i = 0; i < checkout.product!.length; i++) {
//    items.addAll(
//     checkout.product!
//    )
//  }
checkout.product!.forEach((element) {
  items.add(
   {
        "name":  element.name,
        "quantity": quantity,
        "price": element.unitPrice,
        "currency": defaultCurrency["currency"]
    
   }
  );
});
print("ln      ${items.length}");
    // checkout invoice details
    String totalAmount = checkout.grandtotal.toString();
    String subTotalAmount =  checkout.grandtotal.toString();
    String shippingCost = '0';
    int shippingDiscountCost = 0;
    String userFirstName = checkout.buyername.toString();
  //  String userLastName = 'Yadav';
    String addressCity = checkout.state.toString();
    String addressStreet = checkout.street.toString();
    String addressZipCode = checkout.pincode.toString();
    String addressCountry = checkout.country.toString();
    String addressState = checkout.state.toString();
    String addressPhoneNumber =checkout.phonenumber.toString();

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount":
                  ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            if (isEnableShipping &&
                isEnableAddress)
              "shipping_address": {
                "recipient_name": userFirstName ,
                //+
                    // " " +
                    // userLastName,
                "line1": addressStreet,
                "line2": "",
                "city": addressCity,
                "country_code": addressCountry,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
                "state": addressState
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {
        "return_url":returnURL,
        // Navigator.of(context).pop(),
        "cancel_url": cancelURL
      }
    };
    return temp;
  }
late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    print('url  ${checkoutUrl}');

    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: WebView(
          initialUrl: checkoutUrl,
          gestureNavigationEnabled: true,
                              onWebViewCreated:
                                  (WebViewController webViewController) {
                                _controller = webViewController;
                                if (checkoutUrl != null) {
                                  _controller.loadUrl(checkoutUrl.toString());
                                }
                              },
                              onProgress: (int progress) {
                                print(
                                    "WebView is loading (progress : $progress%)");
                              },
                              javascriptChannels: <JavascriptChannel>{},
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains(returnURL)) {
              final uri = Uri.parse(request.url);
              final payerID = uri.queryParameters['PayerID'];
              if (payerID != null) {
                services
                    .executePayment(executeUrl, payerID, accessToken)
                    .then((id) {
                  widget.onFinish(id);
                    //  payment(
                    //    amount: '',
                    //     createdtime: '', payerId: '', paymentid: '', paymentmethord: '', productid: null, productname: '', sellerid: null
                    //  );
                   Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>Success()
                          ),
                        );
                 // Navigator.of(context).pop();
                });
              } else {
                Navigator.of(context).pop();
              }
              //  Navigator.of(context).push(
              //             MaterialPageRoute(
              //               builder: (BuildContext context) =>Success()
              //             ),
              //           );
             // Navigator.of(context).pop();
            }
            if (request.url.contains(cancelURL)) {
              Navigator.of(context).pop();
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: CircularProgressIndicator())),
      );
    }
  }
}