import 'package:canary_app/data/datasources/remote_database/message_remote_repo.dart';
import 'package:canary_app/domain/models/messages/message.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import '../datasources/local_database/local_database.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

class MessageRepository {
  final MessageRemoteDataSource _authRemoteDataSource;
  final LocalDataSource _localDataSource;

  MessageRepository(this._authRemoteDataSource, this._localDataSource);

  Future<bool> get isConnected async => Future.value(
      await Connectivity().checkConnectivity() != ConnectivityResult.none);

  Future<Either<Failure, List<Message>>> getMessages() async {
    if (await isConnected) {
      try {
        if (_localDataSource.getToken() == null) {
          return const Left(NotLogedInFailure());
        } else {
          final remoteUser = await _authRemoteDataSource
              .getMessages(_localDataSource.getToken()!);
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

  Future<Either<Failure, Unit>> postMessage(Message message) async {
    if (await isConnected) {
      try {
        if (_localDataSource.getToken() == null) {
          return const Left(NotLogedInFailure());
        } else {
          final remoteUser = await _authRemoteDataSource.postMessage(
            _localDataSource.getToken()!,
            message,
          );
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
