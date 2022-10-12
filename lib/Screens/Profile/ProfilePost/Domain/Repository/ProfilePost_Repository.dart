import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/Model/ProfilePostModle.dart';

abstract class ProfilePostRepository{
  Future<Either<Failure,ProfilePostModle>> getProfilePostresponse(int id);
}