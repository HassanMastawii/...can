import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';
import '../../repositories/auth_repo.dart';

class LogOutUsecase {
  final AuthRepository repository;

  LogOutUsecase(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.logOut();
  }
}
