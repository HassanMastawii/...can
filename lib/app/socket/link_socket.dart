import 'package:socket_io_client/socket_io_client.dart' as IO;

const String socketlink = "https://websocket.exos.lu";
// const String apiLink = "$serverLink/api/";

IO.Socket? socket;

void SocketLink() {
  socket = IO.io(socketlink, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
  });
}
