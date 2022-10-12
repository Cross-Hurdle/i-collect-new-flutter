
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/yearmodle.dart';

part 'Topyear_State.freezed.dart';

@freezed
 class TopyearState with _$TopyearState {
 const  factory TopyearState.initial() = _TopyearStateInitial;
  const  factory TopyearState.loading() = _TopyearStateLoading;
   const  factory TopyearState.error() = _TopyearStateError;
   const factory TopyearState.nodata()= _TopyearStateNodata;
   const  factory TopyearState.data({required   TopYearresponse data}) = _TopyearStateData;
}