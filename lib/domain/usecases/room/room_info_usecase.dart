import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class RoomInfoUsecase {
  final RoomRepository repository;

  RoomInfoUsecase(this.repository);

  Future<Either<Failure, Room>> call(int id) async {
    return await repository.getRoomInfo(id);
  }
}
