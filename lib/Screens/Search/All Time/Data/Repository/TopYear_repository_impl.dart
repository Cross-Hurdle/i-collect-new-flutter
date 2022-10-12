import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/DataSource/Search_remote.datasource.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/yearmodle.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/Repository/TopYear_repository.dart';
// class SearchRepositoryImpl extends SearchRepository{
//   final SearchremoteDataSource _searchremoteDataSource;
//   SearchRepositoryImpl({required SearchremoteDataSource searchremoteDataSource}):_searchremoteDataSource=searchremoteDataSource;
//   Future<Either<Failure,TopAllTimeresponse>> getresponse()async{
//     try {
//       var data =await _searchremoteDataSource.gettopcollection();
//       return Right(data);
//     } catch (e) {
//       return Left(CustomFailure(msg: e.toString()));
//     }
//   }
// }
 class SearchTopYearRepositoryImpl extends SearchTopYearRepository{

  final SearchremoteDataSource _searchremoteDataSource;
  SearchTopYearRepositoryImpl({required SearchremoteDataSource searchremoteDataSource}):_searchremoteDataSource=searchremoteDataSource;
   //  @override
  Future<Either<Failure,TopYearresponse>> gettopyearresponse()async{
    
    try {
      var data =await _searchremoteDataSource.getThisyearResponse();
      return Right(data);
    } catch (e) {
      return Left(CustomFailure(msg: e.toString()));
    }
  }

 
}