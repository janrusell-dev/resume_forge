// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/core/utils/platform_utils.dart';
import 'package:resume_builder/features/templates/views/widgets/search_bar_widget.dart';
import 'package:resume_builder/features/templates/views/widgets/top_bar_widget.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {

  
    return PlatformUtils.isIOS
        ? CupertinoPageScaffold(
          child: Column(children: [Text('asjkhlasdfgjhsdhgjfhjgsaddhgjas ')]),
        )
        : Scaffold(
          appBar: AppBar(
            title: Text(
              'Template',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ),
              ),
            ],
          ),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: SearchBarWidget(),
                    ),
                    SizedBox(height: 15.h),
                    TopBarWidget()
                  ],
                ),
              ),
            ),
          ),
        );
  }
}