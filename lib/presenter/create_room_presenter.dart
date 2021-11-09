
import 'package:commodore/services/create_room_service.dart';
import 'package:commodore/services/request/create_room_request.dart';
import 'package:commodore/services/response/create_room_response.dart';

class CreateRoomPresenter {
  final CreateRoomView view;
  CreateRoomService service = CreateRoomService();

  CreateRoomPresenter({required this.view});

  void onCreateRoomClicked(String playerName){
    CreateRoomResponse createRoomResponse = service.createRoom(CreateRoomRequest(playerName));
    view.roomCreated(createRoomResponse);
  }

}


/*
There are no interfaces in Dart. However, each class creates an implicit interface.
  So, abstract classes can act as our interfaces.

  However, there are also no nested classes. So, just put both the interface and
  presenter in the same file, should be as close to OK as possible.
 */
abstract class CreateRoomView {
  void roomCreated(CreateRoomResponse response);
}