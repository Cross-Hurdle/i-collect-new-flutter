import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/AlltimeModle.dart';



part 'Search_State.freezed.dart';

@freezed
 class SearchState with _$SearchState {
 const  factory SearchState.initial() = _SearchStateInitial;
  const  factory SearchState.loading() = _SearchStateLoading;
   const  factory SearchState.error() = _SearchStateError;
   const factory SearchState.nodata()= _SearchStateNodata;
   const  factory SearchState.data({required  TopAllTimeresponse data}) = _SearchStateData;
}