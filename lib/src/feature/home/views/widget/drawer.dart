import 'package:crypstore/src/feature/authentication/views/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = FirebaseAuth.instance.currentUser!;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Text(user.email!),
            TextButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              context.replace(LoginView.path);
            }, child: const Text('SignOut'),)
          ],
        ),
      ),
    );
  }
}