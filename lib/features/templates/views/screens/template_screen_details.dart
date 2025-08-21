import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_builder/features/home/model/resume.dart';
import 'package:resume_builder/features/templates/model/resume_data.dart';
import 'package:resume_builder/features/templates/model/templates.dart';
import 'package:resume_builder/features/templates/viewmodel/resume_details_view_model.dart';

class TemplateScreenDetails extends ConsumerStatefulWidget {
  final ResumeTemplate template;
  const TemplateScreenDetails({super.key, required this.template});

  @override
  ConsumerState<TemplateScreenDetails> createState() => _TemplateScreenDetailsState();
}

class _TemplateScreenDetailsState extends ConsumerState<TemplateScreenDetails> {
    final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final summaryController = TextEditingController();
  final educationController = TextEditingController();
  final experienceController = TextEditingController();
  final skillsController = TextEditingController();
  final certificationsController = TextEditingController();
    @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    summaryController.dispose();
    educationController.dispose();
    experienceController.dispose();
    skillsController.dispose();
    certificationsController.dispose();
    super.dispose();
  }

  ResumeData _saveData() {
   return ResumeData(
    fullName: fullNameController.text,
    email: emailController.text,
    address: addressController.text,
    phone: phoneController.text,
    summary: summaryController.text,
    education: educationController.text,
    experience: experienceController.text,
    certifications: certificationsController.text,
    skills: skillsController.text.split(',').map((e) => e.trim()).toList(),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill in your data'),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          final resume = _saveData();
          context.go('/preview', extra: resume);
        },
        child: Container(
          height: 50.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: Colors.blue[900],
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Preview and Export',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              children: [
                Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      'Complete your personal information',
                    ),
                    children: [
                      _textBuild("Full Name", controller: fullNameController),
                      _textBuild("Email", controller: emailController),
                      _textBuild("Address", controller: addressController),
                      _textBuild("Phone Number", controller: phoneController)
                    ],
                  ),
                ),
                 Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      'Write a brief introduction about yourself',
                    ),
                    children: [
                      _textBuild("Professional Summary", maxLines: 3, controller: summaryController),
                    ],
                  ),
                ),
                 Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      'Educational Background',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      'List your academic qualifications',
                    ),
                    children: [
                      _textBuild("Education", maxLines: 3, controller: educationController),
                    ],
                  ),
                ),
                 Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      'Work Experience',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      'Mention your previous job roles and responsibilities',
                    ),
                    children: [
                      _textBuild("Professional Summary", maxLines: 3),
                    ],
                  ),
                ),
                 Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      'Skills',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      'Add your technical and soft skills',
                    ),
                    children: [
                      _textBuild("Professional Summary", maxLines: 3, controller: skillsController),
                    ],
                  ),
                ),
                 Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text(
                      'Certifications & Awards',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      'Include any relevant achievements',
                    ),
                    children: [
                      _textBuild("Certications", maxLines: 3, controller: certificationsController),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _textBuild
  (String label, {int maxLines = 1, TextEditingController? controller}) {
    return Padding(
       padding: EdgeInsets.symmetric(vertical: 5.h),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
