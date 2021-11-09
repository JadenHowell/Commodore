class CreateRoomRequest{
  late String _playerName;

  CreateRoomRequest(String playerName){
    _playerName = playerName;
  }

  String getPlayerName() {return _playerName;}
}