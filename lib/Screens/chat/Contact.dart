import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/ContactModle.dart';
import 'package:icollekt/Model/CreateGroupModle.dart';
import 'package:icollekt/Services/Provider.dart';
import 'package:path/path.dart';



class ChatContact extends ConsumerStatefulWidget{
  const ChatContact({Key? key, }) : super(key: key);

  @override
  _ChatContactState createState() => _ChatContactState();
}

class _ChatContactState extends ConsumerState<ChatContact> {

 

  TextEditingController textEditingController = new TextEditingController();


bool selectedItem = false;
   List selection=[];

 

  void initState() {
     final prov=ref.read(contactProv);
     prov.selected.clear();
    getCollectionData();
    super.initState();
  }
  // void dispose( ) { 
  //    final prov=ref.watch(contactProv);
  //    prov.selected.clear();
  //   super.dispose();
  // }
//  void filter(String inputString) {
//     filteredList =
//         fooList.where((i) => i.toLowerCase().contains(inputString)).toList();
//     setState(() {});
//   }



 AllContactDataResponse? allConatactResponse;

getCollectionData()async { 
     allConatactResponse = await GroupAndChatRepository().getContactData();
     
     setState(() {
       
     });
     allConatactResponse!.data.forEach(
        (element) {
         
            filteredData.add(
              {
              
             "Id": element.id,
            "name": element.name,
            "image":  element.profilePic,
           
    
              
              },
            );

        },
        
      );
      // print('sdsd${filteredData[0]['id']}');
        for (int i = 0; i < filteredData.length; i++) {
      selectionIndex.add(
        {"Index": i, "Id": filteredData[i]['Id'], "IsSelected": false,'name':filteredData[i]['name']},
      );
     // print(selectionIndex);
    }

    ref.read(contactProv).selectedIndex = selectionIndex;
    setState(() {});

}
  // List< CollectionResponse>? category = [];
  //List<DataModel>? filteredList = [];
    List filteredData = [];
  List selectionIndex = [];
  void filter(String? val) {
    List sample=[];


    if (val!.isNotEmpty) {

      allConatactResponse!.data.forEach(
        (element) {

          if (element.name.toLowerCase().contains(val)) {
            sample.add(
              {
            "Id": element.id,
            "name": element.name,
            "image":  element.profilePic,
           
              },
            );
             
          } else {
            // print(filteredData);
          }
        },
      );
     
    } else {
      print('empty');
       allConatactResponse!.data.forEach(
        (element) {
         
           sample.add(
              {
              
            "Id": element.id,
            "name": element.name,
            "image":  element.profilePic,
           
              },
            );
       
        },
      );
    }
    filteredData=sample;

    setState(() {});

  }
  //API Call
//  validation(ContactData data){
//     if (data.selected.length<=1) {
//      uploadImageToDB(context,ref.read(creategroupprov),ref.read(contactProv));
//   } else {
    
//   }
//  }
uploadImageToDB(context,CreateGroupData groupdp,ContactData data) async {
if (data.selected.length>=1) {
//  print('akaldjaldaslkdaklsdkjasd');
       String filename= basename(groupdp.filepathprov!.path);
       String filenamebg= basename(groupdp.filebg!.path);
         var formData;
      try{
   formData = FormData.fromMap({
  'group_image':await MultipartFile.fromFile(groupdp.filepathprov!.path, filename: filename),
  //  await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
  'subject':groupdp.subject,
  'message':groupdp.message,
  'user_id':preferences.getInt('Userid'),
  'group_banner':await MultipartFile.fromFile(groupdp.filebg!.path, filename: filenamebg),
 'user_list':data.selected.join(',')
 //"\"${"${collectionData.join(',')}"}\""
 //'${"\"${"${data.selected.join(',')}"}\""}'

}); 
  final response = await Dio().post("http://i-collekt.jksoftec.com:3001/api/group_image/group_image-create",
 data: formData);
 
print(response);
CreateGroupDataResponse groupdp1;
      groupdp1=CreateGroupDataResponse.fromJson( response.data);
      
    if(groupdp1.status == false ){
      int count =0;
       //ref.watch(creategroupnavigatorprov).creategroup=='create'?
       
               Navigator.of(context).popUntil((route) => count++ ==2);

         print('response data11 ${ groupdp1.status}');

      
    }else{ 
     
      print('could not be uploaded');
    }
      }catch(e){

      }
 

    setState(() {});
} else {
  showToast('Please Add Members',
     textStyle: TextStyle(color: Colors.black),
     backgroundColor: Colors.grey[300],
                    context: context,
                    
                    borderRadius: BorderRadius.circular(10),
                    animation: StyledToastAnimation.size,
                    reverseAnimation: StyledToastAnimation.size,
                    axis: Axis.horizontal,
                    position: StyledToastPosition.center,
                    animDuration: Duration(milliseconds: 400),
                    duration: Duration(seconds: 2),
                    curve: Curves.linear,
                    reverseCurve: Curves.linear);
}
   }
  @override
  Widget build(BuildContext context) {
   //  final prov=ref.watch(contactProv);
    return Scaffold(
      appBar: buildappbar(context,ref.watch(contactProv)) ,
      body: RefreshIndicator(
        onRefresh: () async {
          getCollectionData();
        },
        child: CustomScrollView(
          physics:  BouncingScrollPhysics(),
          slivers: 
            [
              SliverList(delegate: SliverChildListDelegate(
                [
                  contactField(),
                 contact()
            
                ]
              ),
              
              ),
          ],
        ),
        
      ),
//       floatingActionButton:
//       FloatingActionButton(
// backgroundColor: Color(0xff591B4C),
//      child:  Padding(
//        padding: const EdgeInsets.only(left:8.0),
//        child: SvgPicture.asset( "Assets/Images/Send.svg",
//                               ),
//      ),
    
//         onPressed: (){
//           Navigator.pop(context);
//         //  prov.selected;
//           // pushNewScreen(
//           // context,
//           // screen: CreateaGroup() ,
//           // withNavBar: false, // OPTIONAL VALUE. True by default.
//           // pageTransitionAnimation: PageTransitionAnimation.cupertino,
//     //  );
//           setState(() {
            
//           });
//         print(prov.selected.length+1);
//       },)
    
    );
  }
   AppBar buildappbar(context,ContactData prov){
    return AppBar(
      backgroundColor: kBackground,
        leading: GestureDetector(
        onTap: (){
         Navigator.pop(context);
         prov.selected.clear();
        //  prov.selected.clear();
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      centerTitle: true,
      title: Text('Contacts',style: TextStyle(
        color: Color(0xff1A1A1A),
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w700
      ),),
      elevation: 1,
       actions: [
          MaterialButton(
            onPressed: (){
              // print('object');
             uploadImageToDB(context,ref.read(creategroupprov),ref.read(contactProv));
            },
            child: Center(
              child: Text('Create Group',
               style: TextStyle(
                       decoration: TextDecoration.none,
                          fontFamily: 'Gilroy',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff591B4C))
              ),
            ),
          ),
         // SizedBox(width: 5.w,)
        ],
    );
  }
 Widget contact(){
     
    return  ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 1,
              //  // crossAxisSpacing: 5.0,
              //    mainAxisExtent: 13.h,
              //  mainAxisSpacing: 0,
              // ),
              itemCount:filteredData.length,
              itemBuilder: (context, index) {
                return SelectedContact(
                   name: filteredData[index]['name'],
                  image:filteredData[index]['image'],
                  id: filteredData[index]['Id'],
                );
              },
            );
  }
  Widget contactField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
               onChanged: (text) {
              text = text.toLowerCase();
              filter(text);

            },
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  letterSpacing: .5,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.search_rounded,
              color: kPrimaryColor,
              size: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
class SelectedContact extends ConsumerStatefulWidget {
 final  id;
  final image;
  final name;

   
  // bool reload;
   SelectedContact({ Key? key, this.image,this.name,
   this.id,}) : super(key: key);

  @override
  _SelectedContactState createState() => _SelectedContactState();
}

class _SelectedContactState extends ConsumerState<SelectedContact> {

bool isSelected = false;

  onSelect(ContactData prov) {
    for (var i = 0; i < prov.selectedIndex.length; i++) {
      if (prov.selectedIndex[i]['Id'] == widget.id) {
        prov.selectedIndex[i]["IsSelected"] =
            !prov.selectedIndex[i]["IsSelected"];
       if(  prov.selectedIndex[i]["IsSelected"]){
         prov.selected.add(widget.id);
       }else{
         prov.selected.remove(widget.id);
       }
      }
    }
print(prov.selected);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider=ref.watch(contactProv);
    // provider.id=widget.id;
    // provider.mapselected();
    return Container(
      child: InkWell(
        onTap: (){
           
          onSelect(provider);
           print(isSelected);
            print('${"\"${"${provider.selected.join(',')}"}\""}');
//  pushNewScreen(
//           context,
//           screen: PersonalChat() ,
//           withNavBar: false, // OPTIONAL VALUE. True by default.
//           pageTransitionAnimation: PageTransitionAnimation.cupertino,
//       );
        },
        // onTap: (){
        //    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalChatContact()));
          
        // },
    
         child: Container(
            margin: EdgeInsets.symmetric(vertical: 2.sp,horizontal: 3.sp),
          // margin: EdgeInsets.symmetric(vertical: 4.sp,horizontal: 10),
            //  decoration: BoxDecoration(
            //        borderRadius: BorderRadius.circular(5),
            //        color: Colors.white,
            //         boxShadow: [
            //    BoxShadow(
            //      color: Colors.black12,
            //      spreadRadius: 1,
            //      blurRadius: 5,
            //      offset: Offset(2, 2), // changes position of shadow
            //    ),
            //      ],
            //      ),
           width: 3.w,
           child: Column(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               SizedBox(height: 1.h,),
               Row(
                 children: [
                    SizedBox(width: 3.w,),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: 
                                        [CircleAvatar(
                       radius: 26,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child:
                         CachedNetworkImage(
                            imageUrl:'${widget.image}',
                            
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
                    
                      ),
                                        ),
                        Builder(
            builder: (context) {
              for (var i = 0; i < provider.selectedIndex.length; i++) {
                if (provider.selectedIndex[i]['Id'] == widget.id) {
                  if (provider.selectedIndex[i]['IsSelected'])
                 
                 {
                    // print(provider.selectedIndex[i]['title']);
                    isSelected = true;
                 }
                  else
                  {
                    isSelected = false;
                  }
                }
              }
              if (isSelected){
                
              //  provider.selected.add(widget.name);
              //  print( provider.selected);
                // provider.selected.add(isSelected);
                return  
                CircleAvatar(
                  radius: 26, 
                   backgroundColor: Color(0xff591B4C).withOpacity(0.4),
                  child: Container(
                    // height: double.infinity,
                    // width:30,
                   // color: Colors.black.withOpacity(0.7),
                    alignment: Alignment.center,
                    child: SvgPicture.asset( "Assets/Images/tick.svg",height: 16,)
                  ),
                );
                }
              else{
               // provider.selected.remove(widget.name);
               // print( provider.selected);
               // provider.selected.remove(isSelected);
                return Container();
              }
                
            },
          ),
                        
                            
                                      ],
                    ),
                   SizedBox(width: 3.w,),
                   Container(
                     width: 50.w,
                     child: Text(widget.name,
                      overflow: TextOverflow.ellipsis,
                       style: TextStyle(
          color: Color(0xff343339),
          fontWeight: FontWeight.w700,
          fontFamily: "Gilroy",
          fontSize: 13.sp
                       ),
                       ),
                   ),
                     SizedBox(height: 1.h,),
       
                 ],
               ),
               SizedBox(height: 1.h,),
             ],
           ),
         ),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
