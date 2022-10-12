
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';
import 'package:icollekt/Screens/Profile/Service/ProfileRepositoryService.dart';

import '../Followers/Widgets/FollowersContainer.dart';
import '../Model/FollowingModle.dart';


class Following extends ConsumerStatefulWidget {
    final id;
  const Following({Key? key,this.id}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FollowingState();
}

class _FollowingState extends ConsumerState<Following> {
 @override
  void initState() { 
    super.initState();
   getfollowings();
  }
  bool status =false;
  FollowingModle ? followingresponse;

Future getfollowings()async{  
 followingresponse = await ProfileRepository().getfollowingResponse(widget.id);
// print(followingresponse?.finalFollowing[0].followingData.length);
    status =true;
setState(() {
  
});
}
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(context) ,
        backgroundColor: Color(0xffF9F2FF),
       body: SingleChildScrollView(
        child: Column(
        children: [
         followinglist()
        ],
          ),
      ),
    );
  }
Widget  followinglist(){
     if (!status) {
        return Container(
         height: 50.h,
          child: Center(child: CircularProgressIndicator())
              );
               }else{
                if (followingresponse?.finalFollowing[0].followingData.length!=0){          
             return  ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: followingresponse?.finalFollowing[0].followingData.length??0,
            itemBuilder: (context,index){
             return FollowersContainer(
              id:followingresponse?.finalFollowing[0].followingData[index].id ,
              name:followingresponse?.finalFollowing[0].followingData[index].name ,
              photo:followingresponse?.finalFollowing[0].followingData[index].profilePic ,);
          });
                }else{
                  return Container();
                }
                }
  }
    buildappbar(context){
    return AppBar(
      backgroundColor: kBackground,
      leading: GestureDetector(
        onTap: (){
         Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
     // centerTitle: true,
      title: Text('Followers',   textAlign: TextAlign.start,
             style: TextStyle(
               color: Color(0xff1A1A1A),
               fontWeight: FontWeight.w700,
               fontSize: 15.sp,
               fontFamily: 'Gilroy'
                   ),),
    //   title: Image.asset("Assets/Images/Icollekt.png",
    //   height: 11.h,
    //   ),
    //   actions: [
    //     Image.asset("Assets/Images/shop.png",
    //  width: 12.w,
    //   ),
    //   ],
      elevation: 1,
    );
  }
}