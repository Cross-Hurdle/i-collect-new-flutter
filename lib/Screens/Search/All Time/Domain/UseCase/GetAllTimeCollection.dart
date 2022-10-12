import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Components/UseCase.dart';
import 'package:icollekt/Screens/Search/All%20Time/Data/Modle/AlltimeModle.dart';
import 'package:icollekt/Screens/Search/All%20Time/Domain/Repository/Search_repository.dart';



class GetAllTimeCollection implements Usecase<TopAllTimeresponse,NoParams>{
  final SearchRepository searchRepository;
  GetAllTimeCollection({required this.searchRepository});

  Future <Either<Failure,TopAllTimeresponse>>call(NoParams params)async{
    return searchRepository.getresponse();
  }
}