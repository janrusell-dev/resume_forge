import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder/features/home/viewmodel/resume_view_model.dart';

class ResumeListsWidget extends ConsumerWidget {
  const   ResumeListsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasData;
    final resumes = ref.watch(resumeViewModelProvider);
    ref.read(resumeViewModelProvider.notifier);

    if (resumes.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 150.h),
          child: Column(
            children: [
              Icon(Icons.insert_drive_file, size: 100.sp, color: Colors.grey),
              SizedBox(height: 12.h),
              Text(
                'No resumes yet',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                'Tap the + button to create your first resume.',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        Text(
          'My Resumes',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: resumes.length,
          itemBuilder: (context, index) {
            final resume = resumes[index];
            return Card(
              color: Colors.white,
              shadowColor: Colors.black,
              elevation: 2,
              // margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
              child: ListTile(
                leading: Image.asset('assets/images/resume.png'),
                title: Text(resume.name),
                subtitle: Text('Age: ${resume.age}'),
                trailing: Text(
                  DateFormat("MMMM/dd/yyyy").format(DateTime.now()),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
