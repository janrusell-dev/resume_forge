
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/core/utils/platform_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/features/home/view/widgets/card_widget.dart';
import 'package:resume_builder/features/home/view/widgets/resume_lists_widget.dart';
import 'package:resume_builder/features/home/view/widgets/resumes_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return PlatformUtils.isIOS
        ? CupertinoPageScaffold(child: Column())
        : Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding:  EdgeInsets.only(left: 10.w),
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 171, 167, 167)
                  )
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(Icons.person_outline_outlined),
                  
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 171, 167, 167)
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none_outlined),
                  ),
                ),
              ),
            ],
            title: Text('ResumeForge', style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 26
            ),),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h,),
                  //  CardWidget(),
                    SizedBox(height: 10.h),
                    ResumesWidget(),
                    SizedBox(height: 20.h),
                    Text(
                      'My Resumes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ResumeListsWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
