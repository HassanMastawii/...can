import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class UpRoomImgUsecase {
  final RoomRepository repository;

  UpRoomImgUsecase(this.repository);

  Future<Either<Failure, String>> call(String path, int id) async {
    return await repository.upRoomImg(path, id);
  }
}
