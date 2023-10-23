import 'package:canary_app/domain/models/messages/message.dart';
import 'package:canary_app/domain/repositories/message_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class PostMessagesUsecase {
  final MessageRepository repository;

  PostMessagesUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Message message) async {
    return await repository.postMessage(message);
  }
}
