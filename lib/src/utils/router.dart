import 'package:crypstore/src/feature/authentication/views/login_view.dart';
import 'package:crypstore/src/feature/authentication/views/signup_view.dart';
import 'package:crypstore/src/feature/home/views/home.dart';
import 'package:crypstore/src/feature/product/views/product_view.dart';
import 'package:crypstore/src/models/product.dart';
import 'package:crypstore/src/splash.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SplashView.path,
  routes: [
  GoRoute(
    path: HomeView.path,
    builder: (context, state) => const HomeView(),
  ),

  GoRoute(
    path: SplashView.path,
    builder: (context, state) => const SplashView(),
  ),

  GoRoute(
    path: LoginView.path,
    builder: (context, state) => const LoginView(),
  ),
  
  GoRoute(
    path: SignupView.path,
    builder: (context, state) => const SignupView(),
  ),

  GoRoute(
    path: ProductView.path,
    builder: (context, state) => ProductView(product: state.extra as Product,),
  ),
]);