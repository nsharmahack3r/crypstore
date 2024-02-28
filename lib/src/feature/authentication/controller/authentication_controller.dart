import 'package:crypstore/src/feature/authentication/repository/authentication_repository.dart';
import 'package:crypstore/src/feature/home/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authControllerProvider = StateNotifierProvider<AuthenticationController, bool>((ref){
  final repo = ref.watch(authenticationRepoProvider);
  return AuthenticationController(repo: repo);
});

class AuthenticationController extends StateNotifier<bool>{

  final AuthenticationRepository _repo;

  AuthenticationController({
    required AuthenticationRepository repo
  }): _repo = repo, super(false);

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }){
    if(state){
      return;
    }
    state = true;
    _repo.login(email: email, password: password).then((user)=>_handleUser(user:user, context: context));
  }

  void signup({
    required String email,
    required String password,
    required BuildContext context,
  }){
    if(state){
      return;
    }
    state = true;
    _repo.signup(email: email, password: password).then((user)=>_handleUser(user:user, context: context));
  }

  void _handleUser({User? user, required BuildContext context}){
    if(user!=null){
      context.pushReplacement(HomeView.path);
    }
    state = false;
  }
}