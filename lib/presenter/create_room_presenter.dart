
class CreateRoomPresenter {
  final CreateRoomView view;

  CreateRoomPresenter({required this.view});

  void onCreateRoomClicked(){
    //business logic
    view.roomCreated();
  }

}


/*
There are no interfaces in Dart. However, each class creates an implicit interface.
  So, abstract classes can act as our interfaces.

  However, there are also no nested classes. So, just put both the interface and
  presenter in the same file, should be as close to OK as possible.
 */
abstract class CreateRoomView {
  void roomCreated();
}