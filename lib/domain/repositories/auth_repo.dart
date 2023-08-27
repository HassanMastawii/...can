import 'package:dartz/dartz.dart';
import '../../data/errors/failures.dart';
import '../models/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> logIn(User user);
  Future<Either<Failure, User>> register(User user);
  Future<Either<Failure, Profile>> getMyProfile();
}
