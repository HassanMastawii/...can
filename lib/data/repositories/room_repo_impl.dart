import 'package:canary_app/data/datasources/remote_database/room_remote_repo.dart';
import 'package:canary_app/domain/models/room.dart';
import 'package:canary_app/domain/repositories/room_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../datasources/local_database/local_database.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

class RoomRepositoryImpl implements RoomRepository {
  final RoomRemoteDataSource _authRemoteDataSource;
  final LocalDataSource _localDataSource;

  RoomRepositoryImpl(this._authRemoteDataSource, this._localDataSource);

  Future<bool> get isConnected async => Future.value(
      await Connectivity().checkConnectivity() != ConnectivityResult.none);

  @override
  Future<Either<Failure, Unit>> createRoom(Room room) async {
    if (await isConnected) {
      try {
        if (_localDataSource.getToken() == null) {
          return const Left(NotLogedInFailure());
        } else {
          final remoteUser = await _authRemoteDataSource.createRoom(
              room, _localDataSource.getToken()!);
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

  @override
  Future<Either<Failure, Room>> getRoomInfo(int id) async {
    if (await isConnected) {
      try {
        if (_localDataSource.getToken() == null) {
          return const Left(NotLogedInFailure());
        } else {
          final remoteUser = await _authRemoteDataSource.getRoomInfo(
              id, _localDataSource.getToken()!);
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

  @override
  Future<Either<Failure, List<Room>>> searchRoom(String search) async {
    if (await isConnected) {
      try {
        if (_localDataSource.getToken() == null) {
          return const Left(NotLogedInFailure());
        } else {
          final remoteUser = await _authRemoteDataSource.searchRoom(
              search, _localDataSource.getToken()!);
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
