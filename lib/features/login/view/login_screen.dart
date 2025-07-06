import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder/core/utils/platform_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformUtils.isIOS ? CupertinoPageScaffold(
      child: Column(
        
      )
      )
     : Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text('Login', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp
          ),)
        ],
      ),
    );
  }
}