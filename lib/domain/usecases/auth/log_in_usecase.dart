import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';
import '../../models/user.dart';
import '../../repositories/auth_repo.dart';

class LogInUsecase {
  final AuthRepository repository;

  LogInUsecase(this.repository);

  Future<Either<Failure, User>> call(User user) async {
    return await repository.logIn(user);
  }
}
