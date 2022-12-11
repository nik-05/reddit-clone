import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/providers/firebase_providers.dart';
import 'package:reddit_clone/features/auth/repository/auth_repository.dart';

// Auth controller provider which takes auth Repository Provider
final authControllerProvider = Provider(
  (ProviderRef<AuthController> ref) => AuthController(
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signInWithGoogle() {
    _authRepository.signInWithGoogle();
  }
}
