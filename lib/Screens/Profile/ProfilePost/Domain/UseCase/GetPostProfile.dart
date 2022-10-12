import 'package:dartz/dartz.dart';
import 'package:icollekt/Components/Failure.dart';
import 'package:icollekt/Components/UseCase.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Data/Model/ProfilePostModle.dart';
import 'package:icollekt/Screens/Profile/ProfilePost/Domain/Repository/ProfilePost_Repository.dart';

class GetPostProfile implements Usecase<ProfilePostModle,int >{
  final ProfilePostRepository profilePostRepository;
  GetPostProfile({required this.profilePostRepository});

  Future <Either<Failure,ProfilePostModle>>call(int id)async{
    return profilePostRepository.getProfilePostresponse( id);
  }
}