import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/features/templates/model/templates.dart';
import 'package:resume_builder/features/templates/viewmodel/templates_view_model.dart';

class ProfessionalTemplate extends ConsumerWidget {
  const ProfessionalTemplate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
      final templates = ref.watch(templatesViewModelProvider);
    final viewModel = ref.read(templatesViewModelProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_){
      viewModel.loadTemplates(Category.professional);
    });

   return Padding(
     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
     child: GridView.builder(
     itemCount: templates.length,
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
     crossAxisSpacing: 8.w,
     mainAxisSpacing: 10.h,
     childAspectRatio: 3 / 4),
     itemBuilder: (context, index){
       final template = templates[index];
       return TemplateCard(template: template);
     },
     ),
   );
  }
}

class TemplateCard extends StatelessWidget {
  final ResumeTemplate template;
  const TemplateCard({super.key, required this.template});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}