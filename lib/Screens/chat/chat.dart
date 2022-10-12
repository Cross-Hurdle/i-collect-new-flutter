import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/AllGroupResponse_Modle.dart';
import 'package:icollekt/Services/Provider.dart';

import '../Notification/Notification.dart';

class Chat extends  ConsumerStatefulWidget {
final bool? isdirect;
   Chat({ Key? key,this.isdirect=false }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> {
  @override
  void initState() { 
    super.initState();
    //print('object');
    //getgroupdata(ref.read(viewgroupprov));
   getallgroupdata();
     filteredData.clear();
   // groupdata.clear();
    //  print(groupdata[0].message,);
  }

bool selectedItem = false;
   List selection=[];



  // void dispose( ) { 
  //    final prov=ref.read(collectionProv);
  //    prov.selected.clear();
  //   super.dispose();
  // }
//  void filter(String inputString) {
//     filteredList =
//         fooList.where((i) => i.toLowerCase().contains(inputString)).toList();
//     setState(() {});
//   }



AllGroupDataResponseModle ?  allgroupdatamodleResponse;

getallgroupdata()async { 
  print(123);
     allgroupdatamodleResponse = await GroupAndChatRepository().getAllGroupDataresponse();
     //allgroupdataResponse.data[0].
     
     print( allgroupdatamodleResponse!.finalData.length);
     setState(() {
       
     });
       allgroupdatamodleResponse!.finalData.reversed.forEach(
        (element) {
         
            filteredData.add(
              {
              
             "Id": element.id,
            "name": element.subject,
            "image":  element.groupImage,
            "message":element.message,
             "list":element.userList
    
              
              },
            );

        },
        
      );
       print('sdsd${ allgroupdatamodleResponse!.finalData.length}');
    //     for (int i = 0; i < filteredData.length; i++) {
    //   selectionIndex.add(
    //     {"Index": i, "Id": filteredData[i]['Id'], "IsSelected": false,'name':filteredData[i]['name']},
    //   );
    //  // print(selectionIndex);
    // }

    // ref.read(contactProv).selectedIndex = selectionIndex;
    setState(() {});

}
  // List< CollectionResponse>? category = [];
  //List<DataModel>? filteredList = [];
    List filteredData = [];
  List selectionIndex = [];
  void filter(String? val) {
    List sample=[];


    if (val!.isNotEmpty) {

       allgroupdatamodleResponse!.finalData.reversed.forEach(
        (element) {

          if (element.subject.toLowerCase().contains(val)) {
            sample.add(
              {
             "Id": element.id,
            "name": element.subject,
            "image":  element.groupImage,
            "message":element.message
           
              },
            );
             
          } else {
            // print(filteredData);
          }
        },
      );
     
    } else {
      print('empty');
       allgroupdatamodleResponse!.finalData.reversed.forEach(
        (element) {
         
           sample.add(
              {
              
              "Id": element.id,
            "name": element.subject,
            "image":  element.groupImage,
            "message":element.message
           
              },
            );
       
        },
      );
    }
    filteredData=sample;
    // filteredData.reversed;
    setState(() {});

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context),
      backgroundColor: Color(0xffF9F2FF),
      body: RefreshIndicator(
        onRefresh: () async {
           filteredData.clear();
          getallgroupdata();
          
          //getgroupdata(ref.read(viewgroupprov));;groupdata.clear();
          },
        child: CustomScrollView(
          physics:  BouncingScrollPhysics(),
          slivers: 
            [
              SliverList(delegate: SliverChildListDelegate(
                [
             SizedBox(height: 20,),
               Container(
                  margin: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 14.sp),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  mygroup(context),
                  SizedBox(width: 10.w,),
                  inbox(context)
                  ],
                ),
              ),
      //            InkWell(
      //        onTap: (){
      // //          ref.watch(creategroupnavigatorprov).creategroup='create';
      //           pushNewScreen(
      //     context,
      //     screen: OfferScreen() ,
      //     withNavBar: true, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // ).then((value) =>  filteredData.clear()).then((value) =>  getallgroupdata());
      //       // onPressed(function: onpressedtitle);
      //     },
      //       child: Container(
      //         margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      //         width:100.w,
      //         height: 50,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadiusDirectional.circular(5),
      //           color: Color(0xff591B4C)
      //         ),
      //         child: Center(child: Text('Your Offers',
      //         style: TextStyle(
      //           color: Colors.white,
      //           letterSpacing: 1,
      //           fontWeight: FontWeight.w600,
      //           fontFamily: "Gilroy",
      //           fontSize: 15
      //         ),
      //         )),
      //       ),
      //     ),
              InkWell(
             onTap: (){
               ref.watch(creategroupnavigatorprov).creategroup='create';
                pushNewScreen(
          context,
          screen: CreateaGroup() ,
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) =>  filteredData.clear()).then((value) =>  getallgroupdata());
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
              child: Center(child: Text('Create Group',
              style: TextStyle(
                letterSpacing: 1,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: "Gilroy",
                fontSize: 15
              ),
              )),
            ),
          ),
            // CustomButton(title: 'Create Group', ontapped:()=>CreateaGroup() ,nav: true,),
           
             textField(),
             group(ref.watch(viewgroupprov))
           ]
              )
              ),
      
          ],
        ),
      ),
    
    );
  }

  Widget group(ViewGroupData viewdata){
    //s filteredData.reversed;
    return   ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 1,
              //   crossAxisSpacing: 5.0,
              //   mainAxisSpacing: 1.0,
              //   mainAxisExtent:14.h
              // ),
              itemCount:filteredData.length,
              itemBuilder: (context, index) {
                filteredData.reversed;
                return GestureDetector(
                  onTap: (){
                    viewdata.groupid=filteredData[index]["Id"];
                                       pushNewScreen(
          context,
          screen: CollectionGroupPage(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
                                   },
                  child: Container(
                 margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                   decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
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
                 width: 3.w,
                 child: Column(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(height: 15,),
                     Row(
                       children: [
                          SizedBox(width: 10,),
                //          CircleAvatar(
                //            backgroundColor: Colors.white,
                //           radius: 24,
                // //           child: Image.asset(groupdata[index].groupImage,
                // //   height: 4.h,
                // //  ),
                //          ),
                CircleAvatar(
                     radius: 24,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child:
                       CachedNetworkImage(
        imageUrl:filteredData[index]['image'],
      ///  "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
         width: 9.5.h,
                        height: 9.5.h,
                           fit: BoxFit.cover,
             imageBuilder: (context, imageProvider) =>CircleAvatar(
                    radius: 33.sp,
  
                    child:  Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
         // colorFilter:
            //  ColorFilter.mode(Colors.red, BlendMode.colorBurn)
              ),
    ),
  ),                 
                    ),
                            
        progressIndicatorBuilder: (context, url, downloadProgress) => 
                CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) =>  Image.asset( "Assets/Images/Portrait_Placeholder.png",fit: BoxFit.cover,),
     ),
                  //      Image.network(
                  //         "http://i-collekt.jksoftec.com:3001/home_images/home_page_1640244659364.jpeg",
                  //     // "Assets/Images/profilepic.png",
                  // //   height: 60,width: 20,
                  //       fit: BoxFit.cover,
                  //       width: 9.5.h,
                  //       height: 9.5.h,
                  //     ),
                    ),
                  ),
                         SizedBox(width: 10,),
                         Container(
                           width: 60.w,
                          // color: Colors.red,
                           child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(filteredData[index]['name'],
                                overflow: TextOverflow.ellipsis,
                             style: TextStyle(
                color: Color(0xff343339),
                fontWeight: FontWeight.w700,
                fontFamily: "Gilroy",
                fontSize: 13.sp
                             ),
                             ),
                             SizedBox(height: 10,),
               Text(filteredData[index]['message'],
                 overflow: TextOverflow.ellipsis,
                             style: TextStyle(
                color: Color(0xff343339),
                fontWeight: FontWeight.w400,
                fontFamily: "Gilroy",
                fontSize: 11.sp
                             ),
                             ),
                             ],
                           ),
                         )
                       ],
                     ),
                     SizedBox(height: 2.h,),
                   ],
                 ),
               ),
                  
                );
              },
            );
 
  }

  Widget mygroup(context){
    return Expanded(
      child: GestureDetector(
          onTap: (){
                pushNewScreen(
          context,
          screen: MyGroupMessage(
            group: 'group',
            //inbox: false,
          ) ,
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) =>  filteredData.clear()).then((value) =>  getallgroupdata());
            // onPressed(function: onpressedtitle);
          },
        child: Container(
            width: double.infinity,
          height: 6.h,
          // width: 47.w,
              //   margin: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 4.sp),
                 decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SvgPicture.asset("Assets/Images/mygroup.svg",
                  height: 3.5.h,
                 ),
                 SizedBox(width: 3.w,),
                  Text("My Group",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Gilroy',
                    fontSize:12.sp,
                    color: Color(0xff343339)
                  ),
                  ),
                ],
              ),
              ),
      ),
    );
  }

  Widget inbox(context){
    return Expanded(
      child: GestureDetector(
         onTap: (){
                pushNewScreen(
          context,
          screen: MyGroupMessage(
           //  inbox: "inbox",
             group: "inbox",
          ) ,
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ).then((value) =>  filteredData.clear()).then((value) =>  getallgroupdata());
            // onPressed(function: onpressedtitle);
          },
        child: Container(
           height: 6.h,
          // height: 8.h,
           width: double.infinity,
                // margin: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 4.sp),
                 decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
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
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   SvgPicture.asset("Assets/Images/inbox.svg",
                    height: 3.h,
                   ),
                   SizedBox(width: 7.w,),
                  Text("Inbox",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Gilroy',
                    fontSize:12.sp,
                    color: Color(0xff343339)
                  ),
                  ),
                ],
              ),
              ),
      ),
    );
  }

  Widget textField(){
   // TextEditingController _searchcontroller= TextEditingController();
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        // width: 51.w,
         height: 14.w,
        decoration: BoxDecoration(
         // borderRadius: BorderRadius.circular(9),
          color: Color(0xffFAF7F7),
          
        ),
      child: TextField(
        //controller: _searchcontroller,
         onChanged: (text) {
              text = text.toLowerCase();
              filter(text);

            },
        decoration: InputDecoration(
          
          border: InputBorder.none,
          hintText: 'Search a group',
          hintStyle: TextStyle(
            color: Color(0xffCCCCCC),
            fontSize: 14.sp
          ),
          contentPadding: EdgeInsets.only(left: 10,top: 18),
          suffixIcon:  Image.asset("Assets/Images/searchright.png",
        ),
      )),
    );
  }

  buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,

      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      actions: [
      //     IconButton(icon: Icon(Icons.notifications,size: 29,),color: Color(0xff591B4C),onPressed: (){
      //           pushNewScreen(
      //     context,
      //     screen: NotificationScreen() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
      //       },),
              SizedBox(width: 5,),
        GestureDetector(
          onTap: (){
             pushNewScreen(
          context,
          screen: Cart() ,
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
          },
          child: SvgPicture.asset("Assets/Images/shop.svg",
             width: 7.w,
              ),
        ),
        SizedBox(width: 3.w,)
      ],
      elevation: 0,
    );
  }
}