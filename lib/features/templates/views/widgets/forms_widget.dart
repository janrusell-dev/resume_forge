// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class FormsWidget extends StatelessWidget {
//   const FormsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//               children: [
//                 Theme(
//                   data: Theme.of(
//                     context,
//                   ).copyWith(dividerColor: Colors.transparent),
//                   child: ExpansionTile(
//                     title: Text(
//                       'Personal Information',
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'Complete your personal information',
//                     ),
//                     children: [
//                       _textBuild("Full Name", controller: fullNameController),
//                       _textBuild("Email", controller: emailController),
//                       _textBuild("Address", controller: addressController),
//                       _textBuild("Phone Number", controller: phoneController)
//                     ],
//                   ),
//                 ),
//                  Theme(
//                   data: Theme.of(
//                     context,
//                   ).copyWith(dividerColor: Colors.transparent),
//                   child: ExpansionTile(
//                     title: Text(
//                       'Summary',
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'Write a brief introduction about yourself',
//                     ),
//                     children: [
//                       _textBuild("Professional Summary", maxLines: 3, controller: summaryController),
//                     ],
//                   ),
//                 ),
//                  Theme(
//                   data: Theme.of(
//                     context,
//                   ).copyWith(dividerColor: Colors.transparent),
//                   child: ExpansionTile(
//                     title: Text(
//                       'Educational Background',
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'List your academic qualifications',
//                     ),
//                     children: [
//                       _textBuild("Education", maxLines: 3, controller: educationController),
//                     ],
//                   ),
//                 ),
//                  Theme(
//                   data: Theme.of(
//                     context,
//                   ).copyWith(dividerColor: Colors.transparent),
//                   child: ExpansionTile(
//                     title: Text(
//                       'Work Experience',
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'Mention your previous job roles and responsibilities',
//                     ),
//                     children: [
//                       _textBuild("Professional Summary", maxLines: 3),
//                     ],
//                   ),
//                 ),
//                  Theme(
//                   data: Theme.of(
//                     context,
//                   ).copyWith(dividerColor: Colors.transparent),
//                   child: ExpansionTile(
//                     title: Text(
//                       'Skills',
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'Add your technical and soft skills',
//                     ),
//                     children: [
//                       _textBuild("Professional Summary", maxLines: 3, controller: skillsController),
//                     ],
//                   ),
//                 ),
//                  Theme(
//                   data: Theme.of(
//                     context,
//                   ).copyWith(dividerColor: Colors.transparent),
//                   child: ExpansionTile(
//                     title: Text(
//                       'Certifications & Awards',
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'Include any relevant achievements',
//                     ),
//                     children: [
//                       _textBuild("Certications", maxLines: 3, controller: certificationsController),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//   }
// }