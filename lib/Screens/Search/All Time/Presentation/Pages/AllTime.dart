import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

import '../Logic/Provider.dart';
import '../Widgets/AllTimeCollection.dart';

class AllTimecollekt extends ConsumerStatefulWidget {
  final String? filter;
   AllTimecollekt({ Key? key,required this.filter }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllTimecollektState();
}

class _AllTimecollektState extends ConsumerState<AllTimecollekt> {
  @override
  void initState() {
    Future.microtask(() =>  ref.read(getAllTimeCollectionNotifier.notifier).getalltimefunction()
    );
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getAllTimeCollectionNotifier);
    return Scaffold(
     appBar: buildappbar(context),
     body: Column(
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
              child: Center(child: Text('No ALLTime Collection')));
           },
            data: (data){
             return
              Expanded(
                child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 46.h,
                          crossAxisCount: 2,
                        ),
                        physics: BouncingScrollPhysics(),
                       itemBuilder: (context, index) {
                         print( data.alltimeProduct.length);
                         return TopCollectionAllTime(
                         id:data.alltimeProduct[index].id,
                          title: data.alltimeProduct[index].name,
                          description: data.alltimeProduct[index].description,
                          image: data.alltimeProduct[index].thumbnailImg,
                          price: data.alltimeProduct[index].unitPrice,
                        );
                       },
                       itemCount:  data.alltimeProduct.length,
                      ),
              );
    
           })
       ],
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
      Widget title(){
    return Padding(
                   padding: const EdgeInsets.only(top:28.0,bottom: 20,left: 20),
                   child: Container(
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
                 );
  }
}




// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:icollekt/Exports/Exports.dart';
// import 'package:icollekt/Model/yearmodle.dart';
// import 'package:icollekt/Screens/Search/All%20Time/Presentation/Widgets/AllTimeCollection.dart';

// import 'All Time/Data/Modle/AlltimeModle.dart';


// // ignore: must_be_immutable
// class AllTimecollekt extends StatefulWidget {
//   String? filter;
//    AllTimecollekt({ Key? key,required this.filter }) : super(key: key);

//   @override
//   State<AllTimecollekt> createState() => _AllTimecollektState();
// }

// class _AllTimecollektState extends State<AllTimecollekt> {
//     @override
//   void initState() { 
//     super.initState();
//     topcollection();
//   }
//   TopAllTimeresponse? collectionResponse;
//   bool status= false;
//   topcollection() async {
     
//    collectionResponse = await GroupAndChatRepository().getAllTimeResponse();
//    status=true;
//   print(collectionResponse);
//      //  print('hiiiiiiiiiii   ${ref.read(commentinfo).id!}');
//    // print(commentResponse!.userData.length);
//      setState(() {
       
//      });
//    }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildappbar(context),
//       backgroundColor: Color(0xffF9F2FF),
//       body: Column(
//         children: [
//           title(),
//           collections(),
//           Container()
//         ],
//       ),
//      // bottomNavigationBar: bar()
//       //bottomNavBar(),
//     );
//   }

//     Widget title(){
//     return Padding(
//                    padding: const EdgeInsets.only(top:28.0,bottom: 20,left: 20),
//                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                      Container(
//                        width: 90.w,
//                     child:Text("Top rank collections this ${widget.filter}",
//                        textAlign: TextAlign.start,
//              style: TextStyle(
//                color: Color(0xff1A1A1A),
//                fontWeight: FontWeight.w700,
//                fontSize: 15.sp,
//                fontFamily: 'Gilroy'
//                    ),
//                   ),
//                       // width: 100.w,
                      
//                      ),
//                      ],
//                    ),
//                  );
//   }

//    Widget collections() {
//    if (!status) {
//                  return Container(
//                     height: 50.h,
//                    child: Center(child: CircularProgressIndicator()));
//                }else
//                return 
//                 collectionResponse!.alltime.length!=0? Expanded(
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 2.sp, vertical: 1.sp),

//       child:  GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             mainAxisExtent: 46.h,
//             crossAxisCount: 2,
//           ),
//           physics: BouncingScrollPhysics(),
//          itemBuilder: (context, index) =>  TopCollectionAllTime(
//             title: collectionResponse!.alltime[index].name,
//             description: collectionResponse!.alltime[index].description,
//             image: collectionResponse!.alltime[index].orgImg,
//             price: collectionResponse!.alltime[index].unitPrice,
//           ),
//          itemCount:  collectionResponse!.alltime.length,
//         ),
//       ),
//     ):Container(
//               height: 50.h,
//               child: Center(child: Text('No ALLTime Collection')));
//   }

//     buildappbar(context){
//     return AppBar(
//       backgroundColor: kBackground,
//       leading: GestureDetector(
//         onTap: (){
//          Navigator.pop(context);
//         },
//         child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
//       centerTitle: true,
//       title: Image.asset("Assets/Images/Icollekt.png",
//       height: 11.h,
//       ),
//       actions: [
//         Image.asset("Assets/Images/shop.png",
//      width: 12.w,
//       ),
//       ],
//       elevation: 1,
//     );
//   }
// }

