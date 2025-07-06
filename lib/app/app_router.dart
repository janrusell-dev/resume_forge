import 'package:go_router/go_router.dart';
import 'package:resume_builder/features/favorites/view/favorites_screen.dart';
import 'package:resume_builder/features/home/view/home_screen.dart';

import 'package:resume_builder/features/login/view/login_screen.dart';
import 'package:resume_builder/features/onboarding/view/onboarding_screen.dart';
import 'package:resume_builder/features/settings/view/settings_screen.dart';
import 'package:resume_builder/features/templates/views/template_screen.dart';
import 'package:resume_builder/widgets/bottom_nav_bar.dart';


GoRouter createRouter(bool seenOnboarding){
  return GoRouter(
    initialLocation: seenOnboarding ? '/home' : '/onboarding',
    routes: [
      GoRoute(path: '/onboarding',
       builder: (context, state) => OnboardingScreen()),
      GoRoute(path: '/login',
       builder: (context, state) => LoginScreen()),
      ShellRoute(
        builder: (context, state, child){
          return BottomNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => HomeScreen()),
          GoRoute(
            path: '/template',
            builder: (context, state) => TemplateScreen()),
          GoRoute(
            path: '/favorites',
            builder: (context, state) => FavoritesScreen()),
              GoRoute(
            path: '/settings',
            builder: (context, state) => SettingsScreen()),
      ]
      )
    ]
    );
} 