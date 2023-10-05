import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class SetRoomPasswordUsecase {
  final RoomRepository repository;

  SetRoomPasswordUsecase(this.repository);

  Future<Either<Failure, String>> call(String path, int id) async {
    return await repository.setRooomPassword(path, id);
  }
}
