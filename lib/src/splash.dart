import 'package:animate_do/animate_do.dart';
import 'package:crypstore/firebase_options.dart';
import 'package:crypstore/src/feature/authentication/views/login_view.dart';
import 'package:crypstore/src/feature/home/views/home.dart';
import 'package:crypstore/src/res/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const path = "/splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          context.pushReplacement(LoginView.path);
        } else {
          context.pushReplacement(HomeView.path);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideInDown(
            child: const Text(
          AppStrings.appName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        )),
      ),
    );
  }
}
