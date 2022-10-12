import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:icollekt/Components/Failure.dart';

abstract class HomeRepository{
 Either<Failure,Stream<Response>> getProductresponse();
}