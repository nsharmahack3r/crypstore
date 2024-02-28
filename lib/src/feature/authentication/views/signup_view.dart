import 'package:crypstore/src/feature/authentication/controller/authentication_controller.dart';
import 'package:crypstore/src/feature/authentication/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  static const path = "/signup";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(authControllerProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Let's Get Started",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Create an account to continue",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 100,),
            TextFormField(
              controller:  _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText:true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Password"),
              ),
            ),
            const SizedBox(height: 60,),
            loading ? const Center(child: CircularProgressIndicator()) : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    InkWell(
                      onTap: (){
                        context.pushReplacement(LoginView.path);
                      },
                      child: const Text('Login', style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                MaterialButton(
                  onPressed: (){
                    ref.read(authControllerProvider.notifier).signup(
                      email: _emailController.text.trim(), 
                      password: _passwordController.text.trim(), 
                      context: context,
                    );
                  },
                  color: Colors.blue,
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Register", style: TextStyle(fontSize: 18,),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
