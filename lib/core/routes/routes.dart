
import 'package:go_router/go_router.dart';
import 'package:se7ety/features/splash/splash_screen.dart';

class Routes {
  static const String splashScreen = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';


  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
     
    ],
  );
}
