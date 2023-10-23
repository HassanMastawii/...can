import 'package:canary_app/domain/models/messages/message.dart';
import 'package:dartz/dartz.dart';
import '../../data/errors/failures.dart';

abstract class MessageRepository {
  Future<Either<Failure, List<Message>>> getMessages();
  Future<Either<Failure, Unit>> postMessage(Message message);
}
