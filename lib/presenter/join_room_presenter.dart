
import 'package:commodore/services/join_room_service.dart';
import 'package:commodore/services/request/join_room_request.dart';
import 'package:commodore/services/response/join_room_response.dart';

class JoinRoomPresenter {
  final JoinRoomView view;
  final JoinRoomService service = JoinRoomService();

  JoinRoomPresenter({required this.view});

  void onJoinRoomClicked(String playerName, String roomCode){
    JoinRoomResponse joinRoomResponse = service.joinRoom(JoinRoomRequest(playerName, roomCode));
    view.roomJoined(joinRoomResponse);
  }

}


/*
There are no interfaces in Dart. However, each class creates an implicit interface.
  So, abstract classes can act as our interfaces.

  However, there are also no nested classes. So, just put both the interface and
  presenter in the same file, should be as close to OK as possible.
 */
abstract class JoinRoomView {
  void roomJoined(JoinRoomResponse response);
}