import 'package:dartz/dartz.dart';
import '../../data/errors/failures.dart';
import '../models/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> logIn(User user);
  Future<Either<Failure, Unit>> register(User user);
  Future<Either<Failure, Profile>> getMyProfile();
  Future<String?> getStoredToken();
  Future<Either<Failure, Unit>> logOut();
}
