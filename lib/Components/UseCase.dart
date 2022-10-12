import 'package:icollekt/Components/Failure.dart';
import 'package:dartz/dartz.dart';
abstract class Usecase<Type,Params>{
Future<Either<Failure,Type>>call(Params params);
}
class NoParams{

}
abstract class UsecaseWithoutFuture<Type,Params>{
Either<Failure,Type>call(Params params);
}
