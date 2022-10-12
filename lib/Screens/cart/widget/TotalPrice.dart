import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

class TotalPrice extends ConsumerStatefulWidget {
  final String? grandtotal;
  final String? tax;
  final String? discount;
  final String? originalprice;
  const TotalPrice( {Key? key,this.grandtotal, this.tax, this.discount, this.originalprice,}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TotalPriceState();
}

class _TotalPriceState extends ConsumerState<TotalPrice> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                SizedBox(height: 30,),
               Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 30,),
                  Expanded(child: Container(child: Text('Original Price',
                   style: TextStyle(
                   decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 123, 123, 123),
                  fontFamily: 'Gilroy',
                   letterSpacing: .5,
                    fontSize: 11.sp
                                          ),
                  ))),
                   Expanded(child: SizedBox()),
                   Container(child: Text('${widget.originalprice} \$',
                    style: TextStyle(
                   decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 123, 123, 123),
                  fontFamily: 'Gilroy',
                  // letterSpacing: 1,
                    fontSize: 11.sp
                                          ),
                   )),
                    SizedBox(width: 30,),
                 // Text('data')
                ],
               ),
                 SizedBox(height: 10,),
                Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 30,),
                  Expanded(child: Container(child: Text('Discount',
                   style: TextStyle(
                   decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 123, 123, 123),
                  fontFamily: 'Gilroy',
                   letterSpacing: .5,
                    fontSize: 11.sp
                                          ),
                  ))),
                   Expanded(child: SizedBox()),
                   Container(child: Text('${widget.discount} %',
                    style: TextStyle(
                   decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                   color: Color.fromARGB(255, 123, 123, 123),
                  fontFamily: 'Gilroy',
                  // letterSpacing: 1,
                    fontSize: 11.sp
                                          ),
                   )),
                     SizedBox(width: 30,),
                 // Text('data')
                ],
               ),
                 SizedBox(height: 10,),
                Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 30,),
                  Expanded(child: Container(child: Text('Tax',
                   style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 123, 123, 123),
                  fontFamily: 'Gilroy',
                   letterSpacing: .5,
                    fontSize: 11.sp
                                          ),
                  ))),
                   Expanded(child: SizedBox()),
                   Container(child: Text('${widget.tax} \$',
                    style: TextStyle(
                   decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                   color: Color.fromARGB(255, 123, 123, 123),
                  fontFamily: 'Gilroy',
                  // letterSpacing: 1,
                    fontSize: 11.sp
                                          ),
                   )),
                     SizedBox(width: 30,),
                 // Text('data')
                ],
               ),
                SizedBox(height: 15,),
                Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 30,),
                  Expanded(child: Container(child: Text('Grand Total',
                   style: TextStyle(
                   decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                   color: Colors.black,
                  fontFamily: 'Gilroy',
                   letterSpacing: 1,
                    fontSize: 12.sp
                                          ),
                  ))),
                   Expanded(child: SizedBox()),
                   Container(child: Text('${widget.grandtotal} \$',
                    style: TextStyle(
                   decoration: TextDecoration.none,
                  fontWeight: FontWeight.w500,
                   color: Colors.black,
                  fontFamily: 'Gilroy',
                   letterSpacing: 1,
                    fontSize: 12.sp
                                          ),
                   )),
                     SizedBox(width: 30,),
                 // Text('data')
                ],
               ),
                 SizedBox(height: 30,),
             ],
           ),
            margin: EdgeInsets.all(10),             
        )
       // Container(),
      ],
    );
  }
}