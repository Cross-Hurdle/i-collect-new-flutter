import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/DataSource/Search_remote.datasource.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/AlltimeModle.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/Repository/Search_repository.dart';



class SearchRepositoryImpl extends SearchRepository{
  final SearchremoteDataSource _searchremoteDataSource;
  SearchRepositoryImpl({required SearchremoteDataSource searchremoteDataSource}):_searchremoteDataSource=searchremoteDataSource;
  Future<Either<Failure,TopAllTimeresponse>> getresponse()async{
    try {
      var data =await _searchremoteDataSource.gettopcollection();
      return Right(data);
    } catch (e) {
      return Left(CustomFailure(msg: e.toString()));
    }
  }
}