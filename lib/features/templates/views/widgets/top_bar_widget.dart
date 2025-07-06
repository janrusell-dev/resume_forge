import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/features/templates/views/widgets/tab_templates/all_templates.dart';
import 'package:resume_builder/features/templates/views/widgets/tab_templates/minimalist_templates.dart';
import 'package:resume_builder/features/templates/views/widgets/tab_templates/professional_templates.dart';
import 'package:resume_builder/features/templates/views/widgets/tab_templates/simple_templates.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          child: TabBar(
            onTap: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            },
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[500],
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: RectangularIndicator(
              topRightRadius: 20,
              topLeftRadius: 20,
              bottomRightRadius: 20,
              bottomLeftRadius: 20,
              color: Colors.indigoAccent,
              horizontalPadding: 2,
              verticalPadding: 2,
              paintingStyle: PaintingStyle.fill,
              strokeWidth: 5,
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            tabs: const [
              Tab(text: "All"),
              Tab(text: "Professional"),
              Tab(text: "Minimalist"),
              Tab(text: "Simple"),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: double.infinity,
          height: 400.h,
          child: Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                _tabController.animateTo(index);
              },
              physics: BouncingScrollPhysics(),
              children: [
                AllTemplates(),
                ProfessionalTemplate(),
                MinimalistTemplates(),
                SimpleTemplates(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
