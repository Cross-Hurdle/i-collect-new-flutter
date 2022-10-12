import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Components/UseCase.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/UseCase/GetAllTimeCollection.dart';
import 'package:icollekt/Screens/Search/All%20Time/Presentation/Logic/AllTimeState/Search_State.dart';

class SearchStateNotifier extends StateNotifier<SearchState>{
  final  GetAllTimeCollection _getAllTimeCollection;
  SearchStateNotifier({required GetAllTimeCollection getAllTimeCollection,SearchState? initial}):
  _getAllTimeCollection=getAllTimeCollection ,super(initial??SearchState.initial());
  Future <void> getalltimefunction()async{
  try {
    state=SearchState.loading();
    var data = await _getAllTimeCollection.call(NoParams());
    data.fold((l) => state=SearchState.error(), (r){
      if (r.alltimeProduct.isEmpty) {
        state=SearchState.nodata();
      }else{
       state=SearchState.data(data: r);
      }
    
    });
  } catch (e) {
    state=SearchState.error();
  }
  }

}