import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/local_database/local_database.dart';
import '../datasources/remote_database/auth_remote_repo.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final LocalDataSource _localDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._localDataSource);

  Future<bool> get isConnected async => Future.value(
      await Connectivity().checkConnectivity() != ConnectivityResult.none);

  @override
  Future<Either<Failure, User>> logIn(User user) async {
    if (await isConnected) {
      try {
        final remoteUser = await _authRemoteDataSource.logIn(user);
        // remoteUser.password = user.passWord;
        // await _localDataSource.cacheAccount(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } on WrongAuthException catch (e) {
        return Left(WrongAuthFailure(message: e.message));
      } on Exception catch (e) {
        return Left(UnKnownFailure(message: e.toString()));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
