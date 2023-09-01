import '../../repositories/auth_repo.dart';

class GetStoredTokenUsecase {
  final AuthRepository repository;

  GetStoredTokenUsecase(this.repository);

  Future<String?> call() async {
    return await repository.getStoredToken();
  }
}
