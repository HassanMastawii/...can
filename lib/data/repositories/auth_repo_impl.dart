import 'package:canary_app/domain/models/profile.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../../domain/models/user.dart';
import '../datasources/local_database/local_database.dart';
import '../datasources/remote_database/auth_remote_repo.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

class AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final LocalDataSource _localDataSource;
  AuthRepository(this._authRemoteDataSource, this._localDataSource);

  Future<bool> get isConnected async => Future.value(
      await Connectivity().checkConnectivity() != ConnectivityResult.none);

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

  Future<Either<Failure, Unit>> register(User user) async {
    if (await isConnected) {
      try {
        final remoteUser = await _authRemoteDataSource.register(user);
        await _localDataSource.setToken(remoteUser);
        return const Right(unit);
      } on RegisterException catch (e) {
        return Left(RegisterFailure(
          message: e.message,
          email: e.email,
          name: e.name,
          password: e.password,
        ));
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

  Future<String?> getStoredToken() async {
    return _localDataSource.getToken();
  }

  Future<String?> getLocale() async {
    return _localDataSource.getLocale();
  }

  Future<void> setLocale(String locale) async {
    return _localDataSource.setLocale(locale);
  }

  Future<Either<Failure, Unit>> logOut() async {
    try {
      return Right(await _localDataSource.removeToken());
    } catch (e) {
      return Left(UnKnownFailure(message: e.toString()));
    }
  }
}
