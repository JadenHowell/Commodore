import 'package:commodore/data_cache.dart';
import 'package:commodore/services/request/join_room_request.dart';
import 'package:commodore/services/response/join_room_response.dart';

class JoinRoomService {
  JoinRoomService();

  joinRoom(JoinRoomRequest request){
    if(request.getPlayerName().length > 7){
      return JoinRoomResponse(false);
    }
    DataCache dataCache = DataCache.getInstance();
    dataCache.setPlayerName(request.getPlayerName());
    dataCache.randomizeColors();
    return JoinRoomResponse(true);
  }

}