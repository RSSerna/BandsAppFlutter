import 'package:bandnameapp/core/sockets/socket.dart';

abstract class BandsRemoteDataSource {
  bool addBand(String bandName);
  bool deleteBand(String id);
  bool voteBand(String id);
}

class BandsRemoteDataSourceImpl extends BandsRemoteDataSource {
  final SocketService socketService;

  BandsRemoteDataSourceImpl({required this.socketService});

  @override
  bool addBand(String bandName) {
    return socketService.sendData('add-band', {'name': bandName});
  }

  @override
  bool deleteBand(String id) {
    return socketService.sendData('delete-band', {'id': id});
  }

  @override
  voteBand(String id) {
    return socketService.sendData('vote-band', {'id': id});
  }
}
