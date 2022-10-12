import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Components/UseCase.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/UseCase/GetAllTopCollection.dart';


import 'Topyear_State.dart';

class TopYearStateNotifier extends StateNotifier<TopyearState>{
  final  GetAllTopCollection _getAllTopCollection;
  TopYearStateNotifier({required  GetAllTopCollection getAllTopCollection,TopyearState? initial}):
  _getAllTopCollection=getAllTopCollection ,super(initial??TopyearState.initial());
  Future <void> getalltimefunction()async{
  try {
    state=TopyearState.loading();
    var data = await _getAllTopCollection.call(NoParams());
    data.fold((l) => state=TopyearState.error(), (r){
      if (r.topyear.isEmpty) {
        state=TopyearState.nodata();
      }else{
       state=TopyearState.data(data: r);
      }
    
    });
  } catch (e) {
    state=TopyearState.error();
  }
  }

}