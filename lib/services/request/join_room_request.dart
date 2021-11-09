class JoinRoomRequest{
  late String _playerName;
  late String _roomCode;

  JoinRoomRequest(String playerName, String roomCode){
    _playerName = playerName;
    _roomCode = roomCode;
  }

  String getPlayerName() {return _playerName;}
  String getRoomCode() {return _roomCode;}
}