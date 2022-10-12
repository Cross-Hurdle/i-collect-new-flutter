import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/Model/ProfilePostModle.dart';

part 'Post_State.freezed.dart';

@freezed
abstract class PostState with _$PostState {
  const  factory PostState.initial() = _PostStateInitial;
  const  factory PostState.loading() = _PostStateLoading;
   const  factory PostState.error() = _PostStateError;
   const factory PostState.nodata()= _PostStateNodata;
   const  factory PostState.data({required  ProfilePostModle data}) = _PostStateData;
}
