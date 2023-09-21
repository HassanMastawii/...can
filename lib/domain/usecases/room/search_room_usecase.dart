import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class SearchRoomUsecase {
  final RoomRepository repository;

  SearchRoomUsecase(this.repository);

  Future<Either<Failure, List<Room>>> call(String search) async {
    return await repository.searchRoom(search);
  }
}
