import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_builder/core/utils/platform_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/features/home/view/widgets/resume_lists_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformUtils.isIOS
        ? CupertinoPageScaffold(child: Column())
        : Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.go('/template'),
            icon: Icon(Icons.add),
            label: Text('Create Resume'),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'ResumeForge',  
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
             centerTitle: true,
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Text(
                    '☰  Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                    // navigate to home or do nothing if already there
                  },
                ),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text('My Resumes'),
                  onTap: () {
                    Navigator.pop(context);
                    // Add navigation logic
                  },
                ),
                ListTile(
                  leading: Icon(Icons.cloud_sync),
                  title: Text('Sync with Cloud'),
                  onTap: () {
                    Navigator.pop(context);
                    // Add sync logic
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate to settings
                  },
                ),
                ListTile(
                  leading: Icon(Icons.upload),
                  title: Text('Export All'),
                  onTap: () {
                    Navigator.pop(context);
                    // Add export logic
                  },
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [SizedBox(height: 10.h),
                   ResumeListsWidget()],
                ),
              ),
            ),
          ),
        );
  }
}
