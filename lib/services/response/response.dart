abstract class Response {
  bool success;
  String? message;

  Response({required this.success});

  //fromMessage automatically assumes false
  Response.fromMessage({this.message, this.success=false});

}