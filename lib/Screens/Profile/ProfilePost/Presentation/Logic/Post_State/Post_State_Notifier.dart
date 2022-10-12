import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Domain/UseCase/GetPostProfile.dart';

import 'Post_State.dart';

class ProfilePostStateNotifier extends StateNotifier<PostState>{
  final  GetPostProfile _getPostProfile;
  ProfilePostStateNotifier({required  GetPostProfile getPostProfile,PostState? initial, }):
   _getPostProfile=getPostProfile ,super(initial??PostState.initial());
  Future <void> getalltimefunction(int id)async{
  try {
    state=PostState.loading();
    var data = await  _getPostProfile.call(id);
    data.fold((l) => state=PostState.error(), (r){
      if (r.products.isEmpty) {
        state=PostState.nodata();
      }else{
       state=PostState.data(data: r);
      }
    
    });
  } catch (e) {
    state=PostState.error();
    print(e);
  }
  }

}