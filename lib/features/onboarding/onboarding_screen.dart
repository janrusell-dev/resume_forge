import 'package:flutter/material.dart';
import 'package:resume_builder/core/utils/onboarding_state.dart';
import 'package:resume_builder/core/utils/platform_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/features/home/view/widgets/button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  Future<void> finishOnboarding(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('seenOnboarding', true);
    OnboardingState.seenOnboarding.value = true; 
    // ignore: use_build_context_synchronously
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return PlatformUtils.isIOS
        ? Column()
        : SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                SizedBox(height: 0.1.sh,),
                Lottie.asset(
                  'assets/animation/document_animation.json',
                  height: 250.h,
                ),
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
                onPressed: () => finishOnboarding(context),
                
                )
              ],
            ),
          ),
        );
  }
}
