import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/AlltimeModle.dart';


abstract class SearchRepository{
  Future<Either<Failure,TopAllTimeresponse>> getresponse();
}