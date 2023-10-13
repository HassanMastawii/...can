import 'package:canary_app/domain/models/gift.dart';
import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class GetGiftsUsecase {
  final RoomRepository repository;

  GetGiftsUsecase(this.repository);

  Future<Either<Failure, List<Gift>>> call() async {
    return await repository.giftList();
  }
}
