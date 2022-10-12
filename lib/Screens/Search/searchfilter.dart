import 'package:icollekt/Exports/Exports.dart';


// ignore: must_be_immutable
class SearchFilter extends StatelessWidget {
  String? filter;
   SearchFilter({ Key? key,required this.filter }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context),
      backgroundColor: Color(0xffF9F2FF),
      body: Column(
        children: [
          title(),
          collections(),
          Container()
        ],
      ),
     // bottomNavigationBar: bar()
      //bottomNavBar(),
    );
  }
    Widget title(){
    return Padding(
                   padding: const EdgeInsets.only(top:28.0,bottom: 20,left: 20),
                   child: Row(mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                     Container(
                       width: 90.w,
                    child:Text("Top rank collections this $filter",
                       textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
               fontSize: 15.sp,
               fontFamily: 'Gilroy'
                   ),
                  ),
                      // width: 100.w,
                      
                     ),
                     ],
                   ),
                 );
  }
   Widget collections() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),

      child:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 45.h,
            crossAxisCount: 2,
          ),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>  TopCollection(),
         itemCount: 30,
        ),
      ),
    );
  }
    buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
      leading: GestureDetector(
        onTap: (){
         Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      actions: [
        Image.asset("Assets/Images/shop.png",
     width: 12.w,
      ),
      ],
      elevation: 1,
    );
  }
}

class TopCollection extends StatefulWidget {
  const TopCollection({ Key? key }) : super(key: key);

  @override
  State<TopCollection> createState() => _TopCollectionState();
}

class _TopCollectionState extends State<TopCollection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductCards()));
      //   pushNewScreen(
      //     context,
      //     screen: ProductCards(),
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
      },
      child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              color: Colors.white
              ),
              margin: EdgeInsets.symmetric(vertical: 2.h,horizontal: 1.w),
              child: Stack(
                   alignment: AlignmentDirectional.centerEnd,
                  children: 
                    [ Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisSize: MainAxisSize.min,
                      // verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(children: [
                            Text('joshua',
                            style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 10.5.sp,
                              fontWeight: FontWeight.w600
                            ),
                            )
                          ],),
                        ),
                        Container(
                          width: double.infinity,
                          child: Image.asset("Assets/Images/Chip 2.jpeg",fit: BoxFit.fill,
                          //  height: 215.0,
                            ),
                        ),
                        // new SvgPicture.network(
                        //   country.flag.replaceAll('https', 'http'),r
                        //   height: 130.0,
                        //   width: 100.0,
                        //   placeholderBuilder: (BuildContext context) => new Container(
                        //       padding: const EdgeInsets.all(60.0),
                        //       child: const CircularProgressIndicator()),
                        // ),
                        new Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 0.90.h,),
                             Row(
                               children: [
                                 Container(
                                   width: 44.w,
                                   child: Text("Caesars Palace Casino 1\$ Chip  ",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w600,
                                     fontFamily: "Gilroy",
                                     fontSize: 11.5.sp,
                                     color: Color(0xff1A1A1A)
                                   ),
                                   )),
                               ],
                             ),
                               SizedBox(height: 0.90.sp,),
                               Row(
                               children: [
                                 Container(
                                   width: 44.w,
                                   child: Text("New Years eve 2005 Hard Rock Hotel Matchbox 20 casino chip",
                                   maxLines: 3,
                                   style: TextStyle(
                                     fontWeight: FontWeight.w400,
                                     fontFamily: "Gilroy",
                                     fontSize: 11.sp,
                                     color: Color(0xff1A1A1A)
                                   ),
                                   )),
                               ],
                             ),
                             SizedBox(height: 0.50.h,),
                             Row(mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 Text("5.00\$",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w600,
                                     fontFamily: "Gilroy",
                                     fontSize: 12.sp,
                                     color: Color(0xff1A1A1A)
                                   ),),
                                   SizedBox(width: 4.w,)
                               ],
                             )
                            ],
                          ),
                        )
                      ],
                    ),
                     Positioned(
                             // bottom: 295,
                              right: 1.h,
                              top: 6.h,
                              child: Image.asset("Assets/Images/inactive.png",),
                            ),
                  ],
              ),
            ),
    );
  }
}