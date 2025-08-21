import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:resume_builder/core/utils/platform_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/features/onboarding/provider/onboarding_provider.dart';
import 'package:resume_builder/features/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:resume_builder/widgets/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformUtils.isIOS
        ? Column()
        : SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(height: 0.1.sh,),
                // Lottie.asset(
                //   'assets/animation/document_animation.json',
                //   height: 250.h,
                // ),
                
                SizedBox(height: 0.1.sh,),
                Text(
                  "Build Resumes Easily",
                  style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Create and save job-ready resumes with modern templates and no hassle.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 20.h),
                ButtonWidget(text: 'Get Started',
                height: 40.h,
                width: 200.w,
                color: Colors.blue,
                 textStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14.sp
                ),
                onPressed: () async {
                  await ref.read(onboardingViewmodelProvider).finishOnboarding();
                   context.go('/home');
                },
                )
              ],
            ),
          ),
        );
  }
}
