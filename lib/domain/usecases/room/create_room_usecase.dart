import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class CreateRoomUsecase {
  final RoomRepository repository;

  CreateRoomUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Room room) async {
    return await repository.createRoom(room);
  }
}
