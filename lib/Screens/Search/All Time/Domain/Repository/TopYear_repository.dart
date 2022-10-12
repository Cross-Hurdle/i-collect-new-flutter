import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/yearmodle.dart';



abstract class SearchTopYearRepository{
  Future<Either<Failure,TopYearresponse>> gettopyearresponse();
}