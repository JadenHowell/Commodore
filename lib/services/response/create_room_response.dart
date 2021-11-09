import 'package:commodore/services/response/response.dart';

class CreateRoomResponse extends Response{

  CreateRoomResponse(bool success) : super(success: success);

  CreateRoomResponse.fromMessage(String message) : super.fromMessage(message: message);

}