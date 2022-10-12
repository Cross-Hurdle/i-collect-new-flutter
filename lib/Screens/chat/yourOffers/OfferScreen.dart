import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Screens/chat/yourOffers/service/MakeanOfferRepository.dart';
import '../../../Exports/Exports.dart';
import 'Model/MakeAnOffer.dart';
import 'Widgets/OfferCard.dart';
import 'Widgets/PendingOffer.dart';


class OfferScreen extends ConsumerStatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OfferScreenState();
}

class _OfferScreenState extends ConsumerState<OfferScreen>  with TickerProviderStateMixin{
  late TabController _tabController;
  bool status  =false;
    bool status1  =false;
      bool status2  =false;
  @override
  void initState() {
    getpendingoffer();
    
     _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

      MakeAnOfferModle ? makeoffer;
 Future getpendingoffer()async{  
 makeoffer = await MakeAnRepository().getMakeAnOffer();
status =true;

// print(makeoffer!.makeOffer.length);
  setState(() {
    
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context),
      body: Column(
        children: [
           Row(
                  children: [
                 
                      Padding(
                           padding:  EdgeInsets.only(top:3.h,left: 5.w,bottom: 3.h),
                        child: Row(
                          children: [
                             Text("Offers",
                             style: TextStyle(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                             color: Color(0xff1A1A1A),
                            fontSize: 17.sp
                            ),
                          ),
                        ],
                     ),
                  )                           
                  ],
                ),
                   Container(
                color: Colors.white,
                child: TabBar(
                  padding: EdgeInsets.only(bottom:0),
                //  labelColor: Colors.red,
                  indicatorColor:Color(0xff591B4C),
                controller: _tabController,
                tabs:  <Widget>[
                 
                  Tab(
                   child:  Text('Your Offers',
                           overflow: TextOverflow.ellipsis,
                  textAlign:TextAlign.center,
               style: TextStyle(
                color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  fontFamily: 'Gilroy'
               ),
                          ),
                  ),
                  Tab(
                      child:  Text('Make an Offer',
                           overflow: TextOverflow.ellipsis,
                  textAlign:TextAlign.center,
               style: TextStyle(
                 color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  fontFamily: 'Gilroy'
               ),
                          ),
                  ),
                ],
                ),
                  ),
                    Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        PendingOffer(),
                      
                        offerlist()
                      //  SingleChildScrollView(child: Column(
                      //      children: [
                           
                      //       ],
                      //    )),
                       //Container(color: Colors.red,width: 100,height: 100,),
                    ],),
                  ),
          
        ],
      ),
    );
  }
Widget  offerlist(){
     if (!status) {
                 return Container(
                    height: 50.h,
                   child: Center(child: CircularProgressIndicator())
                   );
               }else{
                if (makeoffer!.makeOffer.length!=0){          
             return  SingleChildScrollView(
               child: Column(
                 children: [
                   StreamBuilder(
                     stream: getpendingoffer().asStream(),
                     builder: (context, snapshot) {
                       return ListView.builder(
                                       physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                       itemCount: makeoffer!.makeOffer.length,
                                       itemBuilder: (context,index){
                                      return OfferList(
                                      //  index: index,
                                      id:makeoffer!.makeOffer[index].id ,
                                        productname:makeoffer!.makeOffer[index].product.name,
                                        price:makeoffer!.makeOffer[index].makePrice,
                                        thumbnail:makeoffer!.makeOffer[index].product.thumbnailImg ,
                                        status:makeoffer!.makeOffer[index].status ,
                                        time:makeoffer!.makeOffer[index].createdAt ,
                                        title: makeoffer!.makeOffer[index].user.name,
                                       profilepic:makeoffer!.makeOffer[index].user.profilePic ,
                                      );
                        });
                     }
                   ),
                 ],
               ),
             );
                }else{
                  return Container(
                   
                  );
                }}
  }
   buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
       elevation: 1,
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
      //     IconButton(icon: Icon(Icons.notifications,size: 29,),color: Color(0xff591B4C),onPressed: (){
      //           pushNewScreen(
      //     context,
      //     screen: OfferScreen() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
      //       },),
      //         SizedBox(width: 5,),
      //   GestureDetector(
      //     onTap: (){
      //        pushNewScreen(
      //     context,
      //     screen: Cart() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
      //     },
      //     child: SvgPicture.asset("Assets/Images/shop.svg",
      //        width: 7.w,
      //         ),
      //   ),
      //   SizedBox(width: 3.w,)
      ],
    
    );
  }
}