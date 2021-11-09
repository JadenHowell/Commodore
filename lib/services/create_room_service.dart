import 'package:commodore/services/request/create_room_request.dart';
import 'package:commodore/services/response/create_room_response.dart';

class CreateRoomService {
  CreateRoomService();

  createRoom(CreateRoomRequest request){
    return CreateRoomResponse(true);
  }

}