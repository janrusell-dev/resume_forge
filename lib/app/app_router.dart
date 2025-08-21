import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_builder/features/home/view/screens/home_screen.dart';

import 'package:resume_builder/features/login/view/login_screen.dart';
import 'package:resume_builder/features/onboarding/view/onboarding_screen.dart';
import 'package:resume_builder/features/settings/view/settings_screen.dart';
import 'package:resume_builder/features/templates/model/resume_data.dart';
import 'package:resume_builder/features/templates/model/templates.dart';
import 'package:resume_builder/features/templates/views/screens/template_preview_screen.dart';
import 'package:resume_builder/features/templates/views/screens/template_screen.dart';
import 'package:resume_builder/features/templates/views/screens/template_screen_details.dart';
import 'package:resume_builder/widgets/bottom_nav_bar.dart';

GoRouter createRouter(bool seenOnboarding) {
  return GoRouter(
    initialLocation: seenOnboarding ? '/home' : '/onboarding',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(
        path: '/fill-template',
        name: 'fillTemplate',
        builder: (context, state) {
          final extra = state.extra;

          if (extra is! ResumeTemplate) {
            return Scaffold(
              body: Center(child: Text('Error: No template provided')),
            );
          }

          return TemplateScreenDetails(template: extra);
        },
      ),
      // ShellRoute(
      //   builder: (context, state, child){
      //     return BottomNavBar(child: child);
      //   },
      //   routes: [
      //     GoRoute(
      //       path: '/home',
      //       builder: (context, state) => HomeScreen()),
      //     GoRoute(
      //       path: '/template',
      //       builder: (context, state) => TemplateScreen()),
      //         GoRoute(
      //       path: '/settings',
      //       builder: (context, state) => SettingsScreen()),
      // ]
      // // ),
      //           GoRoute(
      //       path: '/home',
      //       builder: (context, state) => HomeScreen()),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: HomeScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(1.0, 0.0); // from right
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        },
      ),
      // GoRoute(
      //   path: '/template',
      //   builder: (context, state) => TemplateScreen()),
      GoRoute(
        path: '/template',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: TemplateScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(1.0, 0.0); // from right
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(path: '/settings', builder: (context, state) => SettingsScreen()),
        GoRoute(
      path: '/preview',
      builder: (context, state) {
         final resume = state.extra;
        if (resume == null || resume is! ResumeData) {
      return const Scaffold(
        body: Center(child: Text('Missing or invalid resume data')),
      );
    }
    return TemplatePreviewScreen(resume: resume as ResumeData);
        
      },
    ),
    ],
  );
}
