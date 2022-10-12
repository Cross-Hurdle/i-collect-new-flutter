abstract class Failure{
  final String? msg;
  const Failure({this.msg});
}
class CustomFailure extends Failure{
   final String? msg;
  const CustomFailure({this.msg});
}