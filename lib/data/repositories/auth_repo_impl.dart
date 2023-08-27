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
  Future<Either<Failure, Unit>> logIn(User user) async {
    if (await isConnected) {
      try {
        final remoteUser = await _authRemoteDataSource.logIn(user);
        await _localDataSource.setToken(remoteUser);
        return const Right(unit);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } on NotLogedInException catch (e) {
        return Left(NotLogedInFailure(message: e.message));
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

  @override
  Future<Either<Failure, Profile>> getMyProfile() async {
    if (await isConnected) {
      try {
        if (_localDataSource.getToken() == null) {
          return const Left(NotLogedInFailure());
        } else {
          final remoteUser = await _authRemoteDataSource
              .getMyProfile(_localDataSource.getToken()!);
          return Right(remoteUser);
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      } on NotLogedInException catch (e) {
        return Left(NotLogedInFailure(message: e.message));
      } on Exception catch (e) {
        return Left(UnKnownFailure(message: e.toString()));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
