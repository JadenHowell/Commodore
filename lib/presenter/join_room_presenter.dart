
class JoinRoomPresenter {
  final JoinRoomView view;

  JoinRoomPresenter({required this.view});

  void onJoinRoomClicked(){
    //business logic
    view.roomJoined();
  }

}


/*
There are no interfaces in Dart. However, each class creates an implicit interface.
  So, abstract classes can act as our interfaces.

  However, there are also no nested classes. So, just put both the interface and
  presenter in the same file, should be as close to OK as possible.
 */
abstract class JoinRoomView {
  void roomJoined();
}