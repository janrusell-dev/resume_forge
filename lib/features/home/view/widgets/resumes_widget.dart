import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumesWidget extends StatelessWidget {
  const ResumesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40.h,
            margin: EdgeInsets.only(right: 5.w), // spacing between buttons
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1), // how wide the shadow spreads
                  blurRadius: 6, // how soft the shadow is
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/resume_profile.png'),
                SizedBox(width: 6.w),
                Text('New Resume', style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 40.h,
            margin: EdgeInsets.only(left: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1), // how wide the shadow spreads
                  blurRadius: 6, // how soft the shadow is
                  offset: Offset(0, 2),
                ),
              ],
            ),
           child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/resume_profile.png'),
                SizedBox(width: 6.w),
                Text('Cover Letter', style: TextStyle(fontSize: 14.sp)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
