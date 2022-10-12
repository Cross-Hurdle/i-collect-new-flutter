import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Components/UseCase.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/yearmodle.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/Repository/TopYear_repository.dart';


 class GetAllTopCollection implements Usecase<TopYearresponse,NoParams>{
  final SearchTopYearRepository searchTopYearRepository;
  GetAllTopCollection({required this.searchTopYearRepository,});
  @override
  Future<Either<Failure, TopYearresponse>>call(NoParams params)async{
    return searchTopYearRepository.gettopyearresponse();
  }
}