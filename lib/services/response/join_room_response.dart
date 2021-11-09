import 'package:commodore/services/response/response.dart';

class JoinRoomResponse extends Response{

  JoinRoomResponse(bool success) : super(success: success);

  JoinRoomResponse.fromMessage(String message) : super.fromMessage(message: message);

}