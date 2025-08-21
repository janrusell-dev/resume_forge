import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder/features/onboarding/provider/onboarding_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingViewmodel {
  final Ref ref;
  OnboardingViewmodel(this.ref);

    Future<void> finishOnboarding() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('seenOnboarding', true);

    ref.read(seenOnboardingProvider.notifier).state = true;
    // ignore: use_build_context_synchronously
   
  }
}
 final onboardingViewmodelProvider =
    Provider((ref) => OnboardingViewmodel(ref));