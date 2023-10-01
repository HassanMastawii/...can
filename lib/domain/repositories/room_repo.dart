import 'package:canary_app/domain/models/room.dart';
import 'package:dartz/dartz.dart';
import '../../data/errors/failures.dart';

abstract class RoomRepository {
  Future<Either<Failure, List<Room>>> searchRoom(String search);
  Future<Either<Failure, Room>> getRoomInfo(int id);
  Future<Either<Failure, Unit>> createRoom(Room room);
  Future<Either<Failure, String>> upRoomImg(String path);
}
