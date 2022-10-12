import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Components/UseCase.dart';
import 'package:icollekt/Screens/Home/HomePage/Domain/UseCase/GetHomeData.dart';
import 'package:icollekt/Screens/Home/HomePage/Presentation/Logic/Home_state/Home_State.dart';


class HomeStateNotifieer extends StateNotifier<HomeState>{
  final GetHomeData _getHomeData;
  HomeStateNotifieer({required GetHomeData homeData,HomeState? initial, }):_getHomeData=homeData,super(initial??HomeState.initial());
  void gethomedata(){
  try {
    state=HomeState.loading();
    var data =  _getHomeData.call(NoParams());
    data.fold((l) => state=HomeState.error(), (r){
      // if (r.finaloutput.isEmpty) {
      //   state=HomeState.nodata();
      // }else{
       state=HomeState.data(data: r);
     // }
    
    });
  } catch (e) {
    state=HomeState.error();
  }
  }
}

