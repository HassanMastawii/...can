import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';
import '../../models/user.dart';
import '../../repositories/auth_repo.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<Failure, User>> call(User user) async {
    return await repository.register(user);
  }
}
