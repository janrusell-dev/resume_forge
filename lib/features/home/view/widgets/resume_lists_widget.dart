import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder/features/home/viewmodel/resume_view_model.dart';

class ResumeListsWidget extends ConsumerWidget {
  const ResumeListsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final resumes = ref.watch(resumeViewModelProvider);
    ref.read(resumeViewModelProvider.notifier);


  return  ListView.builder(
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
        trailing:  Text(DateFormat("MMMM/dd/yyyy").format(DateTime.now())),
      ),
    );
  },
);
  }
}