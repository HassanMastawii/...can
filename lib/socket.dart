//  import 'package:socket_io_client/socket_io_client.dart' as io;
//    io.Socket? socket;
//    void initializeSocket() {
//      socket = io.io('https://websocket.exos.lu', <String, dynamic>{
//       'transports': ['websocket'],
//      'autoConnect': true,
//    });
//      socket!.on('chat message', (data) {
//        setState(() {
//          fetchData();
//        });
//      });
//   socket!.emit('chat message', 'create room');

//   //  Start socket connection
//   socket!.connect();
// }