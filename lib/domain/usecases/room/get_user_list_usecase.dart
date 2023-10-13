import 'package:canary_app/domain/models/user_coin.dart';
import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class GetUserListUsecase {
  final RoomRepository repository;

  GetUserListUsecase(this.repository);

  Future<Either<Failure, List<UserCoin>>> call(int roomid) async {
    return await repository.getUserList(roomid);
  }
}
