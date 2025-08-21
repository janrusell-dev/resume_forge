// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_builder/core/utils/platform_utils.dart';
import 'package:resume_builder/features/templates/viewmodel/templates_view_model.dart';
import 'package:resume_builder/features/templates/views/widgets/top_bar_widget.dart';

class TemplateScreen extends ConsumerWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templates = ref.watch(templatesViewModelProvider);
    
    return PlatformUtils.isIOS
        ? CupertinoPageScaffold(
          child: Column(children: [Text('asjkhlasdfgjhsdhgjfhjgsaddhgjas ')]),
        )
        : Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Select Template',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            centerTitle: true,
            leading: IconButton(onPressed: () {
               if (GoRouter.of(context).canPop()) {
                  context.pop();
                } else {
                  context.go('/home'); 
                }
            } , 
            icon: Icon(Icons.arrow_back)),
          ),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    TopBarWidget()
                  ],
                ),
              ),
            ),
          ),
        );
  }
}