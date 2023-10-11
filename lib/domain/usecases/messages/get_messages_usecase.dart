import 'package:canary_app/domain/models/message.dart';
import 'package:canary_app/domain/repositories/message_repo.dart';
import 'package:dartz/dartz.dart';
import '../../../data/errors/failures.dart';

class GetMessagesUsecase {
  final MessageRepository repository;

  GetMessagesUsecase(this.repository);

  Future<Either<Failure, List<Message>>> call() async {
    return await repository.getMessages();
  }
}
