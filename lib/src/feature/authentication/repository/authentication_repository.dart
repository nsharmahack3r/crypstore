import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticationRepoProvider = Provider((ref) => AuthenticationRepository());

class AuthenticationRepository {

  Future<User?> login({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  Future<User?> signup({
    required String email,
    required String password,
  }) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }
}