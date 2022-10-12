 
 
 import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Components/UseCase.dart';
import 'package:icollekt/Screens/Home/HomePage/Domain/Repository/Home_repository.dart';

class GetHomeData implements UsecaseWithoutFuture<Stream<Response>,NoParams>{
  final HomeRepository homeRepository;
  GetHomeData({required this.homeRepository});
  @override
  Either<Failure,Stream<Response>>call(NoParams params){
    return homeRepository.getProductresponse();
  }
}
 
