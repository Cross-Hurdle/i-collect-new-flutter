import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Model/GroupPhotoModle.dart';
import 'package:icollekt/Services/Provider.dart';

class GroupPhotos extends ConsumerStatefulWidget {
  const GroupPhotos({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GroupPhotosState();
}

class _GroupPhotosState extends ConsumerState<GroupPhotos> {
  @override
  void initState() { 
    super.initState();
   getpostedresponse(ref.read(viewgroupprov));
  }
// GroupPhotoDataResponse? allchatresponse;
bool status=false;
//  getallchatresponse()async{
  
//   allchatresponse=   await GroupAndChatRepository().getAllGroupImagesData();  
//   status=true;
//   setState(() {
  
// });           

// }
GroupImageDataResponse?  allchatresponse;
 getpostedresponse(ViewGroupData allgroupview)async{
 allchatresponse = await GroupAndChatRepository().getAllGroupimageData(id:allgroupview.groupid!);
 status=true;
  //print(  allchatresponse!.userData.length);
  setState(() {
    
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context,ref.read(viewgroupprov)),
      body:  CustomScrollView(
        physics:  BouncingScrollPhysics(),
        slivers: 
          [
            SliverList(delegate: SliverChildListDelegate(
              [
              Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Photos',style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 17,
                fontWeight: FontWeight.w600,
               )),
            ),
          ],
        ),
               profilepost()
           
              ]
            )
            ), 
        ],
      ),
    );
  }
 AppBar buildappbar(context,ViewGroupData viewGroupData){
    return AppBar(
      toolbarHeight: 8.h,
      backgroundColor: kBackground,
    //  flexibleSpace: ,
        leading: Container(
          margin: EdgeInsets.only(left: 10.sp),
          child: GestureDetector(
          onTap: (){
           Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        ),
     // centerTitle: true,
      title: GestureDetector(
        onTap: (){
      //      pushNewScreen(
      //     context,
      //     screen:MyGroupProfile() ,
      //     withNavBar: false, // OPTIONAL VALUE. True by default.
      //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
      // );
        },
        child: Container(
          child: Row(
            children: [
              Column(
                children: [
         CircleAvatar(
                         radius: 16.sp,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child:
                           CachedNetworkImage(
            imageUrl:'${viewGroupData.groupimage}',
            
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
            errorWidget: (context, url, error) =>  Icon(Icons.error),
           ),
      
                        ),
                      ),
                ],
              ),
              SizedBox(width: 5.w,),
              Container(
                 width: 44.w,
                child: Text('${viewGroupData.groupname}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Color(0xff1A1A1A),
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600
                ),),
              ),
            ],
          ),
        ),
      ),
      
      elevation: 1,
    );
    
  }
    Widget profilepost(){
     if (!status) {
           return Container(
              height: 50.h,
             child: Center(child: CircularProgressIndicator()));
             
         }else 
         return
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount:allchatresponse!.image.length,
            itemBuilder: (context, index) {
               
          
         
              if(allchatresponse!.image[index].status==0)
              return
               allchatresponse!.image.length!=0? GestureDetector(
                onTap: (){
    //                                  pushNewScreen(
    //     context,
    //     screen: ProfilePost(),
    //     withNavBar: true, // OPTIONAL VALUE. True by default.
    //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
    // );
                                 },
                child: Container(
                 color: Colors.grey,
                  child:   CachedNetworkImage(
      imageUrl:allchatresponse!.image[index].photos,
      
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
              Center(child: 
        SizedBox( width: 30, height: 30, child: CircularProgressIndicator(value: downloadProgress.progress))),
      errorWidget: (context, url, error) =>  Icon(Icons.error),
     ),
                ),
              ):Container(
              //  color: Colors.red,
        height: 50.h,
        child: Center(child: Text('No Photos')));
        else
        return Container();
            },
          );
  }
}