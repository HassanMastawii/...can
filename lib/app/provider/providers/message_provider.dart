import 'package:canary_app/app/provider/states/states.dart';
import 'package:canary_app/app/provider/states/states_handler.dart';
import 'package:canary_app/domain/models/message.dart';
import 'package:canary_app/domain/usecases/messages/get_messages_usecase.dart';
import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier with StatesHandler {
  final GetMessagesUsecase _getMessagesUsecase;

  MessageProvider(
    this._getMessagesUsecase,
    Object object,
  );
  bool isLoading = false;

  Future<ProviderStates> getMessages() async {
    isLoading = true;
    notifyListeners();
    final failureOrMessages = await _getMessagesUsecase();
    isLoading = false;
    notifyListeners();
    return failureOrListToState<Message>(failureOrMessages);
  }

  Future<ProviderStates> postMessage(Message message) async {
    isLoading = true;
    notifyListeners();
    final failureOrMessages = await _getMessagesUsecase();
    isLoading = false;
    notifyListeners();
    return failureOrListToState<Message>(failureOrMessages);
  }
}
