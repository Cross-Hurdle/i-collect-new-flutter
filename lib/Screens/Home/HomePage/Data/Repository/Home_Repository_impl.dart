import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Screens/Home/HomePage/Data/Datasource/Home_remote.dataSource.dart';
import 'package:icollekt/Screens/Home/HomePage/Domain/Repository/Home_repository.dart';


class HomeRepositoryImpl extends HomeRepository{
 final HomeRemoteDataSource _homeRemoteDataSource;
 HomeRepositoryImpl({required HomeRemoteDataSource homeRemoteDataSource}):_homeRemoteDataSource=homeRemoteDataSource;
 Either<Failure,Stream<Response>> getProductresponse(){
    try {
      var data = _homeRemoteDataSource.getProduct();
      return Right(data);
    } catch (e) {
      return Left(CustomFailure(msg: e.toString()));
    }
  }
}
