import 'package:socket_io_client/socket_io_client.dart' as IO;

class DataCache{
  static DataCache? _instance;
  IO.Socket? _socket;

  DataCache._private();

  static _init(){
    _instance = DataCache._private();
  }
  static DataCache getInstance(){
    if (_instance == null){
      _init();
    }
    return _instance!;
  }

  IO.Socket? get socket => _socket;

  set socket(IO.Socket? value) {
    _socket = value;
  }
}