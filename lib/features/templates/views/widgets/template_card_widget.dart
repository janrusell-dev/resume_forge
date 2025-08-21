
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_builder/features/templates/model/templates.dart';

class TemplateCard extends StatelessWidget {
  final ResumeTemplate template;
  const TemplateCard({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed('fillTemplate', extra: template),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Column(
          children: [
            Expanded(child: 
            Image.asset(
              template.previewImagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            )), 
            Padding(padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Column(
              children: [
                Text(template.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp, color: Colors.indigoAccent[700]),),
                Text(template.category.label, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp, color: Colors.grey[600]),),
              ],
            )),
          ],
        ),
      ),
    );
  }
} 