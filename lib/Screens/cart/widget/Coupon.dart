import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/exports.dart';

class CouponOffer extends ConsumerStatefulWidget {
  const CouponOffer({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CouponOfferState();
}

class _CouponOfferState extends ConsumerState<CouponOffer> {

  @override
  Widget build(BuildContext context) {
   return Column(
      children: [
        InkWell(
          onTap: (){

          },
          child: Container(
          width: double.infinity,
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
             child: Column(
               children: [
                  SizedBox(height: 25,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     // SizedBox(width: 30,),
                      Text('Apply Coupon',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                         fontWeight: FontWeight.w700,
                         fontFamily: 'Gilroy',
                           letterSpacing: 1,
                          color: Color(0xff591B4C),
                           fontSize: 11.sp
                                          ),
                      ),
                       Icon(Icons.arrow_forward_ios, color: Color(0xff1A1A1A)),
                     // Text('data')
                    ],
                   ),
                 ),
                 
                   SizedBox(height: 25,),
               ],
             ),
              margin: EdgeInsets.all(10),             
          ),
        )
       // Container(),
      ],
    );
  }
}