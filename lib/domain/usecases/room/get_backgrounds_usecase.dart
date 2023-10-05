import 'package:canary_app/domain/models/backgrounds.dart';
import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class GetBackgroundsUsecase {
  final RoomRepository repository;

  GetBackgroundsUsecase(this.repository);

  Future<Either<Failure, List<Background>>> call() async {
    return await repository.getBackgrounds();
  }
}
