import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DocumentTypes extends StatelessWidget {
  const DocumentTypes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NewDocument(
            documentTitle: 'New Resume',
             imagePath: 'assets/images/resume_profile.png',
             onTap: () => context.go('/template'),),
        ),
        Expanded(
          child: NewDocument(
            documentTitle: 'New CV',
             imagePath: 'assets/images/resume_profile.png',
             onTap: () => context.go('/template'),),
        ),

      ],
    );
  }
}

class NewDocument extends StatelessWidget {
  final String documentTitle;
  final String imagePath;
  final VoidCallback onTap;
  const NewDocument({super.key, required this.documentTitle, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: () => onTap(),
            child: Container(
              height: 40.h,
              margin: EdgeInsets.only(left: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),  
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2), 
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
             child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath),
                  SizedBox(width: 6.w),
                  Text(documentTitle, style: TextStyle(fontSize: 14.sp)),
                ],
              ),
            ),
          );
  }
}
