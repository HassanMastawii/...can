import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';
import '../../models/user.dart';
import '../../repositories/auth_repo.dart';

class GetmyProfileUsecase {
  final AuthRepository repository;

  GetmyProfileUsecase(this.repository);

  Future<Either<Failure, Profile>> call() async {
    return await repository.getMyProfile();
  }
}
