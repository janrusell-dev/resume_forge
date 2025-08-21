import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/features/templates/model/templates.dart';
import 'package:resume_builder/features/templates/viewmodel/templates_view_model.dart';
import 'package:resume_builder/features/templates/views/widgets/template_card_widget.dart';
import 'package:shimmer/shimmer.dart';

class CategoryTabPage extends ConsumerStatefulWidget {
  final Category category;
  const CategoryTabPage({super.key, required this.category});

  @override
  ConsumerState<CategoryTabPage> createState() => _CategoryTabPageState();
}

class _CategoryTabPageState extends ConsumerState<CategoryTabPage> {


  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(templatesViewModelProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.loadTemplates(widget.category));
    final templateAsync = ref.watch(templatesViewModelProvider);

    return templateAsync.when(
      loading: () => Center(child: CircularProgressIndicator(),),
      error: (e, _) => Center(child: Text('Error loading template')),
      data: (templates) {
      return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: GridView.builder(
        itemCount: templates.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          final template = templates[index];
          return TemplateCard(template: template);
        },
      ),
      );
      }
    );
    }
}



Widget _buildShimmerGrid() {
  return GridView.builder(
    itemCount: 8,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8.w,
      mainAxisSpacing: 10.h,
      childAspectRatio: 3 / 4,
    ),
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      );
    },
  );
}
