import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/features/onboarding/provider/onboarding_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'app/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  final seenOnboarding = preferences.getBool('seenOnboarding') ?? false;
   
    await SystemChrome  .setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(ProviderScope(overrides: [
    seenOnboardingProvider.overrideWith((ref) => seenOnboarding)
  ],
   child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final seenOnboarding = ref.watch(seenOnboardingProvider);

        return ScreenUtilInit(
          designSize: Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              title: 'Resume Builder',
              theme: ThemeData(     
              ),
              color: Colors.white,
              routerConfig: createRouter(seenOnboarding),
              debugShowCheckedModeBanner: false,
            );
          },
    );
  }
}
