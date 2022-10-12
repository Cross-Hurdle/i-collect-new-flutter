import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Search/All%20Time/Presentation/Logic/Provider.dart';
import '../../../../../Model/AllUserProfile.dart';
import 'SearchBar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    getallgroupdata();
    focusNode.requestFocus();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  bool feature =false;
    FocusNode focusNode =FocusNode();
    bool selectedItem = false;
   List selection=[];







AllUserresponse ?  allgroupdatamodleResponse;

getallgroupdata()async { 
  print(123);
     allgroupdatamodleResponse = await GroupAndChatRepository().getAllUserData();
     //allgroupdataResponse.data[0].
     
     print( allgroupdatamodleResponse!.profiles.length);
    //  setState(() {
       
    //  });
       allgroupdatamodleResponse!.profiles.reversed.forEach(
        (element) {
         
            filteredData.add(
              {
              
             "Id": element.id,
            "name": element.name,
            "image":  element.profilePic,
            'bgimg':element.bannerImg,
            "message":element.name,
           //  "list":element.userList
    
              
              },
            );

        },
        
      );
       print('sdsd${ allgroupdatamodleResponse!.profiles.length}');
    //     for (int i = 0; i < filteredData.length; i++) {
    //   selectionIndex.add(
    //     {"Index": i, "Id": filteredData[i]['Id'], "IsSelected": false,'name':filteredData[i]['name']},
    //   );
    //  // print(selectionIndex);
    // }

    // ref.read(contactProv).selectedIndex = selectionIndex;
   // setState(() {});

}
  // List< CollectionResponse>? category = [];
  //List<DataModel>? filteredList = [];
    List filteredData = [];
    List filteredData1=[];
  List selectionIndex = [];
    late TabController _tabController;
  void filter(String? val) {
    List sample=[];
    List sample2=[];


    if (val!.isNotEmpty) {
    ref.watch(getAllTimeCollectionNotifier).when(
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
              child: Center(child: Text('No ALLTime Collection')));
           },
           nodata: (){
             return
             Container(
              height: 50.h,
              child: Center(child: Text('No ALLTime Collection')));
           },
            data: (data){
              data.alltimeProduct.reversed.forEach(
        (element) {
          
          if (element.name.toLowerCase().contains(val)) {
               feature=true;
              //  _tabController = TabController(length: 2, vsync: this);
            sample2.add(
              {
             "Id": element.id,
            "name": element.name,
             "image":  element.thumbnailImg,
            // "message":element.description
           
              },
            );
             
          } else {
            // print(filteredData);
          }
        },
      );
            //  return
            //     Container(child: SearchBar(name:data.alltime))
             
    
           });
       allgroupdatamodleResponse!.profiles.reversed.forEach(
        (element) {
          
          if (element.name.toLowerCase().contains(val)) {
               feature=true;
              //  _tabController = TabController(length: 2, vsync: this);
            sample.add(
              {
            "Id": element.id,
            "name": element.name,
            "image":  element.profilePic,
            "message":element.name,
           
              },
            );
             
          } else {
            
            // print(filteredData);
          }
        },
      );
     
    } else {
    //  feature=false;
      print('empty');
      // _tabController = TabController(length: 2, vsync: this);
      //  allgroupdatamodleResponse!.finalData.reversed.forEach(
      //   (element) {
         
      //      sample.add(
      //         {
              
      //         "Id": element.id,
      //       "name": element.subject,
      //       "image":  element.groupImage,
      //       "message":element.message
           
      //         },
      //       );
       
      //   },
      // );
    }
     filteredData1=sample2;
    filteredData=sample;
    // filteredData.reversed;
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
       backgroundColor: Color(0xffF9F2FF),
     appBar:buildappbar() ,
     body: Column(
       children: [
         Expanded(
           child: Column(
             children: [
               textField(),
                  //  list(),
               if(feature)
                  Container(
                color: Colors.white,
                child: TabBar(
                  padding: EdgeInsets.only(bottom:0),
                //  labelColor: Colors.red,
                  indicatorColor:Color(0xff591B4C),
                controller: _tabController,
                tabs:  <Widget>[
                 
                  Tab(
                   child:  Text('Products',
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
                      child:  Text('Profiles',
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
                       SingleChildScrollView(
                         child: Container(child: SearchBar(name:filteredData1,
                         type: 'product',
                         tapped: (){
                            print('gi');
                           
                            
                         },))
                         ),
                    
                          SingleChildScrollView(
                            child: Container(child: SearchBar(name:filteredData,
                              type: 'account',
                            tapped: (){
                              print('gi1');
                             
                                
                                                   },)),
                          ),
                       //Container(color: Colors.red,width: 100,height: 100,),
                    ],),
                  ),
             ],
           ),
         ),
        
                
       ],
     ),
    );
  }
  // Widget list(){
  // return   Container(
  //   height: 300,
  //   child: ListView.builder(
  //     shrinkWrap: true,
  //     itemCount: filteredData.length,
  //     itemBuilder: (context,index){
  //      return Container(
  //        child: Text(filteredData[index]['message']),
  //      );
  //   }),
  // );
  // }
 
   Widget textField(){
   
    return GestureDetector(
      onTap: (){
        
    pushNewScreen(
          context,
          screen:SearchScreen(),
          withNavBar: true, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.fade,
      );
      },
      child: Container(
        //  margin: EdgeInsets.symmetric(horizontal: 20),
         width: double.infinity,
         height: 90,
         
         decoration: BoxDecoration(
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
        child: Container(
           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            // width: 51.w,
             height: 14.w,
            decoration: BoxDecoration(
             // borderRadius: BorderRadius.circular(9),
              color: Color(0xffFAF7F7),
              
            ),
            // child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text('Search',style: TextStyle(
            //         color: Colors.white,
            //        fontSize: 14.sp
            //       ),),
            //     ),
            //     Image.asset("Assets/Images/searchright.png",
            //     ),
            //   ],
            // ),
          child: TextField(
           // controller: _searchcontroller,
             focusNode: focusNode,
              onChanged: (text) {
                 
               
              text = text.toLowerCase();
              filter(text);

            },
            decoration: InputDecoration(
              
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp
              ),
              contentPadding: EdgeInsets.only(left: 10,top: 18),
              suffixIcon:  Image.asset("Assets/Images/searchright.png",
            ),
          )),
        )),
    );
  }
   buildappbar(){
    return AppBar(
       leading: Column(mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(height: 10,),
           GestureDetector(
            onTap: (){
             Navigator.pop(context);
            // prov.selected.clear();
            //  prov.selected.clear();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
         ],
       ),
      backgroundColor: kBackground,

      centerTitle: true,
      title: Image.asset("Assets/Images/Icollekt.png",
      height: 11.h,
      ),
      actions: [
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
        SizedBox(width: 2.w,)
      ],
      elevation: 0,
    );
  }
}