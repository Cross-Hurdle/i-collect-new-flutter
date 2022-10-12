import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'Home_State.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
 
    const  factory HomeState.initial() = _HomeStateInitial;
  const  factory HomeState.loading() = _HomeStateLoading;
   const  factory HomeState.error() = _HomeStateError;
   const factory HomeState.nodata()= _HomeStateNodata;
   const  factory HomeState.data({required  Stream <Response>data}) = _HomeStateData;
}