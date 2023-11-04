import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/provider/states/states_handler.dart';
import 'package:canary_app/data/repositories/message_repo_impl.dart';
import 'package:canary_app/domain/models/messages/message.dart';
import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier with StatesHandler {
  final MessageRepository _messageRepository;

  MessageProvider(
    this._messageRepository,
  );
  bool isLoading = false;

  Future<ProviderStates> getMessages() async {
    isLoading = true;
    notifyListeners();
    final failureOrMessages = await _messageRepository.getMessages();
    isLoading = false;
    notifyListeners();
    return failureOrDataToState<List<Message>>(failureOrMessages);
  }

  Future<ProviderStates> postMessage(Message message) async {
    isLoading = true;
    notifyListeners();
    final failureOrDone = await _messageRepository.postMessage(message);
    isLoading = false;
    notifyListeners();
    return failureOrDoneToState(failureOrDone);
  }
}
