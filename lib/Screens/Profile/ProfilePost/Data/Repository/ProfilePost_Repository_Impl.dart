import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/DataSource/Profile_remote.datasource.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/Model/ProfilePostModle.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Domain/Repository/ProfilePost_Repository.dart';

class ProfilePostRepositoryImpl extends ProfilePostRepository{
  final ProfileremoteDataSource _profileremoteDataSource;
  ProfilePostRepositoryImpl({required ProfileremoteDataSource profileremoteDataSource}):_profileremoteDataSource=profileremoteDataSource;
  Future<Either<Failure,ProfilePostModle>> getProfilePostresponse(int id)async{
    try {
      var data =await _profileremoteDataSource.getProfilecollection( id);
      return Right(data);
    } catch (e) {
      return Left(CustomFailure(msg: e.toString()));
    }
  }
}