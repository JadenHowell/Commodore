import 'package:commodore/services/request/join_room_request.dart';
import 'package:commodore/services/response/join_room_response.dart';

class JoinRoomService {
  JoinRoomService();

  joinRoom(JoinRoomRequest request){
    return JoinRoomResponse(true);
  }

}