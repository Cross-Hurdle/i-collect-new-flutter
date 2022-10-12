import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Search/All%20Time/Presentation/Logic/Provider.dart';

import '../Widgets/AllYearCollection.dart';


// ignore: must_be_immutable
class TopYearcollekt extends ConsumerStatefulWidget {
  String? filter;
   TopYearcollekt({ Key? key,required this.filter }) : super(key: key);

  @override
  ConsumerState<TopYearcollekt> createState() => _TopYearcollektState();
}

class _TopYearcollektState extends ConsumerState<TopYearcollekt> {
     @override
  void initState() { 
    Future.microtask(() =>  ref.read(getTopyearCollectionNotifier.notifier).getalltimefunction());
    
    super.initState();
    //topcollection();
  }
  // bool status =false;
  // TopYearresponse? collectionResponse;
  // topcollection() async {
     
  //  collectionResponse = await GroupAndChatRepository().getThisyearResponse();
  //  status=true;
  // print(collectionResponse);
  //    //  print('hiiiiiiiiiii   ${ref.read(commentinfo).id!}');
  //  // print(commentResponse!.userData.length);
  //    setState(() {
       
  //    });
  //  }
  Widget build(BuildContext context) {
     final state = ref.watch(getTopyearCollectionNotifier);
    return Scaffold(
      appBar: buildappbar(context),
      backgroundColor: Color(0xffF9F2FF),
      body: RefreshIndicator(
        onRefresh: ()async {
      Future.microtask(() =>  ref.read(getTopyearCollectionNotifier.notifier).getalltimefunction());
          },
        child: Column(
          children: [
            title(),
             state.when(
             initial: (){
                          return Container(
                      height: 50.h,
                     child: Center(child: CircularProgressIndicator()));
             }, 
             loading: (){
                    return Container(
                      height: 50.h,
                     child: Center(child: CircularProgressIndicator()));
             }, error: (){
               return
            Container(
                height: 50.h,
                child: Center(child: Text('Error')));
             },
             nodata: (){
               return
               Container(
                height: 50.h,
                child: Center(child: Text('No TopYear Collection')));
             },
              data: (data){
               return
                Expanded(
                  child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 47.h,
                            crossAxisCount: 2,
                          ),
                          physics: BouncingScrollPhysics(),
                         itemBuilder: (context, index) =>  TopCollectionyear(
                           id: data.topyear[index].id,
                            title: data.topyear[index].name,
                            description: data.topyear[index].description,
                            image: data.topyear[index].thumbnailImg,
                            price: data.topyear[index].unitPrice,
                          ),
                         itemCount:  data.topyear.length,
                        ),
                );
          
             })
           // collections(),
          //  Container()
          ],
        ),
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
                    child:Text("Top ranked collections this ${widget.filter}",
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

  //   collections() {
  // if (!status) {
  //                return Container(
  //                   height: 50.h,
  //                  child: Center(child: CircularProgressIndicator()));
  //              }else
  //   return
  // collectionResponse!.topyear.length!=0?  Expanded(
  //     child: Container(
  //       margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),

  //     child:  GridView.builder(
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           mainAxisExtent: 46.h,
  //           crossAxisCount: 2,
  //         ),
  //         physics: BouncingScrollPhysics(),
  //        itemBuilder: (context, index) =>  TopCollectionyear(
  //           title: collectionResponse!.topyear[index].name,
  //           description: collectionResponse!.topyear[index].description,
  //           image: collectionResponse!.topyear[index].orgImg,
  //           price: collectionResponse!.topyear[index].unitPrice,
  //         ),
  //        itemCount:  collectionResponse!.topyear.length,
  //       ),
  //     ),
  //   ):Container(
  //             height: 50.h,
  //             child: Center(child: Text('No Topyear Collection')));
  // }

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

