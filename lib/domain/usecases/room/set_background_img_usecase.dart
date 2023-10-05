import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class SetBackgroundImgUsecase {
  final RoomRepository repository;

  SetBackgroundImgUsecase(this.repository);

  Future<Either<Failure, Unit>> call(String path, int id) async {
    return await repository.setbackgroundImg(path, id);
  }
}
