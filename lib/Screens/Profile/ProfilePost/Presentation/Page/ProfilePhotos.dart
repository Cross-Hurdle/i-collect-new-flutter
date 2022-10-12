import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Presentation/Logic/provider.dart';

class ProfilePhotos extends ConsumerStatefulWidget {
  final id;
  const ProfilePhotos({Key? key,this.id}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePhotosState();
}

class _ProfilePhotosState extends ConsumerState<ProfilePhotos> {
  @override
  void initState() {
    Future.microtask(() =>  ref.read(getProfilepostNotifier.notifier).getalltimefunction(widget.id)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context,),
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
 AppBar buildappbar(context,){
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
      centerTitle: true,
      title: Text('Photos',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 15.sp,
        color: Color(0xff1A1A1A),
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w500
      ),),
      
      elevation: 1,
    );
    
  }
    Widget profilepost(){
     final state = ref.watch(getProfilepostNotifier);
    return state.when(
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
                child: Center(child: Text('No Photo')));
             },
              data: (data){
               return   RefreshIndicator(
                 onRefresh: ()async { 
 Future.microtask(() =>  ref.read(getProfilepostNotifier.notifier).getalltimefunction(widget.id)
    );
                  },
                 child: GridView.builder(
                           physics:BouncingScrollPhysics() ,
                           shrinkWrap: true,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 3,
                             crossAxisSpacing: 5.0,
                             mainAxisSpacing: 5.0,
                           ),
                           itemCount:data.products.length,
                           itemBuilder: (context, index) {
                 return
                         
                        
                             // if(0==0)
                             // return
                             //  1!=0?
                  GestureDetector(
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
                     imageUrl:'${data.products[index].thumbnailImg}',
                     
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
                             );
                             //:Container(
                             //  color: Colors.red,
                      
                       
                    
                           },
                         ),
               );
                
          
             });
    //  if (!status) {
    //        return Container(
    //           height: 50.h,
    //          child: Center(child: CircularProgressIndicator()));
             
    //      }else 
    //      return
      
  }
}